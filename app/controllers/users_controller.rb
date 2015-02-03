class UsersController < ApplicationController
  	def index
  		@users = User.all
 	end
    
    #get    
    def new
    end

  	#post/put
    def create
    @new_user = User.new( user_params )
        if @new_user.save
            redirect_to '/'
        else
            flash[:register_error] = @new_user.errors.full_messages
            redirect_to '/users/new'
        end
    end
    
    #get
    def show
        @one_user = User.find( id_params )
        # puts @one_user.first_name
    end
    
    #get
    def edit
        @id = id_params
        @one_user = User.find( id_params )
    end

    #post/put
    def update
        @update_user = User.find( id_params ).update( user_params )
        if @update_user
            redirect_to '/'
        else
            flash[:edit_error] = "Unsuccessful update: please complete all fields."
            redirect_to '/users/'+id_params+'/edit'
        end
    end

    #post/put
    def destroy
        @delete_user = User.find( id_params )
            # User.find(15).destroy
            # User.destroy(15)
            # User.where(:age => 15).destroy_all
            # User.destroy_all(:age => 15)
        if @delete_user.present?
            @delete_user.destroy
            flash[:delete_success] = "You have successfully deleted the user"
        else
            flash[:delete_error] = @delete_user.errors.full_messages
        end
        redirect_to '/'
    end

	private def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

    private def id_params
        params.require(:id)
    end
end

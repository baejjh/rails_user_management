class UsersController < ApplicationController
  	def index
  		@users = User.all
 	end

    def new
    end

  	def create
    puts "hi"
    @new_user = User.new( user_params )
      if @new_user.save
        redirect_to '/'
      else
        flash[:register_error] = @new_user.errors.full_messages
        redirect_to '/users/new'
      end
    end

	private def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end

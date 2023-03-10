def UsersController < ApplicationController 
    def index 
        @user = User.all 
    end

    def new 
        @user = User.new 
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
        else 
            render 'new'
        end
    end

    private 

    def set_user 
        @user = User.find(params[:id])
    end

    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end



end
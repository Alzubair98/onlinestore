class SessionnsController < ApplicationController 

    def new 
    end

    def create 
        user = User.find_by(email: params[:session][:eamil].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
        end
    end

    def destroy 
        session[:user_id] = nil 
    end
end
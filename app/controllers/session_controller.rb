class SessionController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: email)
        if user && user.authenticate(password)
            session[:user_id] = user.id
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    
    end

    def destroy
        session.delete(:user_id)
    end
end

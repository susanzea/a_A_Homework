class SessionsController < ApplicationController


    def new
        render :new #what does the new session form do?
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ['Invalid Credentials'] #QUESTION: why did the notes have a bracket around value?
            render :new
        end
    end


    def destroy
        logout! #ApplicationController#logout! being called. Resets user's session token and sets the session_token cookie inside of the session 
        flash[:messages] = ["You've Successfully Logged Out!"]
        redirect_to new_session_url #redirects to login page
    end



end

class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
\
    def current_user
        debugger
        @current_user ||= User.find_by(session_token: session[:session_token]) 
    end

    def ensure_logged_in
        redirect_to new_session_url unless logged_in?(current_user)
    end

    def logged_in?
        debugger
        !!current_user #I keep getting that this is nil
    end

    def login!(user)
        @current_user.session_token = User.reset_session_token! #reseting the user's token
        session[:session_token] = @current_user.session_token #setting the session hash's session token cookie to match user's session token
    end

    def logout!
        @current_user.session_token = User.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end







end

class ApplicationController < ActionController::Base
    def current_user
        session[:current_user] ? User.find(session[:current_user]) : nil
    end

    def user_already_signed_in
        return if current_user.nil?

        flash[:notice] = 'Already signed in, sign out if you want to reconnect as another user or create a new account'
        redirect_to root_path
        false
    end

    def user_signed_in
        return unless current_user.nil?

        flash[:notice] = 'Please sign in.'
        redirect_to sign_in_path
        false
    end

end

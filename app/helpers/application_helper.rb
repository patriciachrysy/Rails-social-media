module ApplicationHelper

    def current_user
        session[:current_user] ? User.find(session[:current_user]) : nil
    end

    def display_username(user)
        '@'+user.username if current_user
    end

end

module ApplicationHelper

    def current_user
        session[:current_user] ? User.find(session[:current_user]) : nil
    end

end

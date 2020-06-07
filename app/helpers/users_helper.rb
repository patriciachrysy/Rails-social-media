module UsersHelper
    def following_button(user)
        if current_user.follows?(user)
            render partial: 'users/follows_button', locals: { user: user }
        else
            render partial: 'users/follow_button', locals: { user: user }
        end
    end
end

module UsersHelper
  def following_button(user)
    if current_user.follows?(user)
      render partial: 'users/follows_button', locals: { user: user }
    else
      render partial: 'users/follow_button', locals: { user: user }
    end
  end

  def edit_profile_button(user)
    link_to 'Update my profile', edit_user_path(user) if current_user.id == user.id
  end
end

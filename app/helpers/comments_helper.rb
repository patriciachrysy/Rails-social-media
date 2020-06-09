module CommentsHelper
    def edit_comment_button(opinion, comment)
        link_to 'Edit my comment', edit_opinion_comment_path(opinion, comment)  if current_user && current_user.owns_comment?(comment.id)
    end

    def delete_comment_button(opinion, comment)
        link_to 'Delete my comment', opinion_comment_path(opinion, comment), method: :delete  if current_user && current_user.owns_comment?(comment.id)
    end
end

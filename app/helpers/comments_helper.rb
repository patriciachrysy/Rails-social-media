module CommentsHelper
    def edit_comment_button(opinion, comment)
        link_to '', edit_opinion_comment_path(opinion, comment), class: "fa fa-pencil blue mx-2"  if current_user && current_user.owns_comment?(comment.id)
    end

    def delete_comment_button(opinion, comment)
        link_to '', opinion_comment_path(opinion, comment), method: :delete, class: "fa fa-trash blue mx-2"  if current_user && current_user.owns_comment?(comment.id)
    end
end

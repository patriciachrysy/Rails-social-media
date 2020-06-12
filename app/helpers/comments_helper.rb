module CommentsHelper
  def edit_comment_button(opinion, comment)
    return unless current_user&.owns_comment?(comment.id)

    link_to '', edit_opinion_comment_path(opinion, comment), class: 'fa fa-pencil blue mx-2'
  end

  def delete_comment_button(opinion, comment)
    return unless current_user&.owns_comment?(comment.id)

    link_to '', opinion_comment_path(opinion, comment), method: :delete, class: 'fa fa-trash blue mx-2'
  end
end

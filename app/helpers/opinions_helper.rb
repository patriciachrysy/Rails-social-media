module OpinionsHelper
  def edit_opinion_button(opinion)
    link_to '', edit_opinion_path(opinion), class: 'fa fa-pencil blue mx-2' if current_user&.owns?(opinion.id)
  end

  def delete_opinion_button(opinion)
    return unless current_user&.owns?(opinion.id)

    link_to '', opinion_path(opinion), method: :delete, class: 'fa fa-trash blue mx-2'
  end

  def read_opinion_button(opinion)
    link_to '', opinion.book_link, class: 'fa fa-book blue mx-2' if current_user && opinion.book_link
  end

  def display_comments(opinion)
    render partial: opinion.comments.ordered_by_most_recent
  end

  def liking_opinion_button(opinion)
    return unless current_user

    if current_user.liked?(opinion.id)
      render partial: 'likings/dislike_button', locals: { opinion: opinion,
                                                          liking: opinion.likings.find_by(user_id: current_user.id) }
    elsif current_user.disliked?(opinion.id)
      render partial: 'likings/like_button', locals: { opinion: opinion,
                                                       liking: opinion.likings.find_by(user_id: current_user.id) }
    else
      render partial: 'likings/liking_buttons', locals: { opinion: opinion }
    end
  end
end

module OpinionsHelper
    def edit_opinion_button(opinion)
        link_to 'Edit my opinion', edit_opinion_path(opinion)  if current_user && current_user.owns?(opinion.id)
    end

    def delete_opinion_button(opinion)
        link_to 'Delete my opinion', opinion_path(opinion), method: :delete  if current_user && current_user.owns?(opinion.id)
    end

    def read_opinion_button(opinion)
        link_to 'Read this book', opinion.book_link  if current_user && opinion.book_link
    end

    def display_comments(opinion)
        render partial: opinion.comments.ordered_by_most_recent
    end

    def liking_opinion_button(opinion)
        return unless current_user
        if current_user.liked?(opinion.id)
            render partial: 'likings/dislike_button', locals: { opinion: opinion, liking: opinion.likings.find_by(user_id: current_user.id) }
        elsif current_user.disliked?(opinion.id)
            render partial: 'likings/like_button', locals: { opinion: opinion, liking: opinion.likings.find_by(user_id: current_user.id) }
        else
            render partial: 'likings/liking_buttons', locals: { opinion: opinion }
        end
    end

end

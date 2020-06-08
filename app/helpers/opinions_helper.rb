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

end

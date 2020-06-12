module ApplicationHelper
  def current_user
    session[:current_user] ? User.find(session[:current_user]) : nil
  end

  def display_username(user)
    '@' + user.username if current_user
  end

  def most_popular_posts
    opinions = Opinion.all
    liked_opinions = opinions.select { |opinion| opinion.likes_count.positive? }
    my_hash = {}
    liked_opinions.each do |op|
      my_hash[op.likes_count] = op
    end
    my_hash.sort_by.reverse_each { |key, _value| key }.to_h
  end
end

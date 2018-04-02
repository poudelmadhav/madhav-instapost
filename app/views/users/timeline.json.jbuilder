json.posts do
  json.array! @posts.each do |post|
    json.id post.id
    json.post_photo post.photo
    json.description post.description
    json.post_created_at distance_of_time_in_words(DateTime.now, post.created_at)
    json.user post.user, :id, :name, :photo
    json.comments post.post_comments, :id, :post_id, :user_id, :text
  end
end

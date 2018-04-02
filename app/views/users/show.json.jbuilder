json.id @user.id
json.name @user.name
json.avatar_url @user.photo

json.posts do
	json.array! @user.posts do |post|
		json.post post, :id, :user_id, :description, :photo
		json.comment post.post_comments, :id, :post_id, :user_id, :text
	end
end
json.following_relationships do
  json.array! @user.following_relationships do |following_relationship|
    json.user following_relationship.followed
  end
end
json.followed_relationships do
  json.array! @user.followed_relationships do |followed_relationship|
    json.user followed_relationship.follower
  end
end

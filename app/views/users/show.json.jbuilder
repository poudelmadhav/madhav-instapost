json.id @user.id
json.name @user.name
json.avatar_url @user.photo

json.posts do
	json.array! @user.posts do |post|
		json.post post, :id, :user_id, :description, :photo
		json.comment post.comments, :id, :post_id, :user_id, :text
	end
end

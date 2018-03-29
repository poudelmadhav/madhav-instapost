class Comment < ApplicationRecord
	belongs_to :user

	belongs_to :post
	
	delegate :name, to: :user, prefix: true

	validates :text, :user_id, :post_id, presence: true
end

class PostComment < ApplicationRecord
	belongs_to :user

	belongs_to :post
	
	delegate :name, to: :user, prefix: true

	validates :text, :user_id, :post_id, presence: true

	has_many :notifications, as: :notifiable, dependent: :destroy
end

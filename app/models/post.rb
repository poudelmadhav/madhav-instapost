class Post < ApplicationRecord
	mount_uploader :photo, PhotoUploader

	self.per_page = 3

	belongs_to :user
	
	has_many :post_comments, -> { order(created_at: :asc) }, dependent: :destroy

	has_many :users, through: :post_comments

	validates :description, :user_id, presence: true

	delegate :photo, :name, to: :user, prefix: true

	acts_as_votable

	has_many :notifications, as: :notifiable, dependent: :destroy
end

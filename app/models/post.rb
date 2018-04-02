class Post < ApplicationRecord
	mount_uploader :photo, PhotoUploader

	self.per_page = 3

	belongs_to :user
	
	has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy

	has_many :users, through: :comments

	validates :description, :user_id, presence: true

	delegate :photo, :name, to: :user, prefix: true

	acts_as_votable
end

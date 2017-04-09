class Post < ApplicationRecord
	mount_uploader :photo, PhotoUploader

	self.per_page = 1

	belongs_to :user
	
	has_many :comments, dependent: :destroy

	validates :description, :user_id, presence: true

	delegate :photo, :name, to: :user, prefix: true

	acts_as_votable
end

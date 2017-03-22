class Post < ApplicationRecord
	mount_uploader :photo, PhotoUploader

	belongs_to :user
	
	has_many :comments

	validates :photo, :description, :user_id, presence: true

	acts_as_votable
end

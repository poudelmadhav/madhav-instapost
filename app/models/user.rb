class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :photo, PhotoUploader
  
  # notification
  has_many :notifications, foreign_key: :recipient_id, dependent: :destroy

  has_many :posts, -> { order(created_at: :desc) }, dependent: :destroy

  has_many :post_comments, dependent: :destroy

  acts_as_voter

  has_many :following_relationships, -> { Follow.where(active: true) }, class_name:  "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followed_relationships, -> { Follow.where(active: true) }, class_name:  "Follow", foreign_key: "followed_id", dependent: :destroy

  has_many :following_users, -> { Follow.where(active: true) }, through: :following_relationships, source: :followed
  has_many :followed_users, -> { Follow.where(active: true) }, through: :followed_relationships, source: :follower

  # follow user
  def follow(other_user)
    relationship = Follow.where(followed_id: other_user.id, follower_id: self.id ).first
    if relationship.present?
      relationship.update(active: true) 
    else
      following_relationships.create(followed_id: other_user.id)
      Notification.create(recipient: other_user, actor: self, action: 'follow', notifiable: other_user)
    end
  end

  # unfollow user
  def unfollow(other_user)
    relationship = Follow.where(followed_id: other_user.id, follower_id: self.id)
    relationship.update(active: false) if relationship.present?
    # following_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following that user
  def following?(user)
    Follow.exists?(followed_id: user.id, follower_id: self.id, active: true)
    # following_relationships.exists?(followed_id: user.id)
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :picture, presence: true

  has_many :comments
  belongs_to :user

  mount_uploader :picture, PictureUploader
end

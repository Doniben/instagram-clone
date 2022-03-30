class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :images
  has_many :comments, dependent: :destroy
end

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :like_type, polymorphic: true
end

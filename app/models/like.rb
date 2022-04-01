class Like < ApplicationRecord
  belongs_to :user
  belongs_to :like_type, polymorphic: true
end

=begin class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :user_id, uniqueness: { scope: :post_id }
end =end

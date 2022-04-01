module Followable 
    extend ActiveSupport::Concern
    
    included do
        # Self Join -> 1. follower_relationships 2. following_relationships
        # User has many followers through table follower_relationships via following_id of the other users.
        has_many :follower_relationships, class_name: "Follow", foreign_key: :following_id
        has_many :followers, through: :follower_relationships, source: :follower
        
        # User has many following to other users via follower_id in following_relationships table.
        has_many :following_relationships, class_name: "Follow", foreign_key: :follower_id
        has_many :following, through: :following_relationships, source: :following
    end

    def follow(profile_id)
        following_relationships.create(following_id: profile_id)
    end

    def unfollow(profile_id)
        following_relationships.find_by(following_id: profile_id).destroy
    end

    def is_following?(profile_id)
        relationship = Follow.find_by(follower_id: id, following_id: profile_id)
        return true if relationship
    end
end
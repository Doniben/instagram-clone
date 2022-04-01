class Profile < ApplicationRecord
    after_save :create_avatar

    belongs_to :user

    def create_avatar
        self.update(avatar: Faker::Avatar.image)
    end
end

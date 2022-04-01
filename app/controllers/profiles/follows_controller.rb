class Profiles::FollowsController < ApplicationController
    before_action :set_profile

    def create
        if current_user.follow(@profile.id)
            @profile.reload
            respond_to do |format|
                format.html { redirect_to @profile }
                format.js
            end
        end
    end

    def destroy
        if current_user.unfollow(@profile.id)
            @profile.reload
            respond_to do |format|
                format.html { redirect_to @profile }
                format.js { render action: :create }
            end
        end
    end

    private

    def set_profile
        @profile = Profile.find_by_username(params[:profile_username])
    end
end
# frozen_string_literal: true

class CreateCommentComponent < ViewComponent::Base
  def initialize(post:)
    @post = post
  end

end

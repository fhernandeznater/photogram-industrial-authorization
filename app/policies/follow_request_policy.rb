class FollowRequestPolicy < ApplicationPolicy

attr_reader :current_user, :follow_request

  def initialize(current_user, follow_request)
    @current_user = current_user
    @follow_request = follow_request
  end

  #One should only see a follow request if they sent it or they received it

  def show?
    follow_request.sender == current_user ||
      follow_request.recipient == current_user
  end


end

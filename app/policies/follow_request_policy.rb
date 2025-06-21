class FollowRequestPolicy < ApplicationPolicy

attr_reader :current_user, :follow_request

  def initialize(current_user, follow_request)
    @current_user = current_user
    @follow_request = follow_request
  end

  #One should only see a follow request if they sent it or they received it

  def show?
    follow_request.sender == current_user || follow_request.recipient == current_user
  end

  #One should only make a follow request if they are the sender and they are not the recipient

  def new?
    follow_request.sender == current_user && follow_request.recipient != current_user
  end

  #One should only edit a follow request if they are the sender (the recipient can delete it, but they can't edit it I guess? Does that make sense?)

  def edit?
    follow_request.sender == current_user
  end

  def create?
    follow_request.sender == current_user && follow_request.recipient != current_user
  end

  def update?
    follow_request.sender == current_user
  end

  def destroy?
    follow_request.sender == current_user || follow_request.recipient == current_user 
  end

end

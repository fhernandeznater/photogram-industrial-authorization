class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    true
  end

  #This allows you to see the profile of a private user but not their photos

  def show_photos?
    user == current_user ||
      !user.private? ||
      user.followers.include?(current_user)
  end

  def feed?
    true
  end

  def discover?
    true
  end

  def liked?
    true
  end
end

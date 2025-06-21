class PhotoPolicy < ApplicationPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end


# A photo should only be seen by the owner or followers of the owner, unless the owner is not private in which case anyone can see it

  def show?
    user == photo.owner ||
      !photo.owner.private? ||
      photo.owner.followers.include?(user)
  end

  #You should only edit a photo if you're the owner

  def edit?
    user == photo.owner
  end

  #You should only update a photo if you're the owner

  def update?
    user == photo.owner
  end

  def new?
    user == photo.owner
  end

  def create?
    user == photo.owner
  end

  def destroy?
    user == photo.owner
  end

end 

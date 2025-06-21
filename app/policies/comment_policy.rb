class CommentPolicy < ApplicationPolicy

#attribute reader line goes here:
attr_reader :current_user, :comment

#Let's set up two methods here:

  #First, let's initialize:

  def initialize(current_user, comment)
    @current_user = current_user
    @comment = comment
  end

  #One should only be able to see a comment if they wrote it, if the comment author is a public account, or if the current user follows them

  def show?
    comment.author == current_user ||
      !comment.author.private? ||
      comment.author.followers.include?(current_user)
  end

  def new?
    comment.author == current_user  
  end

  def edit?
    comment.author == current_user
  end

  def create?
    comment.author == current_user
  end

  def update?
    comment.author == current_user
  end

  def destroy?
    comment.author == current_user
  end

end

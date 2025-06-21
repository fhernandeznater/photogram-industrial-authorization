class CommentPolicy < ApplicationPolicy

#attribute reader line goes here:
attr_reader :current_user, :comment

#Let's set up two methods here:

  #First, let's initialize:

  def initialize
  
  end

  #Second, let's make a show method:

  def show?
    true
  end

  def show_comment?
    comment.author == current_user ||
      !comment.author.private? ||
      comment.author.followers.include?(current_user)
  end

end

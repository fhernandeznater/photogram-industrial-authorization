class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed discover ]
  before_action :ensure_current_user_is_user, only: %i[ feed discover ]

  def index
    @users = @q.result
    # Now, how do I implement the Pundit stuff here? Should I keep this starter code or do what the Pundit ReadMe suggests? Wouldn't the latter change the results of the indexing?
  end

  def show
    authorize @user
  end

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end

    def ensure_current_user_is_user
      if current_user != @user
        redirect_back fallback_location: root_url, alert: "You're not authorized for that"
      end
    end

end

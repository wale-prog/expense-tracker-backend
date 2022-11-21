module CurrentUserConcern
  extend ActiveSupport::Concern

  include do
    before_action :set_current_user, only: [:create, :logged_in]
  end

  private
  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end
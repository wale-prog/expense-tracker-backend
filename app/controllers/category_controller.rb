
class CategoryController < ApplicationController

  include CurrentUserConcern

  def index
    user = User.find_by(id: params["user_id"])
    if user
      @categories = user.categories
      render json: @categories
    else
      render json: {user: session[:user_id]}
    end
  end
end


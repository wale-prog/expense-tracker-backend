
class CategoryController < ApplicationController

  include CurrentUserConcern

  def index
    if @current_user
      @categories = @current_user.categories
      render json: @categories
    else
      render json: {user: session[:user_id]}
    end
  end
end


class Api::V1::CategoryController < ApplicationController

  include CurrentUserConcern

  def index
    if @current_user
      @categories = @current_user.categories
      render json: @categories
    else
      render json: {status: 401}
    end
  end

  def create
    category = Category.create(
      name: params["category"]["name"],
      icon_id: params["category"]["icon_id"],
      user_id: params["category"]["user_id"]  
    )
    if category.save
      render json: {
        status: :created,
        category: category
      }
    else
      error = raise error_class(category.errors.full_messages).new
      render json: {
        status: 500,
        error: error
      }
    end
  end
end


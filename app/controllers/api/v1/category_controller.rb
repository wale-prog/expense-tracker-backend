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

  def cat_sum
    @category = Category.find(params["category"]["category_id"])
    if @category
      sum = @category.expenses.sum(:amount)
      render json: {
        status: 200,
        category_expense: sum
      }
    else
      render json: { status: 500 }
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
      render json: {
        status: 500,
      }
    end
  end
end


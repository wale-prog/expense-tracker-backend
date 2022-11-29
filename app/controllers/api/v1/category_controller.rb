
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
end


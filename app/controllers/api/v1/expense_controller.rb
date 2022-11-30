class Api::V1::ExpenseController < ApplicationController
  before_action :set_current_user
  include CurrentUserConcern

  def index
    if @current_user
      expenses = @current_user.expenses.includes
      render json: {
        status: 200,
        expenses: expenses 
      }
    else
      render json: { message: "You need to login to access this page" }
    end
  end

  def create
    expense = @current_user.expenses.create(
      name: params["expense"]["name"],
      amount: params["expense"]["amount"],
      date: params["expense"]["date"],
    )
    if expense.save
      expense.exp_cats.create(
        category_id: params["expense"]["category_id"],
        expense_id: expense.id
        )
      render json: {
        status: :created,
        message: "Expense created successfully",
        expense: expense
      }

    else
      render json: { status: 500 }
    end
  end

end
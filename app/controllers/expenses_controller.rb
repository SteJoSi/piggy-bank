class ExpensesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :authorize
    skip_before_action :authorize, only: [:index, :show]

    # Get /expenses
    def index 
        if params[:user_id]
            render json: user.expenses.order(created_at: :desc), status: :ok
        else
            render json: Expenses.order(created_at: :desc), status: :ok
        end
    end

    # Get /expenses/:id
    def show
        expense = Expenses.find_by(id: session[:user_id])
        render json: expense, status: :ok
    end

    # Post /expenses
    def create 
        expense = Expenses.find_by(id: session[:user_id])
        if authorized_user?(user)
            new_expense = user.expenses.create!(expense_params)
            render json: new_expense, status: :created
        else
            render json: { error: "Unable to create a new expense" }, status: :unauthorized
        end
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors }, status: :unprocessable_entity
    end

    # Patch /expenses/:id
    def update
        expense = Expenses.find_by(id: session[:user_id])
        if authorized_user?(expense.user)
            expense.update!(update_expense_params)
            render json: expense, status: :ok
        else
            render json: { error: "Unable to update expenses at this time" }, status: :unauthorized
        end
    end

    # Delete /expenses/:id
    def destroy
        expense = Expenses.find_by(id: session[:user_id])
        if authorized_user?(expense.user)
            expense.destroy
            render json: expense, status: 200
        else
            render json: { error: "Unauthorized to delete expense" }, status: :unauthorized
        end
    end

    private

    def expense_params
        params.permit(:name, :price)
    end

    def update_expense_params
        params.permit(:name, :price)
    end

    def authorize 
        render json: { error: "Not authorized" }, status: :unauthorized unless session.include?(:user_id)
    end

    def authorized_user?(user)
        user && user.id == session[:user_id]
    end

    def render_not_found_response
        render json: { error: "Record not found" }, status: :not_found
    end

end
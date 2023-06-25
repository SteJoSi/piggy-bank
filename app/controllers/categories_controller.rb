class CategoriesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
skip_before_action :authorize, only: [:index, :show]

# Get /categories
def index 
    categories = Category.all.order(:id)
    render json: categories, include: ['expenses', 'expenses.user']
end

# Get /channels/:id
def show
    category = Categories.find_by(id: session[:user_id])
    render json: category, include: ['expenses', 'expenses.user']
end 

# Post /categories
def create 
    category = Categories.create!(category_params)
    render json: category, status: :created
end

private

def category_params
    params.permit(:name, :budget)
end

def render_not_found_response
    render json: { error: 'Category Not Found' }, status: :not_found
end

end


# TO DO
# create seeds
# do front end stuff 

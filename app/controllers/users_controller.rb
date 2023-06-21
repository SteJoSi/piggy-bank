class UsersController < ApplicationController
    before_action :authorize, except: [:create, :index]

    # Get '/users'
    def index 
        users = User.all 
        render json: users
    end

    # Get /me
    def show 
        user = User.find_by(id: session[:user_id])
        if user 
            render json: user
        else
            render json: { error: "User not found" }, status: :not_found
        end
    end

    # creates a new user with the parameters
    def create 
        user = User.create!(user_params)
        session[:user_id] = user.id
        if user.valid?
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        user = User.find_by(id: session[:user_id])
        if user.update(update_params)
            render json: user
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url)
    end

    def update_params
        params.require(:user).permit(:id, :username)
    end

    def authorize
        unless session[:user_id]
            render json: { error: "Unauthorized" }, status: :unauthorized 
        end
    end

end
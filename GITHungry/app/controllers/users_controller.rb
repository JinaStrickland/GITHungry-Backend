class UsersController < ApplicationController

    def index
        render json: User.all 
    end

    def show 
        render json: find_user
    end

    def create 
        user = User.create(user_params)
        render json: user
    end

    def update 
        recipe.update(find_user)
        render json: user
    end

    def destroy 
        user.destroy 
        render json: {message: "User has been deleted"}
    end

    private

    def find_recipe
        @user = User.find(params[:id])
    end

    def recipe_params
        params.require(:user).permit(:username, :email)
    end

end

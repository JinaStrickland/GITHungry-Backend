class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
        render json: @recipes
    end

    def show 
        render json: find_recipe
    end

    def create 
        @recipe = Recipe.create(recipe_params)
        render json: @recipe
    end

    def update 
        find_recipe
        @recipe.update(recipe_params)
        render json: @recipe
    end

    def destroy 
        recipes = Recipe.all
        @recipe = find_recipe
        if @recipe.destroy
            render json: {
                recipes: recipes, 
                errors: "Recipe has been Deleted",
                success: true
            }
        else 
            render json: {
                success: false,
                errors: recipe.errors.full_messages
            }
        end
    end

    private

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:ingredients, :instructions, :cuisine_type, :title, :cooking_time, :tag, :user_ratings, :servings, :user_comments, :image, :rating)
    end
    
end

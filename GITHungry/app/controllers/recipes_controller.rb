class RecipesController < ApplicationController

    def index
        @recipe = Recipe.all
        @ingredients = Recipe.all.map {|recipe| JSON.parse(recipe.ingredients)}
        @instructions = Recipe.all.map {|recipe| JSON.parse(recipe.instructions)}
        @tags = Recipe.all.map {|recipe| JSON.parse(recipe.tags)}

        render json: Recipe.all 
    end

    def show 
        render json: find_recipe
    end

    def create 
        recipe = Recipe.create(recipe_params)
        render json: recipe
    end

    def update 
        recipe.update(find_recipe)
        render json: recipe
    end

    def destroy 
        recipe.destroy 
        render json: {message: "Recipe has been deleted"}
    end

    private

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:ingredients, :instructions, :cuisine_type, :cooking_time, :tag, :user_ratings, :servings, :user_comments, :image)
    end
    
end

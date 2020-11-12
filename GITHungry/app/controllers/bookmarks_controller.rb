class BookmarksController < ApplicationController

    def index 
        bookmarks = Bookmark.all
        # render json: bookmarks.to_json()
        render json: {
            bookmarks: bookmarks
        }

    end


    def create 
        user = User.first 
        recipe = Recipe.find(params[:recipe_id])
        bookmark = Bookmark.new(user_id: user.id, recipe: recipe)
        if bookmark.save
            render json: {
                bookmark: bookmark, 
                errors: "Recipe is saved to Bookmark",
                success: true
            }
        else 
            render json: {
                success: false,
                errors: bookmark.errors.full_messages
            }
        end
    end


    
end

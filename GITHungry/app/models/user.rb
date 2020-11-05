class User < ApplicationRecord

    has_many :bookmarks
    has_many :recipes, through: :bookmarks
    
end

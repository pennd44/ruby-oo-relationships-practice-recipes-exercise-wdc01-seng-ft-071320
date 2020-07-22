class Recipe
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def recipe_users
        RecipeCard.all.find_all do |recipecard|
            recipecard.recipe == self
        end
    end

    def users
        self.recipe_users.map do |rc|
            rc.user
        end
    end

    def recipe_ingredients
        RecipeIngredient.all.select {|ri| ri.recipe == self} 
    end

    def ingredients 
        self.recipe_ingredients.map {|ri| ri.ingredient}
    end

    def allergens
        allergens_array=[]
        Allergy.all.select do |allergy|
            if self.users.include?(allergy.user)
                allergens_array << allergy.ingredient     
            end
        end
        allergens_array
    end

    def add_ingredients(ingredient)
        if !self.ingredients.include?(ingredient)
            RecipeIngredient.new(self, ingredient)
        end
    end

    def self.most_popular
        most_users_numb = self.all.map {|recipe|recipe.users.count}.max
        self.all.find_all {|recipe| recipe.users.count == most_users_numb}
    end







    
end
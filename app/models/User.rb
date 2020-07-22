class User
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def recipes
        rc_array = RecipeCard.all.select do |rc|
            rc.user == self
        end
        rc_array.map do |rc|
            rc.recipe
        end
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def allergens
        Allergy.all.select {|allergy| allergy.user == self}.map {|allergy| allergy.ingredient}
    end

    def declare_allergy(ingredient)
        if !allergens.include?(ingredient)
            Allergy.new(self, ingredient)
        end
    end

    def recipe_cards
        RecipeCard.all.select do |rc|
            rc.user == self
        end
    end

    def top_three_recipes
        top_three_rc = self.recipe_cards.sort_by {|rc|rc.rating}.last(3)
        top_three_rc.map {|rc|rc.recipe}
    end

    def most_recent_recipe
        self.recipe_cards.sort_by{|rc|rc.date}.last.recipe
    end

    def safe_recipes
        #recipes->ingredients -/->allergy that allergy.user ==self
        #safe_ingredients = Ingredient.all - self.allergens
        Recipe.all.find_all do |recipe|
            (recipe.ingredients & self.allergens).empty?
        end
    end





end
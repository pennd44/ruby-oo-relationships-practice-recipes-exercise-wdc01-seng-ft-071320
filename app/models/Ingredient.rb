class Ingredient
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def allergen_ingredients
        Allergy.all.select {|allergy| allergy.ingredient == self}.map {|allergy| allergy.ingredient}
    end

    def allergen_ingredients_count
        self.allergen_ingredients.count
    end

    def self.most_common_allergen
        self.all.max_by {|ingredient|ingredient.allergen_ingredients_count}
    end

    




end

class RecipeCard
    attr_reader :user, :recipe, :date, :rating
    @@all = []
    def initialize(user, recipe, date, rating)
        @user, @recipe = user, recipe
        @date = Date.parse(date)
        @rating = rating
        @@all << self
    end

    def self.all
        @@all
    end


end
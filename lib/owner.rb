require "pry"
class Owner
  attr_accessor :pets, :name, :cats, :dogs, :fishes
  attr_reader :species
  @@all = []
  def initialize (species)
    @species = species
    @pets = { :cats => [],
      :dogs => [],
      :fishes => []}
      @@all << self
    end

    def self.all
      @@all
    end

    def self.count
      @@all.length
    end

    def self.reset_all
      @@all.clear
    end

    def say_species
      "I am a #{@species}."
    end

    def species
      @species
    end

    def name=(name)
      @name = name
    end

      def buy_fish(name)
        fishy = Fish.new(name)
        self.pets[:fishes] << fishy
        #binding.pry
      end

      def buy_cat(name)
        self.pets[:cats] << Cat.new(name)
      end

      def buy_dog(name)
        self.pets[:dogs] << Dog.new(name)
      end

      def walk_dogs
        self.pets[:dogs].map {|dog| dog.mood = "happy"}

      end

      def play_with_cats
        self.pets[:cats].map {|cat| cat.mood = "happy"}
      end

      def feed_fish
        self.pets[:fishes].map {|fish| fish.mood = "happy"}
      end

      def sell_pets
        self.pets.map {|animal, pets| pets.each {|pet| pet.mood = "nervous"}}
        #binding.pry
        self.pets.each {|animal, pets| pets.clear}
      end

      def list_pets
       "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
      end
    end

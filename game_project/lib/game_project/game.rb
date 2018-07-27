
class GameProject::Game
  #what attributes will an game have
  attr_accessor :title, :rating, :description, :url, :verdict

  @@all = []
 #new which leads to initialize which leads to unsaved or not stored
  def initialize(title, rating, url)
    @title = title
    @rating = rating
    @url = url
    self.save
    # hash.each do |key, value|
    #   self.send("#{key}w", value)
    # end
  end

  def self.all
    @@all
  end

  def save
    self.class.all.push(self)
  end
 #create means a stored object (orsaved)
  # def self.create(hash)
  #   binding.pry
  #   article = self.new(hash)
  #   article.save
  #   article
  #
  # end

  #will accept an array of hashes of attributes of objects
  #{name: "halo Infinite", url: "https: i have no idea.com"}
  # def self.create_from_collection(array)
  #   array.each do |hash|
  #     self.create(hash)
  #   end
  # end

  def self.first_ten
      games = GameProject::Game.all
      games[0 .. 9]
      # binding.pry
    end

end

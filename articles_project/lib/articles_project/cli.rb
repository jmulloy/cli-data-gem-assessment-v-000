class GameProject::CLI
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def call
    puts "loading..."
    GameProject::Scraper.new("http://www.ign.com/reviews/games").scrape
    puts "Welcome to #{self.name}"
    main_menu
  end

  def main_menu
    puts "Type list for a list of games"
    puts "Type exit to exit program"
    input = gets.strip
    if input.downcase == "list"
      list_games
    elsif input.downcase == "exit"
      puts "Thank you for stopping by! Hope to see you soon!"
    else
      invalid
      main_menu
    end
  end

  def list_games
    #itterate through an array or article objects and list their name
    #1. Halo Infinite
    # 2. halo comic
    # 3. HCS recap
    puts "listing games"
    games = GameProject::Game.all
    games.each do |game|
      puts "#{game.title} - #{game.rating}" 

    end
  end

  def invalid
    puts "Incorrect input. Please try again."
  end
end

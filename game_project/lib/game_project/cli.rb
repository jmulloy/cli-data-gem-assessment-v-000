class GameProject::CLI
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def call
    puts "loading..."
    @scraper = GameProject::Scraper.new("http://www.ign.com/reviews/games")
     @scraper.scrape
    puts "Welcome to #{self.name}"
    main_menu
  end

  def main_menu
    terminate = false
    while !terminate
    puts "Type list for a list of games"
    puts "Type exit to exit program"
    input = gets.strip
    if input.downcase == "list"
      list_games
    elsif input.downcase == "exit"
      puts "Thank you for stopping by! Hope to see you soon!"
      terminate = true
    else
      invalid
      main_menu
    end
  end
  end

  def list_games
    puts "listing games"
    games = GameProject::Game.all
    games.each.with_index(1) do |game, number|
      puts "#{number}. #{game.title} - #{game.rating}"
    end
    puts "Please select a number for which game you would like to see"
    input = gets.strip
    index = input.to_i - 1
    if index.between?(0, 24)
      game = GameProject::Game.all[index]
       @scraper.scrape_verdict(game)
      puts game.verdict
      puts "\n\nFor more information: #{game.url}\n\n"
    else
      invalid
    end
  end

  def invalid
    puts "Incorrect input. Please try again."
  end
end

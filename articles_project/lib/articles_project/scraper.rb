class GameProject::Scraper
  attr_accessor :home_page

  def initialize(url)
    self.home_page = url
  end

  def scrape_homepage
    doc = Nokogiri::HTML(open(self.home_page))
    doc.css(".itemList-item").each do |game_doc|
      # binding.pry
      title = game_doc.css(".item-title a").text.strip
      #title
      rating = game_doc.css(".scoreBox-score").text
      GameProject::Game.new(title, rating)

      #rating
    end
    binding.pry
  end

  def scrape
    scrape_homepage
  end
end

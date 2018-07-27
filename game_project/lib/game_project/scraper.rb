class GameProject::Scraper
  attr_accessor :home_page

  def initialize(url)
    self.home_page = url
  end

  def scrape_homepage
    doc = Nokogiri::HTML(open(self.home_page))
    doc.css(".itemList-item").each do |game_doc|

      title = game_doc.css(".item-title a").text.strip
      #title
      rating = game_doc.css(".scoreBox-score").text
      # binding.pry
      url = game_doc.css(".item-title a").attribute("href").value

      GameProject::Game.new(title, rating, url)
      #ADDED COMMENT


    end
  end

  def scrape_verdict(game)
    url = game.url
    doc = Nokogiri::HTML(open(url))
    verdict_text = doc.css("div.verdict-container p")[0].text
    game.verdict = verdict_text
    verdict_text
  end


  def scrape
    scrape_homepage
  end
end

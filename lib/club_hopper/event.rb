class ClubHopper::Event
  attr_accessor :name, :date, :url


  @@all = []

  def self.all 
    @@all 
  end

  def content
    @content ||= ClubHopper::Scraper.new(url).scrape_details
  end

  def f_event
    @f_event
  end


  def self.open_in_browser
    system("open '#{url}'")
  end

def save
  @@all << self 
end

end



 







 






 







 



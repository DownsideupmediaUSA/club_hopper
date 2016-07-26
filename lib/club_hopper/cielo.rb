class ClubHopper::Cielo
  attr_accessor :name, :date

  # @@all = []
 

  # def self.this_friday_cielo   
  # self.scrape_friday_event_cielo
  # end
  
  # def self.this_saturday_cielo   
  # self.scrape_saturday_event_cielo
  # end

  def self.scrape_friday_event_cielo
  events = []
  events << self.scrape_friday_cieloclub 
  end


  def self.scrape_saturday_event_cielo
  events = []
  events << self.scrape_saturday_cieloclub 
  end



  def self.scrape_friday_cieloclub 
  html = Nokogiri::HTML(open("http://cieloclub.com"))
  event = self.new
  event.name = html.css("#main > div.col.col1 > div > ul > li.tfly-event-id-1216617.tfly-org-id-3635.tfly-venue-id-32").text.strip
  event
  end


  def self.scrape_saturday_cieloclub 
  html = Nokogiri::HTML(open("http://cieloclub.com"))
  event = self.new
  event.name = html.css("#main > div.col.col1 > div > ul > li.tfly-event-id-1216105.tfly-org-id-3635.tfly-venue-id-32").text.strip
     
  event
  end






end

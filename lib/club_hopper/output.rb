require 'pry'
class ClubHopper::Output
  attr_accessor :name, :date 
 
  # (july 11) commented out lines 5-10 and incorporated scrape_(day)_event_output into CLI list methods
  # def self.this_friday_output   
  # self.scrape_friday_event_output
  # end

  # def self.this_saturday_output   
  # self.scrape_saturday_event_output
  # end
  
  def self.scrape_friday_event_output
  events = []
  events << self.scrape_friday_outputnyc
  end

  def self.scrape_saturday_event_output
  events = []
  events << self.scrape_saturday_outputnyc
  end

  #****THIS IS A REFACTOR (July 11)*****
  # def self.scrape_output 
    # #--grabs web page
    # doc = Nokogiri::HTML(open("http://outputclub.com/"))
# binding.pry
    #--parses html--
    # parse_page = Nokogiri::HTML(page)
    # events_array = []
    # parse_page = doc.css("")
    #--iterate through parsed content and select next upcoming fridays and saturdays--
    # event_date = event.date select{|post-number for friday or saturday| post... every 7 post numbers?}
    # returns first friday & saturday
    # event_name = event.name select{|post-number-name for friday or saturday| post... every 7 post numbers?}
    # returns names for first friday and saturday only. 
  # end

  #*****END OF REFACTOR(July 11)********

  def self.scrape_friday_outputnyc
  doc = Nokogiri::HTML(open("http://outputclub.com/"))
  # pry.start(binding)
  event = self.new
  event.name = doc.css("#content > article.post-4167.post.type-post.status-publish.format-standard.hentry.category-uncategorized > h1:nth-child(3)").text
  event.date = doc.css("#content > article.post-4167.post.type-post.status-publish.format-standard.hentry.category-uncategorized > h1:nth-child(2)").text  
  
  event
  end

  def self.scrape_saturday_outputnyc
  doc = Nokogiri::HTML(open("http://outputclub.com/"))
  event = self.new
  event.name = doc.css("#content > article.post-4231.post.type-post.status-publish.format-standard.hentry.category-uncategorized > ul > li:nth-child(2) > h2:nth-child(1)").text
  event.date = doc.css("#content > article.post-4231.post.type-post.status-publish.format-standard.hentry.category-uncategorized > h1:nth-child(2)").text

  event
  end

 

end #--class end-->



 







 



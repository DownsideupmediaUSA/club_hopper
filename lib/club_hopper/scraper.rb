class ClubHopper::Scraper

def initialize(url=nil)
  @url = url
end

def scrape_details
  doc = Nokogiri::HTML(open(@url))
  doc.search("li tfly-venue-id-32").text
end

  def scrape_events #<<< only works as class method why?
  #grabs list of all events at cielo
   @doc = Nokogiri::HTML(open("http://cieloclub.com"))
   @doc.search("li.tfly-org-id-3635").each do |e_event|
    # formatted_event = e_event.text.strip
    f_event = ClubHopper::Event.new

    # binding.pry
    f_event.name = e_event.search('a').text.strip
    f_event.url = e_event.search('a').attr('href')
    f_event.date = e_event.search("a span.date").text

    f_event.save 
   end
  end












end

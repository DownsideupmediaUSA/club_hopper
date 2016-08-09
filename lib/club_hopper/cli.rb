class ClubHopper

   def call
     puts "Here's what's goin on at Ceilo!!!"
     ClubHopper::Scraper.new.scrape_events

    list_events
    
     menu
     goodbye  
   end


   def list_events
     puts "Select the number of the event for a link to more info, or 'exit' to exit."
     puts "--------------------------------------------------------"
     ClubHopper::Event.all.each_with_index do |f_event, i|
     puts "#{i+1} #{f_event.name}"
     end 
   end
 

   def menu
     input = ""
     while input != "exit"
       
        input = gets.strip 

        if input.to_i-1 <= ClubHopper::Event.all.size 
        event = ClubHopper::Event.all[input.to_i-1]
         puts "Event: #{event.name}"
         puts "URL: www.cieloclub.com#{event.url}"

         puts "Would you like more info on this event? Y/N or 'exit' to exit."
         answer = gets.strip

         if ["Y", "YES"].include?(answer.upcase)
         open_in_browser
       
         elsif input == "exit"
         goodbye   
         else
         puts "Not sure what you want, take a deep breath...."
         list_events
        end   
      end
     end
   end

   def goodbye
    puts "See you next time for more events at Cielo!!"
    exit
   end

   end

   def goodbye
    puts "See you next time for more events at Cielo!!"
    exit
   end

   end

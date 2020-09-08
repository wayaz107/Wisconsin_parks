
class WisconsinParks::CLI


def start
  park = WisconsinParks::Scrape.new
  park.scrape_website
  park.basic_information   
  welcome
  select_parks
end 

def welcome
  puts ""
  puts "Hi, welcome to the state of Wisconsin National Parks!"
  puts ""
  puts "Here is a list of places to visit in Wisconsin."
  puts ""
end 


def parks_list
  puts ""
  puts "Please type the number of the park you want more information about or type exit."
  puts ""
  @parks = WisconsinParks::Parks.all
  @parks.each do |park|
    puts "#{park.index}. #{park.name}"
  end 
  puts ""
end 

def select_parks
  parks_list
  user_input = gets.strip

  if user_input.to_i.between?(1,@parks.size)
    park_details(@parks[user_input.to_i - 1])
  elsif user_input == "exit"
        goodbye
  else
    puts ""
    puts "Sorry, entry not recognized, please try again and type the correct number of the park or exit."
    puts ""
    select_parks
  end 
end 

def park_details(park)
  puts ""
  puts "#{park.name} seems like a fun place to visit."

  puts ""
  puts "Please enter a number to obtain address, get directions or type exit to select another park."
  puts ""

  puts "1. Address"
  puts "2. Directions"
  user_input = nil

 while user_input != 'exit'
  user_input = gets.strip
  input = user_input.to_i

   if input.between?(1,2) 
    if input == 1
    puts "#{park.address}"
    elsif input == 2
    puts "#{park.directions}"
    end 
elsif user_input == "exit"
    select_parks
else 
   puts "Enter a number or exit"
  end 
 end 
end 

def goodbye
  puts "Thank you for visiting, until next time!"
  exit
end 

end 
 

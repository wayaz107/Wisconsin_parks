
class WisconsinParks::CLI

  attr_accessor :location

def start
  parks = WisconsinParks::Scrape.new
  parks.scrape_website
  parks.basic_information   
  welcome
  select_parks
  goodbye
end 

def welcome
  puts ""
  puts "Hi, welcome to the state of Wisconsin National Parks!"
  puts ""
  puts "Here is a list of places to visit in Wisconsin."
  puts ""
end 

def parks_list

  puts "Please type the number of the park you want more information about or type exit."
  puts ""
  @location = WisconsinParks::Parks.all
  @location.each do|park|
  puts "#{park.index}. #{park.name}"
  end 

end 

def select_parks

  user_input = nil

 while user_input != 'exit'
  parks_list
  user_input = gets.strip
  input = user_input.to_i

  if input.between?(1,@location.size)
  park_details(@location[input - 1])
  elsif !input.between?(1,@location.size) && input != 'exit'
  puts "Please type a number between 1 and 4 or exit."
  end 

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
   else 
   puts "Enter a number or exit"
  end 
 end 
end 

def goodbye
  puts "Thank you for visiting, until next time!"
end 

end 
 

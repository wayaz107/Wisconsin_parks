class WisconsinParks::CLI

attr_accessor :location

def start
   parks = WisconsinParks::Scrape.new
   parks.scrape_website
   parks.basic_information
   welcome
   select_parks

end 

def welcome
 puts "Hi, welcome to National Parks of Wisconsin"
puts "Wisconsin is filled with beautiful parks"
# puts "Here is a list of National Parks in Wisconsin"
end 

 

def parks_list

puts "Please select the park to get more information or type exit"
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
    more_info(@location[input - 1])
elsif !input.between?(1,@location.size)&& input!= "exit"
    puts "Please choose a number between 1 and #{@places.size} or exit"
end 
end 
end 


end 
 

# def more_info(park)
#     puts "#{park.name} seems fun to visit"
#     puts "" 


# end 

require 'open-uri'
require 'pry'

class WisconsinParks::Scrape
attr_accessor :park_information , :park_webpage

def initialize
@park_webpage = "https://www.nps.gov/state/wi/list.htm?program=parks"
@park_information = []
end 


def scrape_website
html = open(@park_webpage)
doc = Nokogiri::HTML(html)
park_names = doc.css("li.clearfix")
park_names.each_with_index do |name, index|
    park_name = name.css("h3 a").text
    park_details = name.at_css('li a:contains(" Basic Information")')

    if park_name != "" && park_details
    @park_information << "#{index + 1},#{park_name},#{park_details["href"]}"
    end 
  end 
end 

def basic_information
    @park_information.each do |i|
      array = i.split(",")
      basic_info = Nokogiri::HTML(open(array[2]))
      address = basic_info.at("//div[@itemprop = 'address']").children.text.squeeze
      directions = basic_info.search("div.directions span").text
    

      if directions.empty?
        directions = "Diections not available."
      end 

    
     
    directions = directions.gsub("Directions Details", "")
    WisconsinParks::Parks.new(array[0], array[1], address, directions)
    end     
end 

end 



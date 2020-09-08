require 'open-uri'
require 'pry'

class WisconsinParks::Scrape


def initialize
  @park_website = "https://www.nps.gov/state/wi/list.htm?program=parks"
  @park_information = []
end 

def scrape_website
  html = open(@park_website)
  doc = Nokogiri::HTML(html)
  park_names = doc.css("li.clearfix")
  park_names.each_with_index do |name, index|
    park_name = name.css("h3 a").text #returns 4 names of the park
    park_details = name.at_css('li a:contains(" Basic Information")') #returns 4 links for each park basic info tab

    if park_name != "" && park_details
    @park_information << "#{index + 1},#{park_name},#{park_details["href"]}"
    end 
  end 
end 

def basic_information
    @park_information.each do |info| #park_information returns a one big array with all 4 parks info
      array = info.split(",")  
      basic_info = Nokogiri::HTML(open(array[2]))
      address = basic_info.at("//div[@itemprop = 'address']").children.text.squeeze
      directions = basic_info.search("div.directions span").text
    

      if directions.empty?
        directions = "Directions not available."
      end 

     WisconsinParks::Parks.new(array[0], array[1], address, directions)
    end     
end 


end 



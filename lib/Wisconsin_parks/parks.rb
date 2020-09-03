class WisconsinParks::Parks

  attr_accessor :name, :directions, :index, :address 

  @@all = []


def initialize(index, name, address, directions)
  @index = index
  @name = name 
  @address = address
  @directions = directions
  save 
end 


def save
  @@all << self
end 

def self.all
  @@all
end 

end 


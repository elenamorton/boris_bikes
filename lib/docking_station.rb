require_relative 'bike'

class DockingStation
  attr_reader :bike, :bike_docked

  def initialize
    @bike_docked = false
  end

  def release_bike
    raise "No bike available!" if !@bike_docked
    
    @bike_docked = false
    Bike.new
  end

  def dock_bike(bike)
    @bike_docked = true
    @bike = bike
  end

  def docking?
    true
  end

end

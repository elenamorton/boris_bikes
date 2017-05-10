require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bike available!" if @bikes.count == 0
    @bikes.pop
  end

  def dock_bike(bike)
    raise "No space available!!" if @bikes.count >= 20
    @bikes << bike
  end

  def docking?
    true
  end

end

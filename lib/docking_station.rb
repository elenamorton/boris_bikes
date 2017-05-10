require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bike available!" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "No space available!!" if full?
    @bikes << bike
  end

private
  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end

  def docking?
    true
  end

end

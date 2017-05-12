require_relative 'bike'

class DockingStation
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @working_bikes = []
  end

  def release_bike
    raise "No Bike Available!" if empty? || all_broken?
    @working_bikes.pop
  end

  def dock_bike(bike)
    raise "No space available!!" if full?
    @bikes.push(bike)
  end

private

  attr_reader :bikes

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

  def all_broken?
    @working_bikes = @bikes.select do |bike|
                      !bike.broken?
                    end
    @working_bikes.empty?
  end

  def docking?
    true
  end

end

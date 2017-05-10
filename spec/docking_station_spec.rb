
require 'docking_station'

describe DockingStation do
  #it 'docking station release bike' do
  #  expect(release_bike()).to eq false
  #end
  it { expect(subject).to respond_to :release_bike }
end

describe DockingStation do

  # it "reset bikes" do
  #   20.times{subject.release_bike}
  #   expect(subject.dock_bike(Bike.new).count).to eq 1
  #   expect(subject.dock_bike(Bike.new).count).to eq 2
  # end

  DEFAULT_CAPACITY = 20

 it "docking station to release bike" do
   subject.dock_bike(Bike.new)
   expect(subject.release_bike).to be_working
 end

 it "Raises an exception if we try to use a bike from empty station" do
   expect {subject.release_bike}.to raise_error("No bike available!")
 end

 it { is_expected.to respond_to(:dock_bike).with(1).argument}
 it { is_expected.to respond_to(:bikes)}

 it "docks something" do
   expect(subject.dock_bike(Bike.new).count).to eq 1
 end

 it "returns bikes at dock station" do
   test_bike = Bike.new
   subject.dock_bike(test_bike)
   expect(subject.release_bike).to eq test_bike
 end

 it "raise an exception if docking more than 20 bikes in one station" do
   DEFAULT_CAPACITY.times{subject.dock_bike(Bike.new)}
   expect{subject.dock_bike(Bike.new)}.to raise_error("No space available!!")
 end

 it "Allows up to 20 bikes to be docked at one time" do
   expect(DEFAULT_CAPACITY.times {subject.dock_bike(Bike.new).count}).to eq DEFAULT_CAPACITY
 end

end

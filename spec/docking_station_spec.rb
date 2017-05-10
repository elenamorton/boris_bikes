
require 'docking_station'

describe DockingStation do
  #it 'docking station release bike' do
  #  expect(release_bike()).to eq false
  #end
  it { expect(subject).to respond_to :release_bike }
end

describe DockingStation do

 it "docking station to release bike" do
   instance = DockingStation.new
   instance.dock_bike(Bike.new)
   expect(instance.release_bike).to be_working
 end

 it "Raises an exception if we try to use a bike from empty station" do
   expect {subject.release_bike}.to raise_error("No bike available!")
 end

 it { is_expected.to respond_to(:dock_bike).with(1).argument}
 it { is_expected.to respond_to(:bike)}

 it "docks something" do
   bike = Bike.new
   expect(subject.dock_bike(bike)).to eq bike
 end

 it "returns bikes at dock station" do
   bike = Bike.new
   subject.dock_bike(bike)
   expect(subject.bike).to eq bike
 end



end

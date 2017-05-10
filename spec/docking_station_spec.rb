
require 'docking_station'

describe DockingStation do
  #it 'docking station release bike' do
  #  expect(release_bike()).to eq false
  #end
  it { expect(subject).to respond_to :release_bike }
end



describe DockingStation do

 it "docking station to release bike" do
   expect(subject.release_bike).to be_working
 end

 it "Raises an exception if we try to use a bike from empty station" do
   20.times{subject.release_bike}
   expect {subject.release_bike}.to raise_error("No bike available!")
 end

 it { is_expected.to respond_to(:dock_bike).with(1).argument}
 it { is_expected.to respond_to(:bikes)}

 it "docks something" do
   subject.release_bike
   expect(subject.dock_bike(Bike.new).count).to eq 20
 end

 it "returns bikes at dock station" do
   5.times{subject.release_bike}
   subject.dock_bike(Bike.new)
   expect(subject.bikes.count).to eq 16
 end

 it "raise an exception if docking more than 20 bikes in one station" do
   expect{subject.dock_bike(Bike.new)}.to raise_error("No space available!!")
 end

 it "Allows up to 20 bikes to be docked at one time" do
   20.times{subject.release_bike}
   expect(20.times {subject.dock_bike(Bike.new)}).to eq 20
 end

end

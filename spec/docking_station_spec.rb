
require 'docking_station'

describe DockingStation do
  #it 'docking station release bike' do
  #  expect(release_bike()).to eq false
  #end
  it { expect(subject).to respond_to :release_bike }
  it { is_expected.to respond_to(:dock_bike).with(1).argument}
  it { is_expected.to respond_to(:capacity)}
end

describe DockingStation do

  # it "reset bikes" do
  #   20.times{subject.release_bike}
  #   expect(subject.dock_bike(Bike.new).count).to eq 1
  #   expect(subject.dock_bike(Bike.new).count).to eq 2
  # end
  describe 'initialisation' do
    subject {DockingStation.new}
    let(:bike) {Bike.new}
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock_bike(bike)
      end
      expect {subject.dock_bike(bike)}.to raise_error "No space available!!"
    end
  end


 it "docking station to release bike" do
   subject.dock_bike(Bike.new)
   expect(subject.release_bike).to be_working
 end

 it "Raises an exception if we try to use a bike from empty station" do
   expect {subject.release_bike}.to raise_error("No bike available!")
 end

 it "docks something" do
   expect(subject.dock_bike(Bike.new).count).to eq 1
 end

 it "returns bikes at dock station" do
   test_bike = Bike.new
   subject.dock_bike(test_bike)
   expect(subject.release_bike).to eq test_bike
 end

 it "raise an exception if docking more than 20 bikes in one station" do
   DockingStation::DEFAULT_CAPACITY.times{subject.dock_bike(Bike.new)}
   expect {subject.dock_bike(Bike.new)}.to raise_error("No space available!!")
 end

 it "raise an exception if docking more than the full capacity." do
   subject.capacity.times {subject.dock_bike(Bike.new)}
   expect {subject.dock_bike(Bike.new)}.to raise_error("No space available!!")
 end

 it "Allows up to Default capacity to be docked at one time" do
   expect(DockingStation::DEFAULT_CAPACITY.times {subject.dock_bike(Bike.new).count}).to eq DockingStation::DEFAULT_CAPACITY
 end

 it "Allows user to set a capacity when creating a new docking station" do
   docking_station = DockingStation.new(30)
   expect(docking_station.capacity).to eq 30
 end

 it "Allows user to set up a docking station with default capacity" do
   expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
 end

end

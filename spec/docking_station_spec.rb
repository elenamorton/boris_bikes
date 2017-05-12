
require 'docking_station'

describe DockingStation do
  #it 'docking station release bike' do
  #  expect(release_bike()).to eq false
  #end
  it { expect(subject).to respond_to :release_bike }
  it { is_expected.to respond_to(:dock_bike).with(1).argument}
  it { is_expected.to respond_to(:capacity)}
#end
#describe DockingStation do
let(:bike) {double(:bike)}
  # it "reset bikes" do
  #   20.times{subject.release_bike}
  #   expect(subject.dock_bike(Bike.new).count).to eq 1
  #   expect(subject.dock_bike(Bike.new).count).to eq 2
  # end
  describe 'initialisation' do
    subject {DockingStation.new}
    #let(:bike) {double(:bike)}
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock_bike(bike)
      end
      expect {subject.dock_bike(bike)}.to raise_error "No space available!!"
    end
  end

 it "Docking station to release working bike" do
   allow(bike).to receive(:working?).and_return(true)
   subject.dock_bike(bike)
   allow(bike).to receive(:broken?).and_return(false)
   released_bike = subject.release_bike
   expect(released_bike).to be_working
 end

 it "check for a broken bike" do
   allow(bike).to receive(:broken?).and_return(true)
   allow(bike).to receive(:report_broken).and_return(true)
   broken_bike = bike.report_broken
   expect(bike).to be_broken
 end

 it "Check report broken" do
   allow(bike).to receive(:report_broken).and_return(true)
   allow(bike).to receive(:broken?).and_return(true)
   subject.dock_bike(bike)
   broken_bike = bike.report_broken
   expect(broken_bike).to eq true
 end

  it "Returns bikes at dock station" do
    test_bike = double(:bike)
    allow(test_bike).to receive(:broken?).and_return(false)
    subject.dock_bike(test_bike)
    expect(subject.release_bike).to eq test_bike
  end


 it "Raises an exception if we try to use a bike from empty station" do
   expect {subject.release_bike}.to raise_error("No Bike Available!")
 end

 it "Docks a bike to the station" do
   expect(subject.dock_bike(double(:bike)).count).to eq 1
 end

 it "Raise an exception if docking more than 20 bikes in one station" do
   DockingStation::DEFAULT_CAPACITY.times{subject.dock_bike(double(:bike))}
   expect {subject.dock_bike(double(:bike))}.to raise_error("No space available!!")
 end

 it "Raise an exception if docking more than the full capacity." do
   subject.capacity.times {subject.dock_bike(double(:bike))}
   expect {subject.dock_bike(double(:bike))}.to raise_error("No space available!!")
 end

 it "Allows up to Default capacity to be docked at one time" do
   expect(DockingStation::DEFAULT_CAPACITY.times {subject.dock_bike(double(:bike)).count}).to eq DockingStation::DEFAULT_CAPACITY
 end

 it "Allows user to set a capacity when creating a new docking station" do
   docking_station = DockingStation.new(30)
   expect(docking_station.capacity).to eq 30
 end

 it "Allows user to set up a docking station with default capacity" do
   expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
 end

 it "Raise an exception if only broken bikes are docked, so nothing to release" do
   bike1 = double
   bike2 = double
   allow(bike1).to receive(:broken?).and_return(true)
   allow(bike2).to receive(:broken?).and_return(true)
   subject.dock_bike(bike1)
   subject.dock_bike(bike2)
   expect {subject.release_bike}.to raise_error("No Bike Available!")
 end

 it "Test: not to release broken bike" do
   bike1 = double
   bike2 = double
   allow(bike1).to receive(:broken?).and_return(false)
   allow(bike2).to receive(:broken?).and_return(true)
   subject.dock_bike(bike1)
   subject.dock_bike(bike2)
   expect(subject.release_bike).to eq bike1
 end
end

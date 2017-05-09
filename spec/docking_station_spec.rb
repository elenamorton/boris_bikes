
require 'docking_station'

describe DockingStation do
  #it 'docking station release bike' do
  #  expect(release_bike()).to eq false
  #end
  it { expect(subject).to respond_to :release_bike }

  it "docking station to release a bike" do
    expect(subject.release_bike).to be_working
  end
end

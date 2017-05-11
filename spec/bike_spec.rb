require 'bike'

describe Bike do
  it { expect(subject).to respond_to :working? }

  it "Allow reporting a broken bike" do
    subject.report_broken
    expect(subject).to be_broken
  end

end

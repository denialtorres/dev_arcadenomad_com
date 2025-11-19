require 'rails_helper'

RSpec.describe Location, type: :model do
  before(:each) do
    @location = build(:location)
  end

  it "Can be instantiated" do
    expect(@location).to be_an_instance_of Location
  end

  it "has a valid factory" do
    expect(Location.new).to be_valid
  end

  it "has a default name of Pizza Works" do
    expect(@location.name).to eq("Pizza Works")
  end

  it "Can be assigned the name of an arcade" do
    location = Location.new
    location.name = "16-Bit Bar"
    expect(location.name).to eq('16-Bit Bar')
  end

  it "assembles a proper address virtual attribute" do
    location = Location.new
    location.name = '16-Bit Bar'
    location.street = '254 South Fourth Street'
    location.city = "Columbus"
    location.state = "Ohio"
    location.zip = "43215"

    expect(location.address).to eq('254 South Fourth Street Columbus, Ohio 43215')
  end

  it "logs location creation after creating a new location" do
    location = build(:location, name: "Test Arcade")

    expect(Rails.logger).to receive(:info).with(/New location \d+ - Test Arcade created/)

    location.save!
  end

  it "normalizes telephone numbers by removing non-numeric characters" do
    location = create(:location, telephone: "(555) 123-4567")

    expect(location.read_attribute(:telephone)).to eq("5551234567")
  end

  it "prevents actual deletion and sets deleted_at timestamp when destroyed" do
    location = create(:location, name: "Test Arcade")

    result = location.destroy
    expect(location.deleted_at).not_to be_nil
  end
end

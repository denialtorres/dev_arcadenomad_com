require 'rails_helper'

RSpec.describe Location, type: :model do
  before(:each) do
    @location = build(:location)
  end

  it "Can be instantiated" do
    expect(@location).to be_an_instance_of Location
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

  # Name validation tests
  it "is invalid without a name" do
    location = build(:location, name: nil)
    expect(location).not_to be_valid
    expect(location.errors[:name]).to include("Please Identify the arcade by name.")
  end

  it "is invalid with a duplicate name" do
    create(:location, name: "Unique Arcade")
    location = build(:location, name: "Unique Arcade")
    expect(location).not_to be_valid
    expect(location.errors[:name]).to include("An arcade by this name already exists.")
  end

  # Description validation tests
  it "is invalid without a description" do
    location = build(:location, description: nil)
    expect(location).not_to be_valid
    expect(location.errors[:description]).to include("can't be blank")
  end

  it "is invalid with description shorter than 10 characters" do
    location = build(:location, description: "Short")
    expect(location).not_to be_valid
    expect(location.errors[:description]).to include("An Location description must consist of at least 10 characters")
  end

  # Zip validation tests
  it "is invalid without a zip code" do
    location = build(:location, zip: nil)
    expect(location).not_to be_valid
    expect(location.errors[:zip]).to include("A zip code is required")
  end

  it "is invalid with incorrect ZIP+4 format" do
    location = build(:location, zip: "12345")
    expect(location).not_to be_valid
    expect(location.errors[:zip]).to include("is not a valid ZIP+4 zip code.")
  end

  # Rating validation tests
  it "is invalid with rating below 0.0" do
    location = build(:location, rating: -1.0)
    expect(location).not_to be_valid
    expect(location.errors[:rating]).to include("must be greater than or equal to 0.0")
  end

  it "is invalid with rating above 5.0" do
    location = build(:location, rating: 6.0)
    expect(location).not_to be_valid
    expect(location.errors[:rating]).to include("must be less than or equal to 5.0")
  end
end

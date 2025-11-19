require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  before(:each) do
    @manufacturer = build(:manufacturer)
  end

  it "can be instantiated" do
    expect(@manufacturer).to be_an_instance_of Manufacturer
  end

  it "has a valid factory" do
    expect(@manufacturer).to be_valid
  end

  # Name uniqueness validation tests
  it "is valid with a unique name" do
    manufacturer = build(:manufacturer, name: "Nintendo")
    expect(manufacturer).to be_valid
  end

  it "is invalid with a duplicate name" do
    create(:manufacturer, name: "Namco")
    manufacturer = build(:manufacturer, name: "Namco")
    expect(manufacturer).not_to be_valid
    expect(manufacturer.errors[:name]).to include("has already been taken")
  end
end

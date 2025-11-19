require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    assign(:location, Location.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

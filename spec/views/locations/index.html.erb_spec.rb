require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(),
      Location.create!()
    ])
  end

  it "renders a list of locations" do
    render
    cell_selector = 'div>p'
  end
end

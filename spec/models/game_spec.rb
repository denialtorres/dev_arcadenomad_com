require 'rails_helper'

RSpec.describe Game, type: :model do
  before(:each) do
    @game = build(:game)
  end

  it "can be instantiated" do
    expect(@game).to be_an_instance_of Game
  end

  it "has a valid factory" do
    expect(@game).to be_valid
  end

  # Release date validation tests
  it "is invalid with release_date before 1970" do
    game = build(:game, release_date: 1969)
    expect(game).not_to be_valid
    expect(game.errors[:release_date]).to include("The release date must be between 1970 and 1989.")
  end

  it "is invalid with release_date after 1989" do
    game = build(:game, release_date: 1990)
    expect(game).not_to be_valid
    expect(game.errors[:release_date]).to include("The release date must be between 1970 and 1989.")
  end

  it "is valid with release_date within valid range" do
    game = build(:game, release_date: 1980)
    expect(game).to be_valid
  end

  it "is valid with release_date at boundary values" do
    game_1970 = build(:game, release_date: 1970)
    game_1989 = build(:game, release_date: 1989)

    expect(game_1970).to be_valid
    expect(game_1989).to be_valid
  end
end

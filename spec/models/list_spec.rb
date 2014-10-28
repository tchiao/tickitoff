require "rails_helper"

describe List do
  it "is valid with valid attributes" do
    expect(List.new).to be_valid
  end
end
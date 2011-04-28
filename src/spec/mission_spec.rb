# encoding: utf-8

require_relative '../mission.rb'

describe Mission do

  before :each do
      @mission = Mission.new
  end

  it "exists" do
    @mission.should_not be_nil
  end

end


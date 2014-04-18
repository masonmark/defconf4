# encoding: utf-8

require_relative '../mission_control_system.rb'

describe MissionControlSystem do

  before :each do
    @mcs = MissionControlSystem.new
    hack_terminal_io
  end
  
  after :each do
    unhack_terminal_io
  end

  it "exists" do
    @mcs.should_not be_nil
  end

end

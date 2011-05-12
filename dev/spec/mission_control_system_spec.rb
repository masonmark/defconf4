# encoding: utf-8

require_relative '../mission_control_system.rb'

describe MissionControlSystem do

  before :all do
    hack_terminal_io
  end

  before :each do
      @mcs = MissionControlSystem.new
  end

  it "exists" do
    @mcs.should_not be_nil
  end

  it "shows main menu upon boot" do
    @mcs.boot
    @mcs.terminal.displayed_text.should == MAIN_MENU
  end

end



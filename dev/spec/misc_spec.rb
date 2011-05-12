# encoding: utf-8

require_relative '../mission.rb'
require_relative '../mission_control_system.rb'
require_relative 'spec_helper.rb'

describe "Initiating DEFCONF4" do

  before :all do
    hack_terminal_io
  end


  context "without any extraneous flags" do
    it "should boot the Mission Control system" do
      p = Pentagon.new
      p.initiate_defconf4
      t = p.mission_control_system.terminal.displayed_text
      t.should =~ /MISSION CONTROL/
    end
  end
  
  describe "with the HELP flag" do
    it "should tell the Commander what his options are"
  end

end


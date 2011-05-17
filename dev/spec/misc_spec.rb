# encoding: utf-8

require_relative '../mission.rb'
require_relative '../mission_control_system.rb'
require_relative 'spec_helper.rb'

describe "Initiating DEFCONF4" do

  before :each do
    @input, @output = hack_terminal_io
  end

  after :each do
    unhack_terminal_io
  end

  context "without any extraneous flags" do
    it "should boot the Mission Control system" do
      p = Pentagon.new
      term = p.mission_control_system.terminal
      term.automated_inputs = ['x','y','z']

      term.should_not be_nil

      p.initiate_defconf4
      t = term.displayed_text
      t.should =~ /DEFCONF4 BOOT MENU/
    end
  end
  
end


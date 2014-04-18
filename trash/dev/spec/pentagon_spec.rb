# encoding: utf-8

require_relative '../pentagon.rb'

describe Pentagon do

  before :all do
    hack_terminal_io
    @p = Pentagon.new
  end

  it "exists" do
    @p.should_not be_nil
  end
  
  it "should provide the Commander access to Mission Control" do
    @p.mission_control_system.should_not be_nil
  end
  
  it "can initiate DEFCONF4" do
    term = @p.mission_control_system.terminal
    term.automated_inputs = ['x','y','z']

    @p.initiate_defconf4
  end


end


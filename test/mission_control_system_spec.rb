require 'stringio'
require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/mission_control_system.rb'


describe MissionControlSystem do


  before :each do
    term        = Terminal.new
    term.input  = StringIO.new("", 'r+')
    term.output = StringIO.new("", 'r+')
    term.automated_inputs = ['x'] 
      # otherwise it will stack overflow, in which case nuke-launching behavior is undefined
    
    @mcs = MissionControlSystem.new
    @mcs.terminal = term
  end
  

  it 'exists' do
    @mcs.wont_be_nil
  end
  
  
  it 'still boots' do
    @mcs.boot
  end


end

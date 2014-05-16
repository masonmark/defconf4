require 'stringio'
require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/minuteman.rb'


describe Minuteman do


  before :each do
    term        = Terminal.new
    term.input  = StringIO.new("", 'r+')
    term.output = StringIO.new("", 'r+')
    
    term.automated_inputs = ['x', 'y'] 
      # otherwise it will stack overflow, in which case nuke-launching behavior is undefined
    
    @m = Minuteman.new
    @m.terminal = term
  end
  

  it 'exists' do
    @m.wont_be_nil
    @m.must_be_instance_of Minuteman
  end
  
  
  it 'can request launch authorization' do
    @m.payload = "/Applications"
    @m.target = "~/foo"
    ok = @m.request_launch_authorization
    ok.must_equal false
  end


end

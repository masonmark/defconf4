require 'stringio'
require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/terminal.rb'


describe Terminal do


  before :each do
    @t        = Terminal.new
    @t.input  = StringIO.new("", 'r+')
    @t.output = StringIO.new("", 'r+')
  end
  

  it "exists" do
    @t.wont_be_nil
  end


  it "can print data" do
    @t.print "foo"
    @t.displayed_text.must_equal "foo"
  end


  it "can read data" do
    @t.read "hoo ride"
    @t.last_input.must_equal "hoo ride"
  end


  it "can have its input automated" do
    @t.automated_inputs = ['foo', 'bar', 'baz', 'slut']
    ['foo', 'bar', 'baz', 'slut'].each {|e| @t.read.must_equal e}
  end


end

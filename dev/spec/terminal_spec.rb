# encoding: utf-8

require 'stringio'

require_relative '../terminal.rb'
require_relative 'spec_helper.rb'

describe Terminal do

  before :all do
    hack_terminal_io
  end

  before :each do
    @t = Terminal.new
  end
  
  it "exists" do
    @t.should_not be_nil
  end

  it "can print data" do
    @t.print "foo"
    @t.displayed_text.should == "foo"
  end

  it "can read data" do
    @t.read "hoo ride"
    @t.last_input.should == "hoo ride"
  end

end


# encoding: utf-8

require_relative '../radio_operator.rb'

describe RadioOperator do
  
  before :each do
    @ro = RadioOperator.new
  end

  it "exists" do
    @ro.should_not be_nil
  end
  
  it "should have a radio" do
    @ro.radio.should_not be_nil
  end
  
  it "can transmit information" do
    @ro.radio = double('radio')
    @ro.radio.should_receive(:tx)

    @ro.send 'some info'
  end

  it "can receive information" do
    q = "is there anybody out there?"
    a = "no there isn't"
    
    @ro.radio = double('radio')
    @ro.radio.should_receive(:tx).with(q)
    @ro.radio.should_receive(:rx).and_return(a)
    
    @ro.receive q
  end
  
  it "can request orders from the commander" do
    pending  
    @ro.radio = double('radio')

  end

end


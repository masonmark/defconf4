# encoding: utf-8

require_relative './radio.rb'

class RadioOperator

  attr_accessor :radio
  
  def initialize
    self.radio = Radio.new
  end
  
  def send(msg)
    radio.tx msg
  end
  
  def receive(msg=nil)
    radio.tx msg unless msg.nil?
    radio.rx
  end
  
end


# encoding: utf-8

require_relative '../radio.rb'

describe Radio do
  
  it "exists" do
    @radio = Radio.new
    @radio.should_not be_nil
  end

end


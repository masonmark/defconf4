# encoding: utf-8

class Terminal

  class << self; attr_accessor :default_input, :default_output end
  
  @@default_input  = nil
  @@default_output = nil
  @input           = nil
  @output          = nil
    # Leave these nil to use STDIN/STDOUT; set explicitly if you need to override (e.g., for specs and test cases). The input should be some type of IO object (IO, StringIO, ???...). 
  
  attr_accessor :displayed_text, :last_input
  
  attr_accessor :automated_inputs

  def initialize
    self.displayed_text = ""
  end

  def print(msg="SYSTEM ERROR")
    output_source ||= @output
    output_source ||= @@default_output
    output_source ||= STDOUT

    self.displayed_text += msg
    output_source.puts msg
  end
  
  def read(input=nil)
    unless self.automated_inputs.nil? or self.automated_inputs.empty?
      return self.last_input = self.automated_inputs.shift
    end
  
    input_source ||= @input
    input_source ||= @@default_input
    input_source ||= STDIN
    
    if input.nil?
      self.last_input = input_source.gets
    else
      self.last_input = input
    end
  end
  
  
  def self.set_default_input(new_input)
    @@default_input  = new_input
  end

  def self.set_default_output(new_output)
    @@default_output  = new_output
  end

end

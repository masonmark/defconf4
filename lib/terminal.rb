# encoding: utf-8


class Terminal


  attr_accessor :input, :output, :automated_inputs
    # Leave these nil to use STDIN/STDOUT; set explicitly if you need to override (e.g., for specs/tests).
  
  attr_accessor :displayed_text, :last_input
  

  def initialize
    self.displayed_text = ""
  end


  def print(msg="SYSTEM ERROR")
    output_source = output || STDOUT
    self.displayed_text += msg
    output_source.puts msg
  end
  
  
  def read(input=nil)
    unless self.automated_inputs.nil? or self.automated_inputs.empty?
      return self.last_input = self.automated_inputs.shift
    end
      
    self.last_input = input || STDIN.gets
  end


  def crash(details=nil)
    print "💣  Unfortunately, Terminal has stopped. #{details}"
  end
  
  
  def activate_intrusion_countermeasures(details='')
    print "💀 "
    print "💀 INTRUSION COUNTERMEASURES ELECTRONICS ACTIVATED."
    print "💀"
    print "💀 你好, 61398部队。"
    print "💀 Your hacking attempts have been detected."
    print "💀 Initiating lethal countermeasures."
    print "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥"
    exit 0xDEAD
    
  end
  
end

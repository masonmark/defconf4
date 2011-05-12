# encoding: utf-8

class Radio

  # A standard-issue radio communicates with the commander via the command-line. 
  # (Using a radio makes it easier to do tests that need mock comms, as we can use a double that does no puts nor gets calls.)

  def tx(msg)
    puts msg
  end
  
  def rx()
    gets
  end

end

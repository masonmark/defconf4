# encoding: utf-8

require_relative "terminal.rb"

MAIN_MENU = "
DEFCONF4 MISSION CONTROL - MAIN MENU

1.) Death to America
2.) Death to Everybody

9.) Help
0.) Do nothing and exit.
"




class MissionControlSystem

  attr_accessor :terminal 
    # the system can be radio-controller in case the Commander is not physically present

  def initialize
    self.terminal = Terminal.new
  end
  
  def boot
    present_options
  end
  
  def present_options
    terminal.print MAIN_MENU
    cmd = terminal.read
  end
  
end

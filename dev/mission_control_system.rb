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
    process_command cmd
  end

  def process_command(cmd)
    puts "COMMAND INPUT RECEIVED: #{cmd}"
    puts "SYSTEM ERROR: invalid commandfuck you
    : #{cmd}"
    abort_retry_fail
  end

  def abort_retry_fail
    puts "[A]bort, [R]etry, [F]ail?"
    process_command STDIN.gets
  end

  # puts '-- Determining correct course of action...'
  # sleep 1
  # puts '-- Confused. Giving up.'
  # sleep 1
  # puts '-- Launching nukes.'
  # sleep 1
  # puts '-- BRZzzt$$#%^@%^&**)))))) )  )   )     )        )'

end

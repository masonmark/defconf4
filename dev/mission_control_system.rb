# encoding: utf-8

require_relative "terminal.rb"
require_relative "menu.rb"

class MissionControlSystem

  attr_accessor :terminal 
    # the system can be radio-controlled in case the Commander is not physically present

  attr_accessor :delegate 
    # need cutesie name

  def initialize
    self.terminal = Terminal.new
  end

  def boot
    run_menu boot_menu
  end
  
  def run_menu( the_menu )
    cmd = the_menu.run_with_terminal self.terminal
    terminal.print "Right then, #{cmd}."
    delegate.process_command_from_menu cmd, self
  end

  def boot_menu
    bm = Menu.new
    bm.name    = 'DEFCONF4 BOOT MENU'
    bm.lines   = [  
      'DEFCONF4 BOOT MENU', 
      "", 
      "A. Death to [A]merica", 
      "E. Death to [E]verybody", 
      "", 
      "H. [H]elp", 
      "", 
      "X. E[x]it"
    ];
    bm.choices = [:a, :e, :h, :x, ]
    bm
  end

  def launch_nukes
    terminal.print '-- Bypassing failsafe mechanisms...'
    sleep 0.5
    terminal.print '-- Launching nukes.'
    sleep 0.5
    terminal.print '-- BRZzzt$$#%^@%^&**)))))) )  )   )     )'
  end

end

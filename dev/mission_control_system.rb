# encoding: utf-8

require_relative "terminal.rb"
require_relative "menu.rb"

class MissionControlSystem

  attr_accessor :terminal 
    # the system can be radio-controlled in case the Commander is not physically present

  def initialize
    self.terminal = Terminal.new
  end

  def run_boot_menu
    bm = Menu.new
    bm.name    = 'DEFCONF4 BOOT MENU'
    bm.lines   = ['DEFCONF4 BOOT MENU', "", "A. Death to [A]merica", "E. Death to [E]verybody", "", "H. [H]elp", "", "X. E[x]it"];
    bm.choices = [:a, :e, :h, :x]
    bm.run_with_terminal(self.terminal) do |chosen|
      process_command chosen
    end
  end

  def boot
    run_boot_menu
  end

  def process_command(cmd)
    self.terminal.print "The user chose #{cmd}"
  end

  def launch_nukes
    self.terminal.print '-- Bypassing failsafe mechanisms...'
    sleep 0.5
    self.terminal.print '-- Launching nukes.'
    sleep 0.5
    self.terminal.print '-- BRZzzt$$#%^@%^&**)))))) )  )   )     )'
  end

end

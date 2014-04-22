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
    terminal.print ""
    terminal.print "☆ COMMAND ACCEPTED: #{cmd}."
    terminal.print ""
    
    if delegate.nil?
      self.terminal.print 'Looking for delegate...'
      self.terminal.print 'Looking for delegate......'
      self.terminal.print 'Looking for delegate.........'
      self.terminal.crash 'No delegate, man. GAME OVER MAN!'
    else
      delegate.process_command_from_menu cmd, self
    end
  end

  def boot_menu
    bm = Menu.new
    bm.name    = 'DEFCONF4 BOOT MENU'
    bm.lines   = [  
      '',
      '★ ☆ ★',
      '☆',
      '★  - DEFCONF4 MENU -',
      '☆',
      "★  R. [R]econnaisance", 
      "☆  E. [E]xfiltrate", 
      '★',
      "☆  N. [N]uke", 
      '★',
      "☆  A. [A]rmageddon", 
      "★", 
      "☆",
      '★  X. E[x]it',
      '☆',
      '★ ☆ ★',
      ''
    ];
    bm.choices = {r: :recon, e: :exfiltrate, n: :nuke, a: :armageddon, x: :exit}
    bm
  end

end

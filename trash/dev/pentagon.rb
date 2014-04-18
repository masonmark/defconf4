# encoding: utf-8

require_relative "./mission_control_system.rb"
require_relative "./reconnaissance_drone.rb"

class Pentagon

  attr_accessor :mission_control_system

  def initialize
    self.mission_control_system     = MissionControlSystem.new
    mission_control_system.delegate = self 
  end
  
  def initiate_defconf4
    mission_control_system.boot
  end

  def process_command_from_menu( cmd, menu )
    mission_control_system.terminal.print "Initiating #{cmd} operation..."
    
    case cmd
      when :recon
        drone = ReconnaissanceDrone.new
        drone.terminal = mission_control_system.terminal
        drone.launch
        
      when :exfiltrate
        raise "ain't done implemented #{cmd} yet"
    
      when :nuke
        raise "ain't done implemented #{cmd} yet"
    
      when :armageddon
        raise "ain't done implemented #{cmd} yet"
    
      when :exit
        mission_control_system.terminal.print "Quitting already? You fuckin' pussy."
        Process.exit
    
      else
        raise "WHAT HAPPEN! It seems highly probable that someone set up us the bomb."
    end
  end
  
end

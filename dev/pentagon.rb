# encoding: utf-8

require_relative "./mission_control_system.rb"

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
    puts "#{self} got cmd #{cmd} from menu #{menu}"
  end
  
end

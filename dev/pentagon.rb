# encoding: utf-8

require_relative "./mission_control_system.rb"

class Pentagon

  attr_accessor :mission_control_system

  def initialize
    self.mission_control_system = MissionControlSystem.new
  end
  
  def initiate_defconf4
    self.mission_control_system.boot
  end

end


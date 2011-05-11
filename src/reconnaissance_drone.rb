# encoding: utf-8

require 'date'

class ReconnaissanceDrone

  attr_accessor :launch_date, :mission_status

  def launch()
    self.launch_date = DateTime.new
  end
  
end


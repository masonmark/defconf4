# encoding: utf-8

require 'date'

require_relative 'warzone.rb'

class ReconnaissanceDrone

  attr_accessor :launch_date, :mission_status, :terminal

  def launch()
    self.launch_date = DateTime.new
    log "New recon drone launched."
    
    p = '/Users/mason/Documents/mason-config-files'
      # call your doctor if you experience hardcoding lasting more than four hours
    
    list = Dir.entries p
    list.reject! {|i| i == '.' or i == '..' or i[0] == '.' or i[0] == '@'}
    list.map! {|i| "#{p}/#{i}"}
    #puts list
    
    for t in list
      z = Warzone.new(t)
      if z.harboring_terrorists
        log "ENEMY INSURGENT ACTIVITY detected: #{z.name}"
      else
        log "OK: #{z.name}"
      end
    end 

    log "Recon completed. Returning to base."
  end
  
  def log(msg)
    terminal.print msg unless terminal.nil?
  end
  
end


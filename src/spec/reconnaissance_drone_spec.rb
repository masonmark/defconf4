# encoding: utf-8

require_relative '../reconnaissance_drone.rb'
require_relative '../mission.rb'

describe ReconnaissanceDrone do

  before :each do
      @drone = ReconnaissanceDrone.new
  end

  it "exists" do
    @drone.should_not be_nil
  end

  it "can launch" do
    @drone.launch
    @drone.launch_date.should_not be_nil
  end
  
  it "can reconnoiter targets" do
    path_to_silo    = path_to_defconf4 + "src" + "fuxtures" + "silo_1"
    path_to_target  = path_to_defconf4 + "src" + "fuxtures" + "silo_1"
    
    mission         = Mission.new
    mission.silo    = path_to_silo.to_s
    mission.target  = path_to_target.to_s
    @drone.missions = [mission]

    @drone.launch
    
    @drone.mission_status.should == :mission_accomplished
      # well, we have to expect a tad more of @drone to really verify that he can do recon...
    
  end

end

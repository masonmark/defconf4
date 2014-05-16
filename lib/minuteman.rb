require_relative 'terminal'
require_relative 'menu'

class Minuteman
  
  attr_accessor :payload, :target, :terminal
  
  
  
  
  def request_launch_authorization()
    # Advise commanders of potential for civilian casualties, and ask for true or false decision on launch.
        
    auth_req_menu = Menu.new
    auth_req_menu.lines = [
      'WARNING: Existing civilian population will be annihilated: ',
      '',
      "    #{target}",
      '',
      'OK to proceed with launch?'
    ]
    auth_req_menu.choices = {y: true, n:false}
    
    auth_req_menu.run_with_terminal terminal
    
    auth_req_menu.value
  end
    
    
  def initiate_launch
    
  end
    
end
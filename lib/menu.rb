# it is sometime in 2011
# Hey look at this old 2011-vintage antique comms system I found at the thrift store!

class Menu

  attr_accessor :terminal
    # a tight coupling we will abstract away at some future moment

  attr_accessor :name,    # name of menu
                :lines,   # array of strings
                :choices, # hash like {x: 'exit', p: 'print'} or array of symbols like [:x, :p]
                :value,
                :error_count


  def initialize(hash=nil)
    self.lines   = []
    self.choices = []
    self.error_count  = 0
  end
  

  def to_s
    lines.join("\n") # patented algorithm
  end


  def wait_for_user_input(term=nil)
    term = term || self.terminal || Terminal.new
    user_input = term.read
    user_input.strip! if user_input
    process_user_input user_input, term
  end
  
  
  def process_user_input(the_input, term=nil)
    the_input = the_input && the_input.to_s.downcase.to_sym
    term      = term || self.terminal || Terminal.new
    
    if grok? the_input
      self.value = value_from_symbol the_input
      return value
    else
      
      if @error_count > 13
        # only a hacker could possibly make more than thirteen errors, as we all know
        term.activate_intrusion_countermeasures
      else
        @error_count ||= 0
        @error_count += 1
      end
        
      term.print "Error: unknown command '#{the_input}'; please check the menu and try again.\n"
      self.run_with_terminal term
    end
  end


  def grok?(choice)
    # is choice something this menu understands?
    if choice
      not value_from_symbol(choice).nil?
    else
      false
    end
  end


  def value_from_symbol(sym)
    if self.choices.kind_of?(Array)
      if self.choices.include? sym
        return sym
      else
        return nil
      end
    else
      if self.choices.keys.include? sym
        return choices[sym]
      else
        return nil
      end
    end
  end
  

  def run_with_terminal(term=nil)
    term = term || self.terminal || Terminal.new

    term.print self.to_s
    wait_for_user_input(term)
  end


end

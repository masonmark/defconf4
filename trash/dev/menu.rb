# encoding: utf-8

# it is sometime in 2011

class Menu

  attr_accessor :terminal
    # a tight coupling we will abstract away at some future moment

  attr_accessor :name,    # name of menu
                :lines,   # array of strings
                :choices, # hash like {x: 'exit', p: 'print'} or array of symbols like [:x, :p]
                :value

  def initialize(hash=nil)
    self.lines   = []
    self.choices = []
  end

  def to_s
    lines.join("\n")
  end

  def wait_for_user_input(term=nil)
    term ||= self.terminal
    process_user_input term.read.strip, term
  end
  
  def process_user_input(the_input, term=nil)
    the_input = the_input.to_s.downcase.to_sym
    term ||= self.terminal
    if grok? the_input
      self.value = value_from_symbol the_input
      return value
    else
      term.print "Error: unknown command '#{the_input}'; please check the menu and try again.\n"
      self.run_with_terminal term
    end
  end

  def grok?(choice)
    #is choice something this menu understands?
    not value_from_symbol(choice).nil?
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
    term ||= self.terminal

    term.print self.to_s
    wait_for_user_input(term)
  end

end

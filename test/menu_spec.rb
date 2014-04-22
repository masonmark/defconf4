require 'stringio'
require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/menu.rb'
require_relative '../lib/terminal.rb'


describe Menu do

  before :each do
    @menu          = Menu.new
    @menu.name     = 'my manual menu'
    @menu.lines    << 'line 1'
    @menu.lines    << 'line 2'
    @menu.choices  = {a: :choice_a, b: :choice_b}

    term           = Terminal.new
    term.input     = StringIO.new("", 'r+')
    term.output    = StringIO.new("", 'r+')

    @menu.terminal = term
  end

  
  it 'exists' do
    m = Menu.new
    m.wont_be_nil
    m.must_be_instance_of Menu
  end
  

  it "implements to_s()" do
    @menu.to_s.must_equal "line 1\nline 2"
  end


  it "can map user input to the right value" do
    @menu.process_user_input("b")
    @menu.value.must_equal :choice_b
  end

  
  it "isn't case sensitive with respect to user input" do
    @menu.process_user_input("B")
    @menu.value.must_equal :choice_b
  end


  it 'can transform a symbol to a value, if given a hash of choices' do
    @menu.choices = [:a, :b, :c]
    @menu.value_from_symbol(:a).must_equal :a # no transform happens when choices is a plain array
    @menu.value_from_symbol(:x).must_be_nil
    @menu.choices = {a: 'foo', b: 'bar', c: 'baz'}
    @menu.value_from_symbol(:a).must_equal 'foo' # but it does when you feed it a hash
    @menu.value_from_symbol(:x).must_be_nil
  end
  
  
  it "can be run with a terminal supplied" do
    alternate_terminal = Terminal.new
    alternate_terminal.automated_inputs = ['a']
    alternate_terminal.output = StringIO.new("", 'r+')
    @menu.run_with_terminal alternate_terminal
    @menu.value.must_equal :choice_a
  end
  

end

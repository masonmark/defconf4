# encoding: utf-8

require_relative '../menu.rb'
require_relative '../terminal.rb'
require_relative 'spec_helper.rb'

def create_test_menu_1
    m = Menu.new
    m.name = 'my manual menu'
    m.lines << 'line 1'
    m.lines << 'line 2'
    m.choices = {a: :choice_a, b: :choice_b}
    m.terminal = Terminal.new
    m
end

describe Menu do

  before :each do
    hack_terminal_io
    @menu = Menu.new
    @menu.terminal = Terminal.new
  end

  after :each do
    unhack_terminal_io
  end

  it "exists" do
    @menu.should_not be_nil
  end
    
  it "can be manually initialized" do
    m = create_test_menu_1    
    m.to_s.should == "line 1\nline 2"
  end

  it "implements to_s()" do
    create_test_menu_1.to_s.should == "line 1\nline 2"
  end
  
  it "can map user input to the right value" do
    m = create_test_menu_1
    m.process_user_input("b")
    m.value.should == :choice_b
  end

  it "isn't case sensitive wrt user input" do
    m = create_test_menu_1    
    m.process_user_input("B")
    m.value.should == :choice_b
  end

  it 'can transform a symbol to a value, if given a hash of choices' do
    m = create_test_menu_1    
    m.choices = [:a, :b, :c]
    m.value_from_symbol(:a).should == :a # no transform happens when choices is a plain array
    m.value_from_symbol(:x).should be_nil
    m.choices = {a: 'foo', b: 'bar', c: 'baz'}
    m.value_from_symbol(:a).should == 'foo' # but it does when you feed it a hash
    m.value_from_symbol(:x).should be_nil
  end

  it "can be run with a terminal supplied" do
    alternate_terminal = Terminal.new
    alternate_terminal.automated_inputs = ['a']
    m = create_test_menu_1
    m.run_with_terminal alternate_terminal
    m.value.should == :choice_a
  end

end

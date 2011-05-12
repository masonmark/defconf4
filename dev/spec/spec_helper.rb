def hack_terminal_io
  $hack_terminal_fake_output  = ""
  Terminal.set_default_input  StringIO.new("foo bar baz")
  Terminal.set_default_output StringIO.new($hack_terminal_fake_output, 'r+')
end
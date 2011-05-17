def hack_terminal_io
  input_io  = StringIO.new("", 'r+')
  output_io = StringIO.new("", 'r+')
  Terminal.set_default_input input_io
  Terminal.set_default_output output_io

  return input_io, output_io
end

def unhack_terminal_io
  Terminal.set_default_input  nil
  Terminal.set_default_output nil
end
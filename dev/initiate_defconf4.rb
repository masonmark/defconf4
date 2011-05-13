#! /usr/bin/env ruby
# encoding: utf-8

require 'slop'

opts = Slop.parse do
  option :v, :verbose
  option :h, :help
end

# opts = opts.to_hash

if opts.help? # or, opts[:help]
  puts "DEFCONF4 usage:"
  puts opts.help
else
  puts '☢ DEFCONF4 INITIATED ☢'
  if opts.verbose?
    puts '- Verbose mode is enabled.'
    puts "-- Executed with options:\n#{opts}"
  end
  puts '-- Determining correct course of action...'
  sleep 1
  puts '-- Confused. Giving up.'
  sleep 1
  puts '-- Launching nukes.'
  sleep 1
  puts '-- BRZzzt$$#%^@%^&**)))))) )  )   )     )        )'
end

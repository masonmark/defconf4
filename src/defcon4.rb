#! /usr/bin/env ruby
# encoding: utf-8

require 'slop'

puts '☢ DEFCONF4 INITIATED ☢'


opts = Slop.parse do
  option :v, :verbose
  option :h, :help
end

# opts = opts.to_hash

if opts.help? # or, opts[:help]
  puts opts.help
else
  if opts.verbose?
    puts '- Verbose mode is enabled.'
  end
  puts '-- Determining correct course of action...'
  sleep 1
  puts '-- Confused. Giving up.'
  sleep 1
  puts '-- Launching nukes.'
  sleep 1
  puts '-- BRZzzt$$#%^@%^&**)))))) )  )   )     )        )'
end


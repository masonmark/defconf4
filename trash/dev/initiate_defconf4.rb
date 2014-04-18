#! /usr/bin/env ruby
# encoding: utf-8

require 'slop'
require_relative 'pentagon.rb'

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
  
  p = Pentagon.new
  p.initiate_defconf4
end

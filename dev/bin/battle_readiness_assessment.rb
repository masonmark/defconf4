#!/usr/bin/env ruby -w
#encoding: utf-8

require 'pathname'

path_to_me       = Pathname.new(File.expand_path(__FILE__))
path_to_defconf4 = path_to_me.parent.parent.parent
path_to_src      = path_to_defconf4 + "dev"

Dir.chdir path_to_src 

puts ""
puts "☆★☆ DEFCONF4 BATTLE READINESS REPORT: ☆★☆"

cmd = "PATH=#{ENV['PATH']}:$PATH ; bundle exec rspec --color --format documentation"

if ARGV.length == 0
  cmd += " spec" 
else
  ARGV.each { |arg| cmd += " #{arg}" }
end 

# puts "Will execute command as follows: #{cmd} (#{ARGV})"

Kernel.exec cmd

#!/usr/bin/env ruby
#encoding: utf-8

require 'pathname'
require 'securerandom'

PATH_TO_ME      = Pathname.new File.expand_path(__FILE__)
PATH_TO_HOME    = Pathname.new File.expand_path('~')
INVOCATION_NAME = PATH_TO_ME.basename


def think
  "Hmm... #{SecureRandom.hex(13)}"
end


begin
  
  thought = think  
  puts thought

rescue => e
  puts "💀  FATAL: #{e}"
  raise e
end

#!/usr/bin/env ruby
#encoding: utf-8

require 'pathname'
require 'securerandom'

PATH_TO_ME      = Pathname.new File.expand_path(__FILE__)
PATH_TO_HOME    = Pathname.new File.expand_path('~')
INVOCATION_NAME = PATH_TO_ME.basename
PATH_TO_ROOT    = PATH_TO_ME.parent
PATH_TO_LIB     = PATH_TO_ROOT + 'lib'

$LOAD_PATH << PATH_TO_LIB

require 'icbm'
require 'mission_control_system'

def think
  
  puts "PATH_TO_ME      #{PATH_TO_ME}"
  puts "PATH_TO_HOME    #{PATH_TO_HOME}"
  puts "INVOCATION_NAME #{INVOCATION_NAME}"
  "Hmm... #{SecureRandom.hex(13)}"
end


begin
  
  thought = think  
  puts thought
  

  mcs = MissionControlSystem.new
  
  mcs.boot

rescue => e
  puts "💀  FATAL: #{e}"
  raise e
end

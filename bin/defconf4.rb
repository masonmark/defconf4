#!/usr/bin/env ruby -w
#encoding: utf-8

require 'pathname'

path_to_me       = Pathname.new(File.expand_path(__FILE__))
path_to_defconf4 = path_to_me.parent.parent
path_to_src      = path_to_defconf4 + "dev"

Dir.chdir path_to_src 

cmd = "PATH=#{ENV['PATH']}:$PATH ; bundle exec ./initiate_defconf4.rb"
  # If we don't capture the PATH and pass it to the exec environment, Bundler will puke blood if it happens to be invoked on a system that uses rvm or otherwise has ruby at some whacked out location.

ARGV.each { |arg| cmd += " #{arg}" }

Kernel.exec cmd

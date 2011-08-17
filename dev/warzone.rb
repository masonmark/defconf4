# encoding: utf-8

require_relative 'mason/ruby/md5_wrapper.rb'

class Warzone

  attr_accessor :name, :path

	def initialize( path )
    @path = path
    @name = File.basename @path

    @file_map = {}

  end

  def map_files



  end
	
  def harboring_terrorists




    return true
  end

  def files_are_equivalent(f1, f2)
    MD5Wrapper.checksum(f1) == MD5Wrapper.checksum(f2)
  end

end

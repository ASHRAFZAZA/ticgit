# Add the directory containing this file to the start of the load path if it
# isn't there already.
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'git'
require 'ticgit/base'
require 'ticgit/ticket'

require 'ticgit/cli'

# TicGit Library
#
# This library implements a git based ticketing system in a git repo
#
# Author::    Scott Chacon (mailto:schacon@gmail.com)
# License::   MIT License
#
module TicGit

  VERSION = '0.1.0'
  
  # options
  #   :logger => Logger.new(STDOUT)
  def self.open(git_dir, options = {})
    Base.new(git_dir, options)
  end
  
end


module Git  
  class Lib
    def new_clean_branch(branch_name)
      command('symbolic-ref', ['HEAD', "refs/heads/#{branch_name}"])
    end
  end
end
require 'pry'
require "pmwiki/extract/text/version"
require "pmwiki/extract/text/cli"

module Pmwiki
  module Extract
    module Text
      def self.run!(*args)
        CLI.start(*args)
      end
    end
  end
end

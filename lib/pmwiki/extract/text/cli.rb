require "pp"
require "thor"
require "pmwiki/extract/text/extractor.rb"

module Pmwiki
  module Extract
    module Text
      class CLI < ::Thor
        include ::Thor::Actions
        map %w[--version -V] => :version
        class_option :verbose, type: :boolean, desc: "Output informative message as the task executes", aliases: ['-v']
        class_option :debug, type: :boolean, desc: "Show a lot of debugging information as the task executes", aliases: ['-D']

        desc "[--version | -V | version]", "shows the current program version"
        def version
          say "#{File.basename($0, '.*')} version #{Pmwiki::Extract::Text::VERSION}"
          Pmwiki::Extract::Text::VERSION
        end

        desc "extract [FILES...]", "Extracts the text portion from the PmWiki page and writed it the same filename with a .txt extension"
        method_option :extension, desc: "Extension to use intead of 'txt'", type: :string, aliases: ['-x', '--ext'], default: "txt"
        def extract(*args)
          puts "DEBUG: options: #{options.inspect}" if options[:debug]
          Pmwiki::Extract::Text::Extractor.new(args, options).run!
        end
      end
    end
  end
end

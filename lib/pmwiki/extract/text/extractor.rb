

class Pmwiki::Extract::Text::Extractor
  attr_accessor :options, :files, :text_line
  def initialize(*args)
    if args[-1].kind_of?(Hash)
      self.options = args.pop
    end
    self.files = args.first

    if options["debug"]
      puts "DEBUG: args: #{files}"
    end
  end

  def run!
    files.map do |filename|
      puts "DEBUG: filename: #{filename}" if options["debug"]
      if filename.match(%r|\.#{options["extension"]}$|)
        puts "DEBUG: skipping #{filename}" if options["debug"]
        next
      end

      outputname = "%s.%s" % [filename, options["extension"]]
      puts "DEBUG: outputname: #{outputname}" if options["debug"]

      extract_text_line(filename).
        convert_text.
        write_text_file(outputname)
      [filename, outputname]

    end.
      compact.
      to_h.
      tap{|t| puts("DEBUG: after run!: #{t}") if options["debug"]}
  end

  def extract_text_line(filename)
    line_match_re = %r/^text=/

    puts "DEBUG: processing #{filename}" if options["debug"]

    File.open(filename, 'rb') do |file|

      self.text_line = loop do
        line = file.readline
        break line if line_match_re.match(line)
      end

    end

    raise "No text line found in #{filename}" if text_line.nil?
    self.text_line = text_line.sub(line_match_re, '')

    self
  end

  def convert_text
    self.text_line = text_line.
      gsub(/%3c/,'<').
      gsub(/%0a/,"\n").
      gsub(/%25/,"%")

    puts "DEBUG: text_line after conversion: #{text_line}" if options["debug"]
    self
  end

  def write_text_file(outputname)
    File.write(outputname, text_line)
    puts "Wrote #{outputname}" if options["verbose"]
  end

end

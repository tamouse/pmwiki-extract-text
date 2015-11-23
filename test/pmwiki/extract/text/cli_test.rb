require "test_helper"
require "pmwiki/extract/text/cli"
require "pmwiki/extract/text/extractor"
require "pmwiki/extract/text/version"

class Pmwiki::Extract::Text::CLITest < Minitest::Test
  def setup
    @cli = Pmwiki::Extract::Text::CLI.new
  end

  def test_cli
    refute_nil @cli
  end

  def test_responds_to_version
    assert @cli.respond_to?(:version)
  end

  def test_responds_with_version
    assert_equal Pmwiki::Extract::Text::VERSION, Pmwiki::Extract::Text::CLI.start(['version'])
  end


end

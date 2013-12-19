require 'optparse'
require 'glam'

module Glam
  class CLI

    def self.run
      new.run
    end

    def initialize
      @options = {
        indent_size: 2,
      }
    end

    def run
      @parser = OptionParser.new do |o|
        o.on "-i", "--indent [INDENT]", Integer do |indent_size|
          @options[:indent_size] = indent_size
        end
      end

      @parser.banner = "glam [options] file"

      @parser.on_tail "-h", "--help", "Show help" do
        $stderr.puts @parser
        exit 1
      end

      @parser.parse!

      glam = Glam::Glamorizer.new(@options)

      puts glam.glamorize(ARGV[0] ? File.read(ARGV[0]) : STDIN.read)
    end
  end
end

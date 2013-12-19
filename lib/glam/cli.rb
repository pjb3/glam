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
        o.on "-i", "--indent [INDENT]", "How many spaces to indent at each level", Integer do |indent_size|
          @options[:indent_size] = indent_size
        end
      end

      @parser.banner = "glam #{Glam::VERSION}\n\nUsage: glam [options] file"

      @parser.on_tail "-h", "--help", "Show help" do
        $stderr.puts @parser
        exit 1
      end

      @parser.on_tail "-v", "--version", "Print the version" do
        $stderr.puts Glam::VERSION
        exit 2
      end

      @parser.parse!

      glam = Glam::Glamorizer.new(@options)

      html = if ARGV[0]
        file = File.expand_path(ARGV[0])
        if File.exists?(file)
          File.read(file)
        else
          $stderr.puts "#{file} does not exist"
          exit 3
        end
      else
        STDIN.read
      end

      puts glam.glamorize(html)
    end
  end
end

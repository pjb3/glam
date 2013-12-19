require "nokogiri"
require "set"

module Glam
  class Glamorizer
    VOID_ELEMENTS = Set.new(%w[area base br col embed hr img input keygen link meta param source track wbr])

    attr_accessor :indent_size, :indent_char, :current_indent

    # @param opts [Hash] The options
    # @option opts [Integer] :indent_size
    #   How many spaces should be used for each level of indentation
    def initialize(opts={})
      self.indent_size = 2
      self.indent_char = ' '
      self.current_indent = 0

      if opts
        opts.each do |k,v|
          send("#{k}=", v)
        end
      end
    end

    # Pretty-print the HTML
    # @param html [String] The HTML to be pretty-printed
    # @return [String] The pretty-printed HTML
    def glamorize(html)
      node = if html.is_a?(Nokogiri::XML::Node)
        result = ''
        html
      else
        result = "<!doctype html>\n"
        Nokogiri::HTML(html).root
      end

      result << indented_node_with_attributes(node)
      self.current_indent += 1
      node.children.each do |child_node|
        if child_node.text?
          unless child_node.blank?
            result << "#{indent}#{child_node.content.strip}\n"
          end
        elsif VOID_ELEMENTS.include?(child_node.name)
          result << indented_node_with_attributes(child_node)
        else
          result << glamorize(child_node)
        end
      end
      self.current_indent -= 1
      result << "#{indent}</#{node.name}>\n"
    end

    private
    def indent
      indent_char * (indent_size * current_indent)
    end

    def indented_node_with_attributes(node)
      "#{indent}<#{node.name}#{node.attributes.map{|n,v| %{ #{n}="#{v}"}}.join}>\n"
    end
  end

  # Pretty-print the HTML
  # @param html [String] The HTML to be pretty-printed
  # @param opts [Hash] The options
  # @option opts [Integer] :indent_size
  #   How many spaces should be used for each level of indentation
  # @return [String] The pretty-printed HTML
  def self.glamorize(html, opts={})
    Glamorizer.new(opts).glamorize(html)
  end
end


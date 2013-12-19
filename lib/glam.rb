require 'glam/glamorizer'

module Glam
  VERSION = '0.1.0'
end

# Pretty-print the HTML
# @param html [String] The HTML to be pretty-printed
# @param opts [Hash] The options
# @option opts [Integer] :indent_size
#   How many spaces should be used for each level of indentation
# @return [String] The pretty-printed HTML
def Glam(html, opts={})
  Glam.glamorize(html, opts={})
end

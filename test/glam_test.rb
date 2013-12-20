require 'minitest/autorun'
require 'glam'

class GlamTest < MiniTest::Unit::TestCase
  def initialize(name=nil)
    @test_name = name
    super(name)
  end

  def self.test(name, &block)
    test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym
    defined = instance_method(test_name) rescue false
    raise "#{test_name} is already defined in #{self}" if defined
    if block_given?
      define_method(test_name, &block)
    else
      define_method(test_name) do
        flunk "No implementation provided for #{name}"
      end
    end
  end

  source_dir = File.expand_path("examples/source/*.html", File.dirname(__FILE__))
  Dir[source_dir].each do |example|
    test File.basename(example, '.html') do
      actual = Glam(File.read(example))
      #puts actual
      assert_equal(
       File.read(example.sub(/(.*)(source)(.*)/, '\1expected\3')),
       actual)
    end
  end

end

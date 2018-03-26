require 'rspec/rails/example/decorator_example_group'

RSpec.configure do |config|
  config.include RSpec::Rails::DecoratorExampleGroup, type: :decorator
  config.define_derived_metadata(file_path: /spec\/decorators/) do |metadata|
    metadata[:type] ||= :decorator
  end
end

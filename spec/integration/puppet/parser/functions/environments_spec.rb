require 'puppetlabs_spec_helper/module_spec_helper'
require 'fileutils'

describe "the environments function" do
  let(:the_node)     { Puppet::Node.new('stub_node') }
  let(:the_compiler) { Puppet::Parser::Compiler.new(the_node) }
  let(:the_scope)    { Puppet::Parser::Scope.new(the_compiler) }
  let(:the_typecollection) { Puppet::Resource::TypeCollection.new(the_scope.environment) }

  before do
    stub_environment('foo')
    stub_environment('bar')
    stub_environment('baz')
  end

  it "should list all environments" do
    expect(the_scope.function_environments([])).to eq(['bar', 'baz', 'foo', 'production'])
  end
end

def stub_environment(name)
  path = Puppet[:environmentpath]
  dir = File.join(path, name)
  FileUtils.mkdir_p(dir)
end

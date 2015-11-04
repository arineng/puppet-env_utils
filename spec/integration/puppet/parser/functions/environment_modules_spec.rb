require 'puppetlabs_spec_helper/module_spec_helper'
require 'fileutils'

describe "the environment_modules function" do
  let(:the_node)     { Puppet::Node.new('stub_node') }
  let(:the_compiler) { Puppet::Parser::Compiler.new(the_node) }
  let(:the_scope)    { Puppet::Parser::Scope.new(the_compiler) }
  let(:the_typecollection) { Puppet::Resource::TypeCollection.new(the_scope.environment) }

  before do
      stub_empty_module(Puppet[:environment], 'stub_module_1')
      stub_empty_module(Puppet[:environment], 'stub_module_2')
      stub_empty_module('foo', 'stub_module_3')
      stub_empty_module('foo', 'stub_module_4')
  end

  context "when an environment name is not provided" do
    it "should find all of the modules in the node's environment" do
      expect(the_scope.function_environment_modules([])).to eq(["stub_module_1", "stub_module_2"])
    end
  end

  context "when an environment name is provided" do
    it "should find all of the modules in the requested environment" do
      expect(the_scope.function_environment_modules(["foo"])).to eq(["stub_module_3", "stub_module_4"])
    end
  end

  context "when the requested environment doesn't exist" do
    it "should raise an error" do
      expect{the_scope.function_environment_modules(["bar"])}.to raise_error(/'bar' anywhere in the path/)
    end
  end
end

def stub_empty_module(env, name)
  path = Puppet[:environmentpath]
  dir = File.join(path, env, "modules", name, "manifests")
  manifest = File.join(dir, "init.pp")
  FileUtils.mkdir_p(dir)
end

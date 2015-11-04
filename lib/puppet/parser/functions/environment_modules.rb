Puppet::Parser::Functions.newfunction(:environment_modules, :arity => -1, :type => :rvalue) do |values|
  env_name = values[0]

  if env_name
    env = Puppet.lookup(:environments).get!(env_name)
  else
    # If no environment was provided, use this node's
    env = environment
  end

  return env.modules.map {|mod| mod.name }
end

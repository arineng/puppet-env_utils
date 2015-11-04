Puppet::Parser::Functions.newfunction(:environments, :arity => 0, :type => :rvalue) do |values|
  Puppet.lookup(:environments).list.map {|env| env.to_s }
end

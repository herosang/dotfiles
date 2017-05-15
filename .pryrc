if defined?(PryByebug) || defined?(Pry)
  Pry.commands.alias_command 'ep', 'exit-program'
  Pry.commands.alias_command 'wai', 'whereami'
end

# PryByebug supports a superset of Pry commands
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

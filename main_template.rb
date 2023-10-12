# require_relative './lib/git_template.rb'

# ExampleCommand.new(self).call


after_bundle do
  git(:init)
  git(add: '.')
  git(commit: %Q{ -m "Initial commit" })
end

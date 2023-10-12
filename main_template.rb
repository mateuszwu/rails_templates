ENV = :remote

HOST = 'https://raw.githubusercontent.com/mateuszwu/rails_templates/main'
FILES = [
  'lib/git_template.rb'
]

if ENV == :local
  FILES.each do |file|
    require_relative file
  end
else
  require 'net/http'
  require 'open-uri'

  FILES.each do |file|
    url = URI.parse("#{HOST}/#{file}")
    response = Net::HTTP.get_response(url)

    if response.code == '200'
      code = response.body
      eval code
    else
      puts "Failed to fetch the remote script (HTTP status code: #{response.code})"
    end
  end
end

ExampleCommand.new(self).call

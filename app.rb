
require 'sinatra'

hostname = ENV['RUNTIME_HOSTNAME']
version = ENV['CURRENT_PROJECT_VERSION']
project = ENV['PROJECT_NAME']
if hostname.nil?
  $stderr.puts "You need to set RUNTIME_HOSTNAME environment variable."
  err = true
end

if version.nil?
  $stderr.puts "You need to set CURRENT_PROJECT_VERSION environment variable."
  err = true
end

if project.nil?
  $stderr.puts "You need to set PROJECT_NAME environment variable."
  err = true
end

exit(1) unless err.nil?

set :port, 80

puts
message = %Q{This is a simple implementation of a server for projects using libautoupdate (https://github.com/pmq20/libautoupdate).

Simply need to place the latest versions of your software in a directory structure that is public/#{project}/\#{platform_idenifier}/#{project}-#{version}.gz.

Note the filename must be the version string and .gz (or .zip) on Windows.}
puts message
puts
puts

head "/#{project}/:platform_idenifier" do |platform_idenifier|
  status 302
  headers['Location'] = "http://#{hostname}:80/#{project}/#{platform_idenifier.downcase}/#{project}-#{version}.gz"
end

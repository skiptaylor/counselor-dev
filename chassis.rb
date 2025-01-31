require 'rubygems'
require 'bundler/setup'

Bundler.require

require 'bcrypt'
require 'sinatra/namespace'
require 'sinatra'
require 'sinatra/chassis/helpers'
require 'sequel'
require 'sinatra/sequel'
require 'net/http'
require 'chronic'
require 'sinatra/reloader' if development?
require 'sinatra/flash'
require 'sendgrid-ruby'
include SendGrid
require 'json'

Dotenv.load

# configure :production do
#   before do
#     unless request.request_method == 'POST'
#       unless request.url.include? "https://www."
#         redirect ENV.fetch('DOMAIN')
#       end
#     end
#   end
# end

configure do

  use Rack::Protection, :except => :session_hijacking
  enable :sessions
  use Rack::Session::Cookie, :key => 'rack.session',
                             :secret => 'ea5ae1d8519ae482821e24372f2b683098a2bb149fd85429bc3aa24d310ec58d',
                             :expire_after => ENV.fetch("EXPIRE").to_i
  set :database,       ENV.fetch('DATABASE_URL')
  set :session_secret, ENV.fetch('SESSION_SECRET')
  set :views,          ['./views', "#{File.dirname(__FILE__)}/views"]

end



require_directory([
  'config',
  'settings',
  'modules',
  'helpers',
  'libraries',
  'models',
  'controllers',
  'routes'
])

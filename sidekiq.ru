require 'sidekiq'
require 'sidekiq/web'

module Sidekiq
  class Web < Sinatra::Base
    set :protection, except: :frame_options
  end
end

run Sidekiq::Web
# frozen_string_literal: true

require 'sinatra/base'

# Career controller.
class CareerController < Sinatra::Base
  configure :development, :production do
    set :views, settings.root + '/../views'
  end

  # GET method of careers
  get '/careers' do
    @careers = Career.all
    erb :careers_index
  end
  # End of GET method of careers
end

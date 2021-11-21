# frozen_string_literal: true

require './models/init.rb'
require './controllers/career_controller.rb'
require './controllers/survey_controller.rb'

# Endpoint of the app
class App < Sinatra::Base
  use CareerController
  use SurveyController

  # GET method of root
  get '/' do
    erb :landing
  end
  # End of GET method of root
end

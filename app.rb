require './models/init.rb'

require 'sinatra/base'
require 'sinatra/flash'

class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  #GET method of root
  get '/' do
    erb :landing
  end
  #End of GET method of root

  #GET method of careers
  get '/careers' do
    @careers = Career.all
    erb :careers_index
  end
  #End of GET method of careers

  #POST methods of surveys
  post "/surveys" do
    @survey = Survey.new(name: params[:name])

    if @survey.save
      @questions = Question.all
      erb :surveys_index
    else
      flash[:error] = "Algo salio mal mientras se intentaba crear tu encuesta.."
      redirect '/'
    end
  end
  #End of POST method of careers

  #POST method of responses
  post '/responses' do
    survey = Survey.find(id: params[:survey_id])
    params[:question_id].each do |q_id|
      r = Response.new(choice_id: params[q_id], survey_id: survey.id, question_id: q_id)
      r.save
    end

    @career_result = Career.find(id: survey.id_career_result(Career.all))
    survey.update_attribute('career_id', @career_result.id)
    erb :outcome_index
  end
  #End of POST method of responses
end


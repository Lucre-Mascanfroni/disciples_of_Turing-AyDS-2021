require './models/init.rb'

class App < Sinatra::Base

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
      redirect '/'
    end
  end
  #End of POST method of surveys

  #POST method of responses
  post '/responses' do
    survey = Survey.find(id: params[:survey_id])
    params[:question_id].each do |q_id|
      response = Response.new(choice_id: params[q_id], survey_id: survey.id, question_id: q_id)
      response.save
    end

    @result = survey.result(Career.all)
    @career_result = @result[@result.size - 1][0]
    survey.update(:career_id => @career_result.id)
    erb :outcome_index
  end
  #End of POST method of responses
end


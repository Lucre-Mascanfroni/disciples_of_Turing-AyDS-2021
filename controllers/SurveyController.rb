require 'sinatra/base'

class SurveyController < Sinatra::Base

  configure :development, :production do
    set :views, settings.root + '/../views'
  end

  # GET methods all surveys given id of the career and two dates.
  get '/surveys' do
    @result = {}
    @result = Career.find(id: params[:careerId]).number_of_surveys_between_two_dates(params[:initial_date], params[:final_date]) if params[:careerId] && params[:initial_date] && params[:final_date]
    @careers = Career.all
    erb :number_of_surveys_between_two_dates
  end

  # POST methods of surveys
  post '/surveys' do
    @survey = Survey.new(name: params[:name])

    if @survey.save
      @questions = Question.all
      erb :surveys_index
    else
      redirect '/'
    end
  end
  # End of POST method of surveys

  # POST method of responses
  post '/responses' do
    survey = Survey.find(id: params[:survey_id])
    params[:question_id].map { |question_id| Response.create(choice_id: params[question_id], survey_id: survey.id, question_id: question_id) }
    @result = survey.survey_result(Career.all)
    @career_result = @result[@result.size - 1][0]
    survey.update(career_id: @career_result.id)
    erb :outcome_index
  end
  # End of POST method of responses

end
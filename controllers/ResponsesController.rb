require 'sinatra/base'

class ResponseController < Sinatra::Base

  configure :development, :production do
    set :views, settings.root + '/../views'
  end

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
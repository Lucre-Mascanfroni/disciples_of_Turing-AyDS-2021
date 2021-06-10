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

  #GET and POST methods of careers
  get '/careers' do
    @careers = Career.all
    erb :careers_index
  end

  get '/careers/:id' do
    @career = Career.find(id: params[:id])
    erb :career_index
  end
  
  post "/careers" do
    action    = params[:action]
    if action == 'create'
      Career.create(name: params[:name])
      redirect '/careers'
    elsif action == 'delete'
      career = Career.find(id: params[:id])

      if career.nil? || !career.surveys.empty? || !career.outcomes.empty? || !career.destroy then
        flash[:error] = "Something went wrong trying to delete a career."
      end

      redirect '/careers'
    else
      career = Career.find(id: params[:id])
      career.update_attribute(params[:attribute], params[:value])
      redirect "/careers/#{career.id}"
    end
  end
  #End of GET and POST methods of careers

  #POST methods of surveys
  post "/surveys" do
    @survey = Survey.new(name: params[:name])

    if @survey.save
      @questions = Question.all
      erb :surveys_index
    else
      flash[:error] = "Something went wrong trying to create your survey."
      redirect '/'
    end
  end
  #End of GET and POST methods of careers

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

  #GET and POST methods of questions
  get '/questions' do
    @questions = Question.all
    erb :questions_index
  end

  post '/questions' do
    action = params[:action]
    if action == 'create'
      question = Question.new(name: params[:name], description: params[:description], number: params[:number], type: params[:type])
      flash[:error] = 'Something went wrong trying to create a question.' if !question.save
    else
      question = Question.find(id: params[:id])
      #if the question does not exist or have associated choices or have associated responses or cannot be deleted
      if question.nil? || !question.choices.empty? || !question.responses.empty? || !question.destroy
        flash[:error] = 'Something went wrong trying to delete a question.'
      end
    end

    redirect '/questions'
  end
  #End of GET and POST method of questions
  
  #GET and POST methods of choices
  post '/choices' do
    action = params[:action]
    if action == 'create' && !Question.find(id: params[:question_id]).nil?
      choice = Choice.new(text: params[:text], question_id: params[:question_id])
      flash[:error] = 'Something went wrong trying to create the choice.' if !choice.save
    end

    redirect '/questions'
  end
  #End of GET and POST method of choices
end


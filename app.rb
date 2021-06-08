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
    career_id = params[:id]
    action    = params[:action]
    
    if action == 'create'
      career = Career.new(name: params[:name])
      if career.save
        redirect '/careers' #if the career was saved successfully, we redirect to '/careers'
      else
        [500, {}, 'Internal Server Error']
      end
      
    elsif action == 'delete'
      career = Career.find(id: career_id)
      #if the career exists, does not have associated surveys 
      #and does not have associated outcomes we try to destroy it
      if !career.nil? && career.surveys.empty? && career.outcomes.empty? && career.destroy
        redirect '/careers' #if the career was deleted successfully, we redirect to '/careers'
      else
        [500, {}, 'Internal Server Error']
      end
    else
      career = Career.find(id: career_id)
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
      [500, {}, 'Internal Server Error']
    end
  end
  #End of GET and POST methods of careers

  #POST method of responses
  post '/responses' do
    survey = Survey.find(id: params[:survey_id])
    params[:question_id].each do |q_id|
      r = Response.new(choice_id: params[:"#{q_id}"], survey_id: survey.id, question_id: q_id)
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
      Question.create(name: params[:name], description: params[:description], number: params[:number], type: params[:type])
      redirect '/questions'
    end
    
    if action == 'delete'
      question = Question.find(id: params[:id])
      #if the question exists and does not have associated surveys we try to destroy it
      if !question.nil? && question.choices.empty? && question.responses.empty? && question.destroy
        redirect '/questions' #if the question was deleted successfully, we redirect to '/questions'
      else
        [500, {}, 'Internal Server Error']
      end
    end
  end
  #End of GET and POST method of questions
  
  #GET and POST methods of choices
  post '/choices' do
    action = params[:action]
    if action == 'create' && !Question.find(id: params[:question_id]).nil?
      choice = Choice.new(text: params[:text], question_id: params[:question_id])
      if choice.save
        @questions = Question.all
        erb :questions_index
      else
        'Something went wrong trying to create the option.'
      end
    end
  end
  #End of GET and POST method of choices
end


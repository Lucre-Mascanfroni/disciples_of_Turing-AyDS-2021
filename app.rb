require './models/init.rb'

class App < Sinatra::Base
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
    @career = Career.where(id: params['id']).last
    erb :careers_id_index
  end
  
  post "/careers" do
    career_name = params[:name]
    action = params[:action]
    
    if action == 'create'
       career = Career.new(name: career_name)
       if career.save
        redirect '/careers' #if the career was saved successfully, we redirect to '/careers'
       else
        [500, {}, 'Internal Server Error']
       end
    elsif action == 'delete'
       career = Career.where(name: career_name).last
       #if the career exists and does not have associated surveys we try to destroy it
       if !career.nil? && career.surveys.empty? && career.destroy
         redirect '/careers' #if the career was deleted successfully, we redirect to '/careers'
       else
         [500, {}, 'Internal Server Error']
       end
    else
      career = Career.find(id: params[:id])
      career.update_attribute(params[:attribute], params[:value])
      if career.save
        redirect "/careers/#{career.id}"
      else
        [500, {}, 'Internal Server Error']
      end
    end
  end
  #End of GET and POST methods of careers

  #GET and POST methods of surveys
  get '/surveys' do
    Survey.all.map{ |survey| survey.name }
  end

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
end


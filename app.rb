require './models/init.rb'

class App < Sinatra::Base
  get '/' do
    erb :landing
  end

  post '/' do
    
  end

  get "/hello/:name" do
   @name = params[:name]
   erb :hello_template
  end

  post "/posts" do
    request.body.rewind  # in case someone already read it
    data = JSON.parse request.body.read
    post = Post.new(description: data['desc'])
    if post.save
      [201, { 'Location' => "posts/#{post.id}" }, 'CREATED']
    else
      [500, {}, 'Internal Server Error']
    end
  end

  get '/posts' do
    p = Post.where(id: 1).last
    p.description
  end
  
  post "/careers" do
    career = Career.new(name: params[:name])
    
    if career.save
       [201, {'Location' => "career/#{career.id}"}, 'CREATED']
    else
       [500, {}, 'Internal Server Error']
    end
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

  get '/surveys' do
    Survey.all.map{ |survey| survey.name }
  end
  
  get '/careers' do
    @careers = Career.all

    erb :careers_index
  end
end


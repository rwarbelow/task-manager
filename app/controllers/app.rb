require 'models/task'
require 'models/task_manager'

class TaskManagerApp < Sinatra::Base
  set :method_override, true
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") } 

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = TaskManager.all
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do |id|
    @task = TaskManager.find(id.to_i)
    erb :show
  end

  get '/tasks/:id/edit' do |id|
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id' do |id|
    TaskManager.update(id.to_i, params[:task])
    redirect "/tasks/#{id}"
  end

  delete '/tasks/:id' do |id|
    TaskManager.delete(id.to_i)
    redirect '/tasks'
  end

  not_found do
    erb :error
  end
end

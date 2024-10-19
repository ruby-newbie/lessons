require 'sinatra'
require 'sequel'

DB_PATH = 'sqlite://tasks.db'
DB = Sequel.connect(DB_PATH)

get '/' do
  @tasks = tasks
  erb :index
end

get '/tasks/:id' do
  @task = tasks.first(id: params[:id])
  if @task.nil?
    status 404
    erb :not_found
  else
    erb :show
  end
end

post '/tasks/create' do
  # insert into tasks (task, done) .... (params[:task], 0)
  task_name = params[:task].strip
  unless task_name.empty?
    tasks.insert(task: task_name, done: false)
  end
  redirect '/'
end

post '/tasks/toggle_done' do
  task = tasks.first(id: params[:id])
  if task.nil?
    status 404
    erb :not_found
  else
    tasks.where(id: params[:id]).update(done: !task[:done])
    redirect '/'
  end
end

def tasks
  @tasks_table ||= DB[:tasks]
end

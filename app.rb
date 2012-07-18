require "sinatra"
#set :haml, :format => gt; :html5
configure do  # блок конфигурации, вызывается при старте приложения
  set :root, File.dirname(__FILE__)
  enable :static # чтобы работала отдача статичных файлоф из папки publc
  enable :logging # логгирование
  enable :dump_errors # для дампа ошибок
  disable :sessions # а вот сессии нам не нужны
end

set :server => "mongrel"
set :environment => "production"

get "/" do
  haml :index
end

get "/about" do
  haml :about
end

#get '/' do
#  # get the latest 20 posts
#  @posts = Post.all(:order => [ :id.desc ], :limit => 20)
#  erb :index
#end

get '/dogs' do
  # get a listing of all the dogs
  erb :layout
end

get '/dog/:id' do
  # just get one dog, you might find him like this:
  @dog = Dog.find(params[:id])
  # using the params convention, you specified in your route
end

post '/dog' do
  # create a new dog listing
end

put '/dog/:id' do
  # HTTP PUT request method to update an existing dog
end

delete '/dog/:id' do
  # HTTP DELETE request method to remove a dog who's been sold!
end

get '/' do
  erb :layout
  # renders views/index.erb

  # OR look in a sub-directory

  erb :"dogs/layout"
  # would instead render views/dogs/index.erb
end
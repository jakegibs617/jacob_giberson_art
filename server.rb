require 'sinatra'
require 'pg'

configure :development do
  set :db_config, { dbname: "comment_mailing_list" }
end

configure :production do
  uri = URI.parse(ENV["DATABASE_URL"])
  set :db_config, {
    host: uri.host,
    port: uri.port,
    dbname: uri.path.delete('/'),
    user: uri.user,
    password: uri.password
  }
end

def db_connection
  begin
    connection = PG.connect(settings.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

# home page below
get '/' do
  redirect '/shows/home'
end
get '/shows/home' do
  erb :"/shows/home"
end

# main pages below
get '/shows/about' do
  erb :"/shows/about"
end
get '/shows/links' do
  erb :"/shows/links"
end
get '/shows/contact' do
  erb :"/shows/contact"
end
get '/shows/cv' do
  erb :"/shows/cv"
end

# painting pages below
get '/shows/paintings/gallery' do
  erb :"/shows/paintings/gallery"
end
get '/shows/paintings/2015/slides' do
  erb :"/shows/paintings/2015/slides"
end
get '/shows/paintings/2014/slides' do
  erb :"/shows/paintings/2014/slides"
end
get '/shows/paintings/2013/slides' do
  erb :"/shows/paintings/2013/slides"
end

# drawing pages below
get '/shows/drawings/2013' do
  erb :"/shows/drawings/2013"
end

# post request - form entry to db
post "/shows/contact" do
  first_name = params[:first_name]
  last_name = params[:last_name]
  email = params[:email]
  comments = params[:comments]
  db_connection {|conn| conn.exec_params (
    "INSERT INTO mailing_list
    (first_name, last_name, email, comments)
    VALUES ($1, $2, $3, $4)"),
    [first_name, last_name, email, comments]}
  redirect "/shows/home"
end

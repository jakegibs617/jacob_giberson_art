require 'sinatra'

get '/' do
  redirect '/shows/about'
end

get '/shows/paintings/2015' do
  erb :"/shows/paintings/2015"
end

get '/shows/drawings/2015' do
  erb :"/shows/drawings/2015"
end

get '/shows/about' do
  erb :"/shows/about"
end

get '/shows/contact' do
  erb :"/shows/contact"
end

get '/shows/cv' do
  erb :"/shows/cv"
end

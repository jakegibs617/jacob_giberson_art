require 'sinatra'

get '/' do
  redirect '/shows/home'
end

get '/shows/home' do
  erb :"/shows/home"
end
get '/shows/paintings/gallery' do
  erb :"/shows/paintings/gallery"
end

get '/shows/paintings/2015/slides' do
  erb :"/shows/paintings/2015/slides"
end

get '/shows/drawings/2015' do
  erb :"/shows/drawings/2015"
end

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

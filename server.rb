require 'sinatra'
require 'sinatra/flash'

enable :sessions

get '/' do
  redirect '/about'
end

get '/tada' do
 flash[:success] = "Hooray, Flash is working!"
 redirect '/'
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

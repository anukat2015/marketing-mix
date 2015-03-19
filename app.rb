require 'sinatra'
require 'sinatra/reloader'
require './calculation.rb'

require 'pry'

get '/' do
	erb :index
end

post '/' do
	@category = params[:categoryInput]
	@ratings = { :expensiveness => params[:expensiveness].to_i, :known => params[:known].to_i, :brand => params[:brand].to_i, :budget => params[:budget].to_i, :people => params[:people].to_i, :local => params[:local].to_i, :pages => params[:pages].to_i, :affinity => params[:affinity].to_i }
	@@results = calculate_final_score(@category,@ratings)
	redirect('/results')
end

get '/results' do
	erb :results, :locals => {:results => @@results}
end
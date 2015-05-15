require 'sinatra'
require './calculation.rb'

get '/' do
	erb :index
end

post '/' do
	@answers = { :businesses => params[:businesses], :consumers => params[:consumers], :branding => params[:branding], :local => params[:local], :site => params[:site], :ecommerce => params[:ecommerce], :mobile => params[:mobile], :saas => params[:saas], :contentCreation => params[:contentCreation], :ltv => params[:ltv].to_i, :budget => params[:budget].to_i }
	@@results = calculate_final_score(@answers)
	redirect('/results')
end

get '/results' do
	erb :results, :locals => { :results => @@results }
end
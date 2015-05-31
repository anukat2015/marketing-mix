require 'sinatra'
require 'prawn'
require './calculation.rb'
require './pdf.rb'

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

get '/pdf' do
  content_type('application/pdf')
  headers['Cache-Control'] = "public, max-age=6000000000000000000"

  pdf = Prawn::Document.new
  set_font(pdf)
  print_logo(pdf)
  print_title(pdf)
  print_intro(pdf)
  print_channel_explanations(pdf, @@results)
  print_closing_para(pdf)
  pdf.render
end
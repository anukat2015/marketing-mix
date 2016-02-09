require 'sinatra'
require 'prawn'
require './calculation.rb'
require './pdf.rb'

get '/' do
	erb :index
end

post '/' do
	@answers = { :q1 => params[:q1], :q2 => params[:q2], :q3 => params[:q3], :q4 => params[:q4], :q5 => params[:q5], :q6 => params[:q6] }
  puts @answers
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
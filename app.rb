require 'sinatra'
require 'sinatra/reloader'
require 'prawn'
require './calculation.rb'
require 'pry-byebug'

def set_font(pdf)
	pdf.font_families.update(
		"Proxima Nova" => {
			:normal => "./public/fonts/Proxima.ttf",
			:bold => "./public/fonts/Proxima-Bold.ttf",
			:light => "./public/fonts/Proxima-Light.ttf"
		}
	)
	pdf.font("Proxima Nova")
end

def print_logo(pdf)
	pdf.image('./public/dozen-logo-black.png', :width => 150, :position => :right)
	pdf.move_down(30)
end

def print_title(pdf)
	pdf.text("Marketing Mix Results", :size => 24, :style => :bold, :align => :center)
	pdf.move_down(20)
end

def print_intro(pdf)
	pdf.text("Based on what we know about your business, here's how we think you should split your resources across the various digital marketing channels.", :style => :light, :size => 12, :leading => 6)
	pdf.move_down(20)
end

def print_channel_explanations(pdf, results)
	results.each do | channel, properties |
		heading = properties[:name] + ": " + (properties[:sum]*100).round(2).to_s + "%"
		body = properties[:explanation]
		pdf.text(heading, :size => 12, :leading => 6, :align => :center, :style => :bold)
		pdf.text(body, :size => 12, :leading => 6, :style => :light)
		pdf.move_down(20)
	end
end

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
  pdf.render
end
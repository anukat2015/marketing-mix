require 'sinatra/reloader'

def print_text(pdf, results)
	results.each do | channel, properties |
		heading = properties[:name] + ": " + properties[:sum].round(2) + "%"
		pdf.text(heading)
	end
end
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

def print_closing_para(pdf)
	pdf.text("For a more in-depth discussion about the ideal digital marketing strategy for your start-up, visit <u><link href='http://www.dozendigital.com' style='text-decoration:underline;'>Dozen Digital's website</link></u> or <u><link href='mailto:hello@dozendigital.com'>send us an email</link></u>.", :inline_format => true, :size => 12, :leading => 6,)
end
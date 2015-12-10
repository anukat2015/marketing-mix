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
		case properties[:name]
			when "Mobile App Install Advertising"
				body = "Mobile app install ads direct users to download a mobile app, and can be set up on a variety of networks such as Facebook, Twitter, AdWords, YouTube and Tumblr. These ads are quickly becoming an essential tool for marketers who want to expose a wide audience to their apps. They can result in significant downloads if shown to relevant audiences and complemented by App Store Optimization (ASO)."
			when "Email Marketing"
				body = "Building an email list should be a high priority for a company from the very beginning of their marketing process. For e-commerce businesses in particular, emailing coupons and other promotional material can go a long way in driving online sales. Companies selling SaaS products also stand to benefit from this channel, as email is an ideal avenue for conveying more in-depth information about the product, and can be effectively integrated into a longer sales process."
			when "Search Advertising"
				body = "Paid search refers to advertisements placed within the sponsored listings of a search engine. Advertisers are typically charged on a pay-per-click basis. Paid search is suitable for many different businesses, particularly direct-response marketers and online retailers. PPC advertisements also provide a testing environment for value proposition messaging, since click-through-rates serve as a reliable proxy for viewer engagement."
			when "Facebook Advertising"
				body = "Facebook is a valuable advertising tool primarily due to its advanced audience targeting features. Some of the data you can leverage include location, age, gender, interests, life events, purchase behavior, and more. Any company that has a firm sense of the audience they are trying to reach should explore this option. For small businesses with a limited marketing budget, Facebook advertising is a particularly viable choice as the minimum daily budget for any ad set is just $1.00 USD and there is a variety of bid types available (CPC, CPM, CPA, etc)."
			when "Local Advertising"
				body = "In local advertising, promotional messages are directed to the local population rather than the mass market. It is used primarily by small businesses such as stores and restaurants, but can also be used by larger businesses with a strong local presence. Local advertising comprises a number of different efforts, such as local sponsorships, community involvement and industry events."
			when "Retargeting"
				body = "Retargeting helps to keep your brand in front of customers who have not converted, which is crucial given that the vast majority of web traffic will not convert on the first visit. Particularly for larger purchases where the consumer's decision-making process is likely to be long and complex (e.g. buying an expensive SaaS product or a luxury item), retargeting is important to recapture their interest at a later stage. It tends to have a higher ROI that other digital channels as it focuses advertising spend on people who have already demonstrated interest in the brand."
			when "Content Marketing"
				body = "Content marketing refers to a company's efforts to engage with customers and to provide them with valuable expertise to assist them during their purchasing process of any product or service. Both B2B and B2C companies across a variety of industries stand to benefit from this marketing asset, as it allows them not only to connect with new leads and build brand authority, but also to create SEO benefits. In implementing content marketing, it is important to develop a detailed content strategy and put together a budget that accounts for both content creation and distribution."
			when "Social Media and Community"
				body = "Social media serves a number of different roles, from increasing brand awareness to distributing relevant marketing content and providing customer support. It is marked by consumers' ability to create their own content and interact directly with the brand, which helps to increase their sense of involvement in the company. Companies that are looking to increase customer retention would especially benefit from utilizing this channel."
			when "Partnerships and Business Development"
				body = "For some companies, partnerships might be a channel worth investing in, as long as they align with the company and product strategy and are focused on meeting the company's core metrics. Some of the major types of partnerships include product partnerships, brand partnerships, and distribution partnerships."
			when "Referral Marketing"
				body = "Referral marketing consists of growing a userbase by encouraging existing customers to refer other customers. It is a powerful marketing channel because people's decisions are strongly guided by the opinions of others whom they trust. If used strategically, it can be a low-cost tool for startups to generate sales. For businesses with a lengthy sales process, referral marketing is an excellent solution for getting high-quality leads."
			when "Twitter Advertising"
				body = "Like Facebook, Twitter offers a wide variety of data points with which one can target a specific audience, such as location, keywords, followers, interests, behaviors, and even TV targeting. Advertising on Twitter is therefore a good choice for a company that is looking to reach a certain niche.Twitter ads are objective-based and suitable for goals such as growing followers, increasing website traffic, increasing app downloads, finding leads, and raising brand awareness."
			when "Display/Banner Advertising"
				body = "Display advertising can be an effective and scalable way to reach a broad audience. This channel tends to be better suited to building awareness rather than driving conversions, but it as an important complement to direct response ads. For companies that are looking to get their brand in front of a wide audience for a low cost, display ads are a good choice."
			when "Direct Sales"
				body = "Direct selling is best-suited to B2B companies that have a highly specific audience they are looking to target. By using tools such as LinkedIn to identify and reach out to potential customers, businesses can personalize the sales process for optimal results. An effective direct sales strategy calls for a well-defined sales process and skilled sales representatives."
			when "PR"
				body = "PR refers to a company's public messaging in media such as newspapers, magazines, and blogs. It is appropriate for many businesses, but crucially important for those that are seeking to build strong brand authority. Although tracking ROI on PR activities is much harder than doing so for digital marketing channels, PR can contribute greatly to the public image of the organization."
			when "SEO"
				body = "Search Engine Optimization refers to the process of optimizing a website so that it is more likely to rank highly in search results. Although it takes time for SEO efforts to show results, it is still an important process as it helps to drive organic traffic for free in the long term. SEO is especially suitable for small businesses as it scales easily, and at low cost."
		end
		pdf.text(heading, :size => 12, :leading => 6, :align => :center, :style => :bold)
		pdf.text(body, :size => 12, :leading => 6, :style => :light)
		pdf.move_down(20)
	end
end

def print_closing_para(pdf)
	pdf.text("For a more in-depth discussion about the ideal digital marketing strategy for your start-up, visit <u><link href='http://www.dozendigital.com' style='text-decoration:underline;'>Dozen Digital's website</link></u> or <u><link href='mailto:hello@dozendigital.com'>send us an email</link></u>.", :inline_format => true, :size => 12, :leading => 6,)
end
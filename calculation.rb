def calculate_final_score(answers)
	final_score_hash = { :content => { :importance => 0, :name => "Content Marketing", :description => "Nearly all businesses that operate online need to think about a content marketing strategy. Great content is the lifeblood of a marketing effort, supporting all stages of the purchase funnel, from awareness to consideration and conversion). The content medium may vary across businesses (some typical examples include blog posts, videos, interactive tools and whitepapers), but without content, building trust and brand equity with consumers is very challenging." }, :social => { :importance => 0, :name => "Social Media Marketing", :description => "Businesses that sell to consumers must have a social media strategy. Consumers increasingly turn to social media not just as a way to interact with friends, but also to consume content and interact with businesses. Social media is a great way to join the industry conversation, hear from current or prospective customers, establish your marketing tone, and build brand awareness. B2B businesses that sell to enterprises may not need to think substantially about social media, but they should still have accounts with some activity. B2B businesses that sell to small enterprises will likely fall in between these two groups." }, :advertising => { :importance => 0, :name => "Advertising", :description => "Ad-supported businesses and businesses with low LTV’s will have a difficult time justifying substantial paid traffic efforts: cost per clicks are rising and a good return on investment is not likely. Businesses that are in new markets should look for paid media opportunities where there may not be much competition. Finally, venture-backed, profitable businesses should certainly think about investing in paid media to accelerate efforts, but businesses that are in the early stages and have not raised capital should work primarily on awareness building and content creation before thinking about paid media." }, :direct => { :importance => 0, :name => "Direct Sales", :description => "If your business sells to other businesses, you will likely want to build a sales effort into your organization. High-margin B2B products will have the necessary resources to invest in salespeople, but lower-margin products may not be able to make this work and may want to rely on content and paid media more heavily." }, :pr => { :importance => 0, :name => "PR", :description => "If you have raised venture capital, you will want to think about using PR to accelerate awareness of your products. PR can have a variety of secondary benefits, including trust-building with consumers, backlinks for SEO and direct traffic. PR can usually augment other efforts, which is why it may be a good idea to start with PR if you have the capital to do so. Companies that have not raised venture capital but are profitable may want to think about investing in PR for the reasons listed above. If you have not raised money and are not yet profitable, PR may be prohibitively expensive, and you may want to engage in more guerrilla tactics to drive brand awareness." } }
	for channel in final_score_hash.keys
		final_score_hash[channel][:importance] = calculate_channel(channel, answers, final_score_hash)
	end
	final_score_hash = final_score_hash.sort_by { |k,v| v[:importance] }
	return final_score_hash
end

def calculate_channel(channel, answers, hash)
	case channel
	when :content
		calculate_content(hash[:content][:importance], answers)
	when :social
		calculate_social(hash[:social][:importance], answers)
	when :advertising
		calculate_advertising(hash[:advertising][:importance], answers)
	when :direct
		calculate_direct(hash[:direct][:importance], answers)
	when :pr
		calculate_pr(hash[:pr][:importance], answers)
	end
end

def calculate_content(importance, answers)
	if (!["marketplace", "advertising", "software", "agency"].include? answers[:q1]) && (["lessthan5", "5to100"].include? answers[:q3])
		importance = 2
	else
		importance = 1
	end
end

def calculate_social(importance, answers)
	if answers[:q2] == "consumers"
		importance = 1
	elsif ["100to1000", "morethan1000"].include? answers[:q3]
		importance = 3
	else
		importance = 2
	end
end

def calculate_advertising(importance, answers)
	if (answers[:q1] == "advertising") || (answers[:q3] == "lessthan5") || ((answers[:q5] == "false") && (answers[:q6] == "false"))
		importance = 3
	elsif (answers[:q4] == "low") || ((answers[:q5] == "true") && (answers[:q6] == "true"))
		importance = 1
	else
		importance = 2
	end
end

def calculate_direct(importance, answers)
	if (["advertising", "app"].include? answers[:q1]) || (answers[:q2] == "consumers")
		importance = 3
	elsif answers[:q3] == "morethan1000"
		importance = 1
	else
		importance = 2
	end
end

def calculate_pr(importance, answers)
	if answers[:q5] == "true"
		importance = 1
	elsif answers[:q6] == "false"
		importance = 3
	else
		importance = 2
	end
end


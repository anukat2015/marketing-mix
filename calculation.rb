def calculate_final_score(answers)
	final_score_hash = { :content => { :importance => "", :name => "Content Marketing" }, :social => { :importance => "", :name => "Social Media Marketing" }, :advertising => { :importance => "", :name => "Advertising" }, :direct => { :importance => "", :name => "Direct Sales" }, :pr => { :importance => "", :name => "PR" } }
	for channel in final_score_hash.keys
		final_score_hash[channel][:importance] = calculate_channel(channel, answers, final_score_hash)
	end
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
		importance = "medium"
	else
		importance = "high"
	end
end

def calculate_social(importance, answers)
	if answers[:q2] == "consumers"
		importance = "high"
	elsif ["100to1000", "morethan1000"].include? answers[:q3]
		importance = "low"
	else
		importance = "medium"
	end
end

def calculate_advertising(importance, answers)
	if (answers[:q1] == "advertising") || (answers[:q3] == "lessthan5") || ((answers[:q5] == "false") && (answers[:q6] == "false"))
		importance = "low"
	elsif (answers[:q4] == "low") || ((answers[:q5] == "true") && (answers[:q6] == "true"))
		importance = "high"
	else
		importance = "medium"
	end
end

def calculate_direct(importance, answers)
	if (["advertising", "app"].include? answers[:q1]) || (answers[:q2] == "consumers")
		importance = "low"
	elsif answers[:q3] == "morethan1000"
		importance = "high"
	else
		importance = "medium"
	end
end

def calculate_pr(importance, answers)
	if answers[:q5] == "true"
		importance = "high"
	elsif answers[:q6] == "false"
		importance = "low"
	else
		importance = "medium"
	end
end


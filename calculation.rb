def calculate_final_score(answers)
	final_score_hash = { :content => { :importance => 0, :name => "Content Marketing", :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }, :social => { :importance => 0, :name => "Social Media Marketing", :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }, :advertising => { :importance => 0, :name => "Advertising", :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }, :direct => { :importance => 0, :name => "Direct Sales", :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }, :pr => { :importance => 0, :name => "PR", :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." } }
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


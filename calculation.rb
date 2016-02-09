def calculate_final_score(answers)
	final_score_hash = { :content => { :importance => "", :name => "Content Marketing" }, :social => { :importance => "", :name => "Social Media Marketing" }, :advertising => { :importance => "", :name => "Advertising" }, :direct => { :importance => "", :name => "Direct Sales" }, :pr => { :importance => "", :name => "PR" } }
	final_score_hash = adjust_for_all_answers(answers, final_score_hash)
	return final_score_hash
end

def adjust_for_all_answers(answers, final_score_hash)
	# Calculate content
	if ["marketplace", "advertising", "software", "agency"].include? answers[:q1]
		hash[:content][:importance] = "high"
	elsif ["lessthan5", "5to100"].include? answers[:q3]
		hash[:content][:importance] = "medium"
	else
		hash [:content][:importance] = "high"
	end
	# Calculate social
	# Calculate advertising
	# Calculate direct sales
	# Calculate pr
	puts final_score_hash
	return final_score_hash
end
def calculate_final_score(answers)
	final_score_hash = { :facebook => { :sum => 5, :name => "Facebook Advertising" }, :twitter => { :sum => 5, :name => "Twitter Advertising" }, :display => { :sum => 5, :name => "Display/Banner Advertising" }, :search => { :sum => 5, :name => "Search Advertising" }, :retargeting => { :sum => 5, :name => "Retargeting" }, :app => { :sum => 0, :name => "Mobile App Install Advertising" }, :local => { :sum => 0, :name => "Local Advertising" }, :seo => { :sum => 5, :name => "SEO" }, :content => { :sum => 5, :name => "Content Marketing" }, :social => { :sum => 5, :name => "Social Media and Community" }, :pr => { :sum => 5, :name => "PR" }, :direct => { :sum => 5, :name => "Direct Sales" }, :partners => { :sum => 5, :name => "Partnerships and Business Development" }, :referral => { :sum => 5, :name => "Referral Marketing" }, :email => { :sum => 5, :name => "Email Marketing" } }
	final_score_hash = adjust_for_all_answers(answers, final_score_hash)
	final_score_hash = add_explanations(final_score_hash)
	return final_score_hash
end

def adjust_for_all_answers(answers, final_score_hash)
	final_score_hash = adjust_for_businesses(answers[:businesses], final_score_hash)
	final_score_hash = adjust_for_consumers(answers[:consumers], final_score_hash)
	final_score_hash = adjust_for_branding(answers[:branding], final_score_hash)
	final_score_hash = adjust_for_local(answers[:local], final_score_hash)
	final_score_hash = adjust_for_site(answers[:site], final_score_hash)
	final_score_hash = adjust_for_ecommerce(answers[:ecommerce], final_score_hash)
	final_score_hash = adjust_for_mobile(answers[:mobile], final_score_hash)
	final_score_hash = adjust_for_saas(answers[:saas], final_score_hash)
	final_score_hash = adjust_for_contentCreation(answers[:contentCreation], final_score_hash)
	final_score_hash = adjust_for_ltv(answers[:ltv], final_score_hash)
	final_score_hash[:seo] = check_if_mobile(answers[:mobile], final_score_hash[:seo])
	final_score_hash = calculate_percentages(final_score_hash)
	return final_score_hash
end

def adjust_for_businesses(businesses, hash)
	if businesses == "true"
		hash[:facebook][:sum] += 5
		hash[:twitter][:sum] += 3
		hash[:display][:sum] += 2
		hash[:search][:sum] += 8
		hash[:retargeting][:sum] += 5
		hash[:app][:sum] += 0
		hash[:local][:sum] += 0
		hash[:seo][:sum] += 5
		hash[:content][:sum] += 8
		hash[:social][:sum] += 3
		hash[:pr][:sum] += 2
		hash[:direct][:sum] += 15
		hash[:partners][:sum] += 10
		hash[:referral][:sum] += 0
		hash[:email][:sum] += 10
	end
	return hash
end

def adjust_for_consumers(consumers, hash)
	if consumers == "true"
		hash[:facebook][:sum] += 7
		hash[:twitter][:sum] += 3
		hash[:display][:sum] += 2
		hash[:search][:sum] += 8
		hash[:retargeting][:sum] += 5
		hash[:app][:sum] += 0
		hash[:local][:sum] += 0
		hash[:seo][:sum] += 8
		hash[:content][:sum] += 8
		hash[:social][:sum] += 8
		hash[:pr][:sum] += 5
		hash[:direct][:sum] += 0
		hash[:partners][:sum] += 5
		hash[:referral][:sum] += 5
		hash[:email][:sum] += 8
	end
	return hash
end

def adjust_for_branding(branding, hash)
	if branding == "true"
		hash[:facebook][:sum] += 0
		hash[:twitter][:sum] += 0
		hash[:display][:sum] += 5
		hash[:search][:sum] += 0
		hash[:retargeting][:sum] += 0
		hash[:app][:sum] += 0
		hash[:local][:sum] += 0
		hash[:seo][:sum] += 0
		hash[:content][:sum] += 5
		hash[:social][:sum] += 0
		hash[:pr][:sum] += 5
		hash[:direct][:sum] += 0
		hash[:partners][:sum] += 0
		hash[:referral][:sum] += 0
		hash[:email][:sum] += 0
	end
	return hash
end

def adjust_for_local(local, hash)
	if local == "true"
		hash[:facebook][:sum] += 0
		hash[:twitter][:sum] += 0
		hash[:display][:sum] += 0
		hash[:search][:sum] += 0
		hash[:retargeting][:sum] += 0
		hash[:app][:sum] += 0
		hash[:local][:sum] += 25
		hash[:seo][:sum] += 0
		hash[:content][:sum] += 0
		hash[:social][:sum] += 0
		hash[:pr][:sum] += 0
		hash[:direct][:sum] += 0
		hash[:partners][:sum] += 0
		hash[:referral][:sum] += 0
		hash[:email][:sum] += 0
	end
	return hash
end

def adjust_for_site(site, hash)
	if site == "true"
		hash[:facebook][:sum] += 0
		hash[:twitter][:sum] += 0
		hash[:display][:sum] += 0
		hash[:search][:sum] += 0
		hash[:retargeting][:sum] += 0
		hash[:app][:sum] += 0
		hash[:local][:sum] += 0
		hash[:seo][:sum] += 15
		hash[:content][:sum] += 0
		hash[:social][:sum] += 0
		hash[:pr][:sum] += 0
		hash[:direct][:sum] += 0
		hash[:partners][:sum] += 0
		hash[:referral][:sum] += 0
		hash[:email][:sum] += 0
	end
	return hash
end

def adjust_for_ecommerce(ecommerce, hash)
	if ecommerce == "true"
		hash[:facebook][:sum] += 5
		hash[:twitter][:sum] += 0
		hash[:display][:sum] += 0
		hash[:search][:sum] += 5
		hash[:retargeting][:sum] += 5
		hash[:app][:sum] += 0
		hash[:local][:sum] += 0
		hash[:seo][:sum] += 5
		hash[:content][:sum] += 5
		hash[:social][:sum] += 5
		hash[:pr][:sum] += 0
		hash[:direct][:sum] += 0
		hash[:partners][:sum] += 0
		hash[:referral][:sum] += 5
		hash[:email][:sum] += 5
	end
	return hash
end

def adjust_for_mobile(mobile, hash)
	if mobile == "true"
		hash[:facebook][:sum] += 0
		hash[:twitter][:sum] += 0
		hash[:display][:sum] += 0
		hash[:search][:sum] += 0
		hash[:retargeting][:sum] += 0
		hash[:app][:sum] += 50
		hash[:local][:sum] += 0
		hash[:seo][:sum] += 0
		hash[:content][:sum] += 0
		hash[:social][:sum] += 0
		hash[:pr][:sum] += 0
		hash[:direct][:sum] += 0
		hash[:partners][:sum] += 0
		hash[:referral][:sum] += 0
		hash[:email][:sum] += 0
	end
	return hash
end

def adjust_for_saas(saas, hash)
	if saas == "true"
		hash[:facebook][:sum] += 5
		hash[:twitter][:sum] += 5
		hash[:display][:sum] += 0
		hash[:search][:sum] += 5
		hash[:retargeting][:sum] += 5
		hash[:app][:sum] += 0
		hash[:local][:sum] += 0
		hash[:seo][:sum] += 5
		hash[:content][:sum] += 5
		hash[:social][:sum] += 5
		hash[:pr][:sum] += 0
		hash[:direct][:sum] += 0
		hash[:partners][:sum] += 10
		hash[:referral][:sum] += 10
		hash[:email][:sum] += 10
	end
	return hash
end

def adjust_for_contentCreation(contentCreation, hash)
	if contentCreation == "true"
		hash[:facebook][:sum] += 0
		hash[:twitter][:sum] += 0
		hash[:display][:sum] += 0
		hash[:search][:sum] += 0
		hash[:retargeting][:sum] += 0
		hash[:app][:sum] += 0
		hash[:local][:sum] += 0
		hash[:seo][:sum] += 10
		hash[:content][:sum] += 0
		hash[:social][:sum] += 10
		hash[:pr][:sum] += 0
		hash[:direct][:sum] += 0
		hash[:partners][:sum] += 0
		hash[:referral][:sum] += 0
		hash[:email][:sum] += 10
	end
	return hash
end

def adjust_for_ltv(ltv, hash)
	if ltv < 10
		ltvMultiplier = -0.5
	elsif ltv < 50 && ltv >= 10
		ltvMultiplier = -0.2
	elsif ltv < 100 && ltv >= 50
		ltvMultiplier = 0.2
	else
		ltvMultiplier = 0.5
	end
	hash[:facebook][:sum] *= 1 + ltvMultiplier
	hash[:twitter][:sum] *= 1 + ltvMultiplier
	hash[:display][:sum] *= 1 + ltvMultiplier
	hash[:search][:sum] *= 1 + ltvMultiplier
	hash[:retargeting][:sum] *= 1 + ltvMultiplier
	hash[:app][:sum] *= 1 + ltvMultiplier
	hash[:local][:sum] *= 1 + ltvMultiplier
	if ltv <= 100
		hash[:direct][:sum] = 0
	end
	return hash
end

def check_if_mobile(mobile, seo)
	if mobile == "true"
		seo[:sum] = 0
	end
	return seo
end

def calculate_percentages(hash)
	total_score = 0
	hash.each do | k, v |
		total_score += v[:sum]
	end
	hash.each do | k, v |
		v[:sum] = v[:sum] / total_score
	end
	hash = hash.sort_by{ | k, v | v[:sum] }.reverse
	return hash
end

def add_explanations(hash)
	hash.each do | k, v |
		v[:explanation] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
	end
	return hash
end
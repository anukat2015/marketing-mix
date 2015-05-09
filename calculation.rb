def calculate_final_score(answers)
	final_score_hash = { :facebook => 5, :twitter => 5, :display => 5, :search => 5, :retargeting => 5, :app => 0, :local => 0, :seo => 5, :content => 5, :social => 5, :pr => 5, :direct => 5, :partners => 5, :referral => 5, :email => 5 }
	final_score_hash = adjust_for_all_answers(answers, final_score_hash)
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
	return final_score_hash
end

def adjust_for_businesses(businesses, hash)
	if businesses == "true"
		hash[:facebook] += 5;
		hash[:twitter] += 3;
		hash[:display] += 2;
		hash[:search] += 8;
		hash[:retargeting] += 5;
		hash[:app] += 0;
		hash[:local] += 0;
		hash[:seo] += 5;
		hash[:content] += 8;
		hash[:social] += 3;
		hash[:pr] += 2;
		hash[:direct] += 15;
		hash[:partners] += 10;
		hash[:referral] += 0;
		hash[:email] += 10;
	end
	return hash
end

def adjust_for_consumers(consumers, hash)
	if consumers == "true"
		hash[:facebook] += 7;
		hash[:twitter] += 3;
		hash[:display] += 2;
		hash[:search] += 8;
		hash[:retargeting] += 5;
		hash[:app] += 0;
		hash[:local] += 0;
		hash[:seo] += 8;
		hash[:content] += 8;
		hash[:social] += 8;
		hash[:pr] += 5;
		hash[:direct] += 0;
		hash[:partners] += 5;
		hash[:referral] += 5;
		hash[:email] += 8;
	end
	return hash
end

def adjust_for_branding(branding, hash)
	if branding == "true"
		hash[:facebook] += 0;
		hash[:twitter] += 0;
		hash[:display] += 5;
		hash[:search] += 0;
		hash[:retargeting] += 0;
		hash[:app] += 0;
		hash[:local] += 0;
		hash[:seo] += 0;
		hash[:content] += 5;
		hash[:social] += 0;
		hash[:pr] += 5;
		hash[:direct] += 0;
		hash[:partners] += 0;
		hash[:referral] += 0;
		hash[:email] += 0;
	end
	return hash
end

def adjust_for_local(local, hash)
	if local == "true"
		hash[:facebook] += 0;
		hash[:twitter] += 0;
		hash[:display] += 0;
		hash[:search] += 0;
		hash[:retargeting] += 0;
		hash[:app] += 0;
		hash[:local] += 25;
		hash[:seo] += 0;
		hash[:content] += 0;
		hash[:social] += 0;
		hash[:pr] += 0;
		hash[:direct] += 0;
		hash[:partners] += 0;
		hash[:referral] += 0;
		hash[:email] += 0;
	end
	return hash
end

def adjust_for_site(site, hash)
	if site == "true"
		hash[:facebook] += 0;
		hash[:twitter] += 0;
		hash[:display] += 0;
		hash[:search] += 0;
		hash[:retargeting] += 0;
		hash[:app] += 0;
		hash[:local] += 0;
		hash[:seo] += 15;
		hash[:content] += 0;
		hash[:social] += 0;
		hash[:pr] += 0;
		hash[:direct] += 0;
		hash[:partners] += 0;
		hash[:referral] += 0;
		hash[:email] += 0;
	end
	return hash
end

def adjust_for_ecommerce(ecommerce, hash)
	if ecommerce == "true"
		hash[:facebook] += 5;
		hash[:twitter] += 0;
		hash[:display] += 0;
		hash[:search] += 5;
		hash[:retargeting] += 5;
		hash[:app] += 0;
		hash[:local] += 0;
		hash[:seo] += 5;
		hash[:content] += 5;
		hash[:social] += 5;
		hash[:pr] += 0;
		hash[:direct] += 0;
		hash[:partners] += 0;
		hash[:referral] += 5;
		hash[:email] += 5;
	end
	return hash
end

def adjust_for_mobile(mobile, hash)
	if mobile == "true"
		hash[:facebook] += 0;
		hash[:twitter] += 0;
		hash[:display] += 0;
		hash[:search] += 0;
		hash[:retargeting] += 0;
		hash[:app] += 50;
		hash[:local] += 0;
		hash[:seo] += 0;
		hash[:content] += 0;
		hash[:social] += 0;
		hash[:pr] += 0;
		hash[:direct] += 0;
		hash[:partners] += 0;
		hash[:referral] += 0;
		hash[:email] += 0;
	end
	return hash
end

def adjust_for_saas(saas, hash)
	if saas == "true"
		hash[:facebook] += 5;
		hash[:twitter] += 5;
		hash[:display] += 0;
		hash[:search] += 5;
		hash[:retargeting] += 5;
		hash[:app] += 0;
		hash[:local] += 0;
		hash[:seo] += 5;
		hash[:content] += 5;
		hash[:social] += 5;
		hash[:pr] += 0;
		hash[:direct] += 0;
		hash[:partners] += 10;
		hash[:referral] += 10;
		hash[:email] += 10;
	end
	return hash
end

def adjust_for_contentCreation(contentCreation, hash)
	if contentCreation == "true"
		hash[:facebook] += 0;
		hash[:twitter] += 0;
		hash[:display] += 0;
		hash[:search] += 0;
		hash[:retargeting] += 0;
		hash[:app] += 0;
		hash[:local] += 0;
		hash[:seo] += 10;
		hash[:content] += 0;
		hash[:social] += 10;
		hash[:pr] += 0;
		hash[:direct] += 0;
		hash[:partners] += 0;
		hash[:referral] += 0;
		hash[:email] += 10;
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
	hash[:facebook] *= 1 + ltvMultiplier
	hash[:twitter] *= 1 + ltvMultiplier
	hash[:display] *= 1 + ltvMultiplier
	hash[:search] *= 1 + ltvMultiplier
	hash[:retargeting] *= 1 + ltvMultiplier
	hash[:app] *= 1 + ltvMultiplier
	hash[:local] *= 1 + ltvMultiplier
	if ltv <= 100
		hash[:direct] = 0
	end
	return hash
end

def check_if_mobile(mobile, seo)
	if mobile == "true"
		seo = 0
	end
	return seo
end

# calculate percentages
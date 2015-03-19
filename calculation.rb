#Pre-defined values that rank the importance of each channel for each business type (corresponds to values B2:J14 in spreadsheet)
CHANNEL_WEIGHTS = { :ecommerce => { :paidsocial => 70, :display => 50, :paidsearch => 80, :content => 60, :directsales => 0, :organicsocial => 40, :seo => 80, :pr => 20, :influencer => 60, :local => 0, :referral => 50, :email => 70, :partners => 60 },
					:community => { :paidsocial => 0, :display => 0, :paidsearch => 0, :content => 70, :directsales => 0, :organicsocial => 70, :seo => 80, :pr => 50, :influencer => 70, :local => 0, :referral => 80, :email => 70, :partners => 30 },
					:saas => { :paidsocial => 50, :display => 50, :paidsearch => 70, :content => 60, :directsales => 20, :organicsocial => 40, :seo => 60, :pr => 20, :influencer => 60, :local => 0, :referral => 50, :email => 70, :partners => 60 },
					:content => { :paidsocial => 0, :display => 0, :paidsearch => 0, :content => 90, :directsales => 0, :organicsocial => 80, :seo => 90, :pr => 30, :influencer => 70, :local => 0, :referral => 30, :email => 70, :partners => 60 },
					:enterprise => { :paidsocial => 10, :display => 30, :paidsearch => 50, :content => 80, :directsales => 90, :organicsocial => 20, :seo => 40, :pr => 60, :influencer => 40, :local => 0, :referral => 10, :email => 60, :partners => 60 },
					:local => { :paidsocial => 20, :display => 10, :paidsearch => 60, :content => 40, :directsales => 70, :organicsocial => 40, :seo => 70, :pr => 10, :influencer => 10, :local => 90, :referral => 70, :email => 40, :partners => 30 },
					:services => { :paidsocial => 20, :display => 0, :paidsearch => 30, :content => 50, :directsales => 90, :organicsocial => 20, :seo => 40, :pr => 40, :influencer => 30, :local => 60, :referral => 50, :email => 50, :partners => 20 },
					:marketplace => { :paidsocial => 60, :display => 30, :paidsearch => 60, :content => 60, :directsales => 20, :organicsocial => 60, :seo => 80, :pr => 60, :influencer => 40, :local => 20, :referral => 80, :email => 60, :partners => 30 },
					:app => { :paidsocial => 80, :display => 20, :paidsearch => 10, :content => 30, :directsales => 0, :organicsocial => 20, :seo => 10, :pr => 80, :influencer => 50, :local => 10, :referral => 80, :email => 20, :partners => 40 },
				}

SENSITIVITY = 10

# Calculate final score based on the business category and the ratings for each factor
def calculate_final_score(category, ratings)
	final_score_hash = { :paidsocial => 0, :display => 0, :paidsearch => 0, :content => 0, :directsales => 0, :organicsocial => 0, :seo => 0, :pr => 0, :influencer => 0, :local => 0, :referral => 0, :email => 0, :partners => 0 }
	sum = calculate_sum_of_factor_adjustments(ratings)
	final_score_hash.each do | channel, score |
		final_score_hash[channel] = sum[channel] * SENSITIVITY + CHANNEL_WEIGHTS[category.to_sym][channel]
	end
	return final_score_hash
end

# Pass in hash with ratings of input factors, then calculate the sum of adjustments to make to final score, based on channel
def calculate_sum_of_factor_adjustments(ratings)
	channel_sums = { :paidsocial => 0, :display => 0, :paidsearch => 0, :content => 0, :directsales => 0, :organicsocial => 0, :seo => 0, :pr => 0, :influencer => 0, :local => 0, :referral => 0, :email => 0, :partners => 0 }
	# Adjust sum given rating of expensiveness
	[:paidsocial, :display, :paidsearch, :pr].each{ |channel| channel_sums[channel] += calculate_offset(ratings[:expensiveness], true) }
	# Adjust sum given rating of well-knownness
	[:pr, :influencer].each{ |channel| channel_sums[channel] += calculate_offset(ratings[:known], false) }
	# Adjust sum given rating of brand importance
	[:organicsocial, :pr].each{ |channel| channel_sums[channel] += calculate_offset(ratings[:brand], true) }
	[:seo].each{ |channel| channel_sums[channel] += calculate_offset(ratings[:brand], false) }
	# Adjust sum given rating of budget size
	[:paidsocial, :display, :paidsearch].each{ |channel| channel_sums[channel] += calculate_offset(ratings[:budget], true) }
	[:content, :directsales, :organicsocial, :seo, :influencer, :referral, :email, :partners].each{ |channel| channel_sums[channel] += calculate_offset(ratings[:budget], false) }
	# Adjust sum given rating of people count
	[:organicsocial, :influencer].each{ |channel| channel_sums[channel] += calculate_offset(ratings[:people], true) }
	[:paidsocial, :paidsearch, :seo].each{ |channel| channel_sums[channel] += calculate_offset(ratings[:people], false) }
	# Adjust sum given rating of local importance
	[:local].each{ |channel| channel_sums[channel] += calculate_offset(ratings[:local], true) }
	# Adjust sum given rating of number of pages
	[:seo].each{ |channel| channel_sums[channel] += calculate_offset(ratings[:pages], true) }
	# Adjust sum given rating of customer affinity
	[:referral].each{ |channel| channel_sums[channel] += calculate_offset(ratings[:affinity], true) }
	return channel_sums
end

# Pass in the rating for a single factor and calculate the offset for the channel
def calculate_offset(rating, is_directly_proportional)
	if (is_directly_proportional == true && rating > 5)
		offset = rating - 5
	elsif (is_directly_proportional == false && rating < 5)
		offset = 5 - rating
	else
		offset = 0
	end
	return offset
end
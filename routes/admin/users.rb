get '/admin/users_active/?' do
	admin!
  
	if params[:start_month] && params[:start_day] && params[:start_year]
    @start = Chronic.parse("#{params[:start_year]}-#{params[:start_month]}-#{params[:start_day]}")
  else
    @start = Chronic.parse('one year ago')
    
  end

  if params[:end_month] && params[:end_day] && params[:end_year]
    @end = Chronic.parse("#{params[:end_year]}-#{params[:end_month]}-#{params[:end_day]}")
  else
    @end = Time.now
  end
  
	 @users = User.where(created_at: (@start)..(@end))
   
 
    
	if params[:export]
  	response.headers['Content-Type'] = 'text/csv; charset=utf-8' 
  	response.headers['Content-Disposition'] = "attachment; filename=active_users.csv"
  	
  	file = ''
  	file = CSV.generate do |csv|
  		csv << ['Name', 'Email', 'Scenarios', 'Expiration']
  		@users.each do |user|
        
        unless user.admin || (user.expiration_date <= DateTime.now) || (user.email.include? "refund") || (user.email == "sample") || user.max_scenarios != 0 || user.max_exams > 0 
          
  			csv << [
  				
  				user.name,
  				user.email,
          user.max_scenarios,
          user.expiration_date
  				
  			]
      end
  		end
  	end
  	
  	return file
  
	else
		erb :'admin/users_active'
	end
end


# get '/admin/users_sample/?' do
#   admin!
#
#   @users = User.all(:email => 'sample', order: [:updated_at.desc], limit: 200)
#
#   erb :'/admin/users_sample'
# end



get '/admin/users/?' do
	admin!
	
	@users = User.limit(50)
  
  if params[:search] && !params[:search].nil?
    @users = User.where(Sequel.like(:email, :name, "%#{params[:search].strip}%", "%#{params[:search].strip}%"))
	else
    unless user = 'sample' || user.email = nil || user.name = nil 
		  @users = User.all
    end
	end
	erb :'admin/users'
end


get '/admin/userscores/?' do
  admin!
	 
  @users = User.all
  @casestudies = Casestudy.all
  @caseaverages = Caseaverage.all

	if params[:search] && !params[:search].nil?
		@users = User.where(Sequel.like(:email, :name, "%#{params[:search].strip}%", "%#{params[:search].strip}%"))
	else
    unless user = 'sample' || user.email = nil || user.name = nil
		  @users = User.all
    end
	end
  
  erb :'admin/userscores'
end

get '/admin/samplescores/?' do
  admin!
	 
  @caseaverages = Caseaverage.all
  
  sumA1 = 0
  sumA2 = 0
  sumA3 = 0
  sumA4 = 0
  sumA5 = 0
  sumA6 = 0
  sumA7 = 0
  sumA8 = 0
  sumA9 = 0
  sumA10 = 0
  sumA11 = 0
  sumA12 = 0
  enuA1 = 0
  enuA2 = 0
  enuA3 = 0
  enuA4 = 0
  enuA5 = 0
  enuA6 = 0
  enuA7 = 0
  enuA8 = 0
  enuA9 = 0
  enuA10 = 0
  enuA11 = 0
  enuA12 = 0
  @counterA1 = 0
  @counterA2 = 0
  @counterA3 = 0
  @counterA4 = 0
  @counterA5 = 0
  @counterA6 = 0
  @counterA7 = 0
  @counterA8 = 0
  @counterA9 = 0
  @counterA10 = 0
  @counterA11 = 0
  @counterA12 = 0
  sumB1 = 0
  sumB2 = 0
  sumB3 = 0
  sumB4 = 0
  sumB5 = 0
  sumB6 = 0
  sumB7 = 0
  sumB8 = 0
  sumB9 = 0
  sumB10 = 0
  sumB11 = 0
  sumB12 = 0
  enuB1 = 0
  enuB2 = 0
  enuB3 = 0
  enuB4 = 0
  enuB5 = 0
  enuB6 = 0
  enuB7 = 0
  enuB8 = 0
  enuB9 = 0
  enuB10 = 0
  enuB11 = 0
  enuB12 = 0
  @counterB1 = 0
  @counterB2 = 0
  @counterB3 = 0
  @counterB4 = 0
  @counterB5 = 0
  @counterB6 = 0
  @counterB7 = 0
  @counterB8 = 0
  @counterB9 = 0
  @counterB10 = 0
  @counterB11 = 0
  @counterB12 = 0
  sumC1 = 0
  sumC2 = 0
  sumC3 = 0
  sumC4 = 0
  sumC5 = 0
  sumC6 = 0
  sumC7 = 0
  sumC8 = 0
  sumC9 = 0
  sumC10 = 0
  sumC11 = 0
  sumC12 = 0
  enuC1 = 0
  enuC2 = 0
  enuC3 = 0
  enuC4 = 0
  enuC5 = 0
  enuC6 = 0
  enuC7 = 0
  enuC8 = 0
  enuC9 = 0
  enuC10 = 0
  enuC11 = 0
  enuC12 = 0
  @counterC1 = 0
  @counterC2 = 0
  @counterC3 = 0
  @counterC4 = 0
  @counterC5 = 0
  @counterC6 = 0
  @counterC7 = 0
  @counterC8 = 0
  @counterC9 = 0
  @counterC10 = 0
  @counterC11 = 0
  @counterC12 = 0
  sumD1 = 0
  sumD2 = 0
  sumD3 = 0
  sumD4 = 0
  sumD5 = 0
  sumD6 = 0
  sumD7 = 0
  sumD8 = 0
  sumD9 = 0
  sumD10 = 0
  sumD11 = 0
  sumD12 = 0
  enuD1 = 0
  enuD2 = 0
  enuD3 = 0
  enuD4 = 0
  enuD5 = 0
  enuD6 = 0
  enuD7 = 0
  enuD8 = 0
  enuD9 = 0
  enuD10 = 0
  enuD11 = 0
  enuD12 = 0
  @counterD1 = 0
  @counterD2 = 0
  @counterD3 = 0
  @counterD4 = 0
  @counterD5 = 0
  @counterD6 = 0
  @counterD7 = 0
  @counterD8 = 0
  @counterD9 = 0
  @counterD10 = 0
  @counterD11 = 0
  @counterD12 = 0
  
  @caseaverages.each do  |s|
    if (s.sett == "A") && (s.title == 1)
      sumA1 += s.score
      @scoreA1 = sumA1
      enuA1 += 1
      @counterA1 = enuA1
    elsif (s.sett == "A") && (s.title == 2)
      sumA2 += s.score
      @scoreA2 = sumA2
      enuA2 += 1
      @counterA2 = enuA2
    elsif (s.sett == "A") && (s.title == 3)
      sumA3 += s.score
      @scoreA3 = sumA3
      enuA3 += 1
      @counterA3 = enuA3
    elsif (s.sett == "A") && (s.title == 4)
      sumA4 += s.score
      @scoreA4 = sumA4
      enuA4 += 1
      @counterA4 = enuA4
    elsif (s.sett == "A") && (s.title == 5)
      sumA5 += s.score
      @scoreA5 = sumA5
      enuA5 += 1
      @counterA5 = enuA5
    elsif (s.sett == "A") && (s.title == 6)
      sumA6 += s.score
      @scoreA6 = sumA6
      enuA6 += 1
      @counterA6 = enuA6
    elsif (s.sett == "A") && (s.title == 7)
      sumA7 += s.score
      @scoreA7 = sumA7
      enuA7 += 1
      @counterA7 = enuA7
    elsif (s.sett == "A") && (s.title == 8)
      sumA8 += s.score
      @scoreA8 = sumA8
      enuA8 += 1
      @counterA8 = enuA8
    elsif (s.sett == "A") && (s.title == 9)
      sumA9 += s.score
      @scoreA9 = sumA9
      enuA9 += 1
      @counterA9 = enuA9
    elsif (s.sett == "A") && (s.title == 10)
      sumA10 += s.score
      @scoreA10 = sumA10
      enuA10 += 1
      @counterA10 = enuA10
    elsif (s.sett == "A") && (s.title == 11)
      sumA11 += s.score
      @scoreA11 = sumA11
      enuA11 += 1
      @counterA11 = enuA11
   elsif (s.sett == "A") && (s.title == 12)
      sumA12 += s.score
      @scoreA12 = sumA12
      enuA12 += 1
      @counterA12 = enuA12
    elsif (s.sett == "B") && (s.title == 1)
      sumB1 += s.score
      @scoreB1 = sumB1
      enuB1 += 1
      @counterB1 = enuB1
    elsif (s.sett == "B") && (s.title == 2)
      sumB2 += s.score
      @scoreB2 = sumB2
      enuB2 += 1
      @counterB2 = enuB2
    elsif (s.sett == "B") && (s.title == 3)
      sumB3 += s.score
      @scoreB3 = sumB3
      enuB3 += 1
      @counterB3 = enuB3
    elsif (s.sett == "B") && (s.title == 4)
      sumB4 += s.score
      @scoreB4 = sumB4
      enuB4 += 1
      @counterB4 = enuB4
    elsif (s.sett == "B") && (s.title == 5)
      sumB5 += s.score
      @scoreB5 = sumB5
      enuB5 += 1
      @counterB5 = enuB5
    elsif (s.sett == "B") && (s.title == 6)
      sumB6 += s.score
      @scoreB6 = sumB6
      enuB6 += 1
      @counterB6 = enuB6
    elsif (s.sett == "B") && (s.title == 7)
      sumB7 += s.score
      @scoreB7 = sumB7
      enuB7 += 1
      @counterB7 = enuB7
    elsif (s.sett == "B") && (s.title == 8)
      sumB8 += s.score
      @scoreB8 = sumB8
      enuB8 += 1
      @counterB8 = enuB8
    elsif (s.sett == "B") && (s.title == 9)
      sumB9 += s.score
      @scoreB9 = sumB9
      enuB9 += 1
      @counterB9 = enuB9
    elsif (s.sett == "B") && (s.title == 10)
      sumB10 += s.score
      @scoreB10 = sumB10
      enuB10 += 1
      @counterB10 = enuB10
    elsif (s.sett == "B") && (s.title == 11)
      sumB11 += s.score
      @scoreB11 = sumB11
      enuB11 += 1
      @counterB11 = enuB11
    elsif (s.sett == "B") && (s.title == 12)
      sumB12 += s.score
      @scoreB12 = sumB12
      enuB12 += 1
      @counterB12 = enuB12
    elsif (s.sett == "C") && (s.title == 1)
      sumC1 += s.score
      @scoreC1 = sumC1
      enuC1 += 1
      @counterC1 = enuC1
    elsif (s.sett == "C") && (s.title == 2)
      sumC2 += s.score
      @scoreC2 = sumC2
      enuC2 += 1
      @counterC2 = enuC2
    elsif (s.sett == "C") && (s.title == 3)
      sumC3 += s.score
      @scoreC3 = sumC3
      enuC3 += 1
      @counterC3 = enuC3
    elsif (s.sett == "C") && (s.title == 4)
      sumC4 += s.score
      @scoreC4 = sumC4
      enuC4 += 1
      @counterC4 = enuC4
    elsif (s.sett == "C") && (s.title == 5)
      sumC5 += s.score
      @scoreC5 = sumC5
      enuC5 += 1
      @counterC5 = enuC5
    elsif (s.sett == "C") && (s.title == 6)
      sumC6 += s.score
      @scoreC6 = sumC6
      enuC6 += 1
      @counterC6 = enuC6
    elsif (s.sett == "C") && (s.title == 7)
      sumC7 += s.score
      @scoreC7 = sumC7
      enuC7 += 1
      @counterC7 = enuC7
    elsif (s.sett == "C") && (s.title == 8)
      sumC8 += s.score
      @scoreC8 = sumC8
      enuC8 += 1
      @counterC8 = enuC8
    elsif (s.sett == "C") && (s.title == 9)
      sumC9 += s.score
      @scoreC9 = sumC9
      enuC9 += 1
      @counterC9 = enuC9
    elsif (s.sett == "C") && (s.title == 10)
      sumC10 += s.score
      @scoreC10 = sumC10
      enuC10 += 1
      @counterC10 = enuC10
    elsif (s.sett == "C") && (s.title == 11)
      sumC11 += s.score
      @scoreC11 = sumC11
      enuC11 += 1
      @counterC11 = enuC11
    elsif (s.sett == "C") && (s.title == 12)
      sumC12 += s.score
      @scoreC12 = sumC12
      enuC12 += 1
      @counterC12 = enuC12
    elsif (s.sett == "D") && (s.title == 1)
      sumD1 += s.score
      @scoreD1 = sumD1
      enuD1 += 1
      @counterD1 = enuD1
    elsif (s.sett == "D") && (s.title == 2)
      sumD2 += s.score
      @scoreD2 = sumD2
      enuD2 += 1
      @counterD2 = enuD2
    elsif (s.sett == "D") && (s.title == 3)
      sumD3 += s.score
      @scoreD3 = sumD3
      enuD3 += 1
      @counterD3 = enuD3
    elsif (s.sett == "D") && (s.title == 4)
      sumD4 += s.score
      @scoreD4 = sumD4
      enuD4 += 1
      @counterD4 = enuD4
    elsif (s.sett == "D") && (s.title == 5)
      sumD5 += s.score
      @scoreD5 = sumD5
      enuD5 += 1
      @counterD5 = enuD5
    elsif (s.sett == "D") && (s.title == 6)
      sumD6 += s.score
      @scoreD6 = sumD6
      enuD6 += 1
      @counterD6 = enuD6
    elsif (s.sett == "D") && (s.title == 7)
      sumD7 += s.score
      @scoreD7 = sumD7
      enuD7 += 1
      @counterD7 = enuD7
    elsif (s.sett == "D") && (s.title == 8)
      sumD8 += s.score
      @scoreD8 = sumD8
      enuD8 += 1
      @counterD8 = enuD8
    elsif (s.sett == "D") && (s.title == 9)
      sumD9 += s.score
      @scoreD9 = sumD9
      enuD9 += 1
      @counterD9 = enuD9
    elsif (s.sett == "D") && (s.title == 10)
      sumD10 += s.score
      @scoreD10 = sumD10
      enuD10 += 1
      @counterD10 = enuD10
    elsif (s.sett == "D") && (s.title == 11)
      sumD11 += s.score
      @scoreD11 = sumD11
      enuD11 += 1
      @counterD11 = enuD11
    elsif (s.sett == "D") && (s.title == 12)
      sumD12 += s.score
      @scoreD12 = sumD12
      enuD12 += 1
      @counterD12 = enuD12
    end
  end
  
  @totalavgerageA1 = @scoreA1 / @counterA1
  @totalavgerageA2 = @scoreA2 / @counterA2
  @totalavgerageA3 = @scoreA3 / @counterA3
  @totalavgerageA4 = @scoreA4 / @counterA4
  @totalavgerageA5 = @scoreA5 / @counterA5
  @totalavgerageA6 = @scoreA6 / @counterA6
  @totalavgerageA7 = @scoreA7 / @counterA7
  @totalavgerageA8 = @scoreA8 / @counterA8
  @totalavgerageA9 = @scoreA9 / @counterA9
  @totalavgerageA10 = @scoreA10 / @counterA10
  @totalavgerageA11 = @scoreA11 / @counterA11
  @totalavgerageA12 = @scoreA12 / @counterA12
  @totalavgerageB1 = @scoreB1 / @counterB1
  @totalavgerageB2 = @scoreB2 / @counterB2
  @totalavgerageB3 = @scoreB3 / @counterB3
  @totalavgerageB4 = @scoreB4 / @counterB4
  @totalavgerageB5 = @scoreB5 / @counterB5
  @totalavgerageB6 = @scoreB6 / @counterB6
  @totalavgerageB7 = @scoreB7 / @counterB7
  @totalavgerageB8 = @scoreB8 / @counterB8
  @totalavgerageB9 = @scoreB9 / @counterB9
  @totalavgerageB10 = @scoreB10 / @counterB10
  @totalavgerageB11 = @scoreB11 / @counterB11
  @totalavgerageB12 = @scoreB12 / @counterB12
  @totalavgerageC1 = @scoreC1 / @counterC1
  @totalavgerageC2 = @scoreC2 / @counterC2
  @totalavgerageC3 = @scoreC3 / @counterC3
  @totalavgerageC4 = @scoreC4 / @counterC4
  @totalavgerageC5 = @scoreC5 / @counterC5
  @totalavgerageC6 = @scoreC6 / @counterC6
  @totalavgerageC7 = @scoreC7 / @counterC7
  @totalavgerageC8 = @scoreC8 / @counterC8
  @totalavgerageC9 = @scoreC9 / @counterC9
  @totalavgerageC10 = @scoreC10 / @counterC10
  @totalavgerageC11 = @scoreC11 / @counterC11
  @totalavgerageC12 = @scoreC12 / @counterC12
  @totalavgerageD1 = @scoreD1 / @counterD1
  @totalavgerageD2 = @scoreD2 / @counterD2
  @totalavgerageD3 = @scoreD3 / @counterD3
  @totalavgerageD4 = @scoreD4 / @counterD4
  @totalavgerageD5 = @scoreD5 / @counterD5
  @totalavgerageD6 = @scoreD6 / @counterD6
  @totalavgerageD7 = @scoreD7 / @counterD7
  @totalavgerageD8 = @scoreD8 / @counterD8
  @totalavgerageD9 = @scoreD9 / @counterD9
  @totalavgerageD10 = @scoreD10 / @counterD10
  @totalavgerageD11 = @scoreD11 / @counterD11
  @totalavgerageD12 = @scoreD12 / @counterD12

  
  erb :'admin/samplescores'
end


get '/admin/users/new/?' do
	admin!
	@user = User.new
	erb :'admin/user'
end

post '/admin/users/new/?' do
	admin!
	puts 'Formatting input'
	params[:email].strip!
	params[:email].downcase!
	
	params[:name].strip!

	params[:phone].strip!
	params[:phone].downcase!
	
	params[:password].strip!
	params[:password].downcase!
    
  params[:expiration_day] = '30' if params[:expiration_day] == '31'
	
	params[:max_exams].is_numeric? ? params[:max_exams] = params[:max_exams].to_i : params[:max_exams] = user.max_exams
	params[:max_scenarios].is_numeric? ? params[:max_scenarios] = params[:max_scenarios].to_i : params[:max_scenarios] = user.max_scenarios
  params[:max_practice_scenarios].is_numeric? ? params[:max_practice_scenarios] = params[:max_practice_scenarios].to_i : params[:max_practice_scenarios] = user.max_practice_scenarios
  
  puts 'Creating user'
	user = User.create(
		admin: 					 	false,
		email: 					 	        params[:email],
		password: 			 	        params[:password],
		name:  				 	 	        params[:name],
		phone: 				 	 	        params[:phone],
		notes:					 	        params[:notes],
    license:					        params[:license],
		max_exams: 		 	 	        params[:max_exams],
		max_scenarios: 	 	        params[:max_scenarios],
    max_practice_scenarios: 	params[:max_practice_scenarios],
		set_a: false,
    set_b: false,
    set_c: false,
    set_d: false,
    hard_copy: false,
    nce_hard_copy: false,
    ncmhce_downloads: false,
    casestudy_downloads: false,
		nce_downloads: 		false,
    nce_flashcards: 	 false,
    ncmhce_flashcards: false,
		expiration_date: Date.from_fields(
			params[:expiration_year],
			params[:expiration_month],
			params[:expiration_day]
		)
	)
	
  puts 'Updating admin'
	user.update(admin: true) if params[:admin]
  
  puts 'Updating practice'
  user.update(practice: true) if params[:practice]
	
  puts 'Updating downloads'
  user.update(casestudy_downloads: true) if params[:casestudy_downloads]
	user.update(ncmhce_downloads: true) if params[:ncmhce_downloads]
	user.update(nce_downloads: true) if params[:nce_downloads]
  
	user.update(set_a: true) if params[:set_a]
  user.update(set_b: true) if params[:set_b]
  user.update(set_c: true) if params[:set_c]
  user.update(set_d: true) if params[:set_d]
  user.update(hard_copy: true) if params[:hard_copy]
  user.update(nce_hard_copy: true) if params[:nce_hard_copy]
  
  user.update(ncmhce_flashcards: true) if params[:ncmhce_flashcards]
	user.update(nce_flashcards: true) if params[:nce_flashcards]

	user.update(workshop_scenarios: true) if params[:workshop_scenarios]
    
  user.update(practice_scenario: true) if params[:practice_scenario]
  
  user.update(practice_exams: true) if params[:practice_exams]
  
  puts 'seting session and redirecting'
	session[:alert] = { style: 'alert-success', message: "#{user.name} has been created." }
	redirect "/admin/users/?"
end

get '/admin/users/:id/?' do
	admin!
	
	@user = User[params[:id]]
  
	@casestudies = Use[params[:user_id]]
  @scenarios = Use[params[:user_id]]
	@exams = Use[params[:user_id]]
  
	erb :'admin/user'
end

post '/admin/users/:id/?' do
	admin!
	
	user = User[params[:id]]
	
	params[:email].strip!
	params[:email].downcase!

	params[:name].strip!

	params[:phone].strip!
	params[:phone].downcase!
    
  params[:expiration_day] = '30' if params[:expiration_day] == '31'
	
	params[:max_exams].is_numeric? ? params[:max_exams] = params[:max_exams].to_i : params[:max_exams] = user.max_exams
	params[:max_scenarios].is_numeric? ? params[:max_scenarios] = params[:max_scenarios].to_i : params[:max_scenarios] = user.max_scenarios
  params[:max_practice_scenarios].is_numeric? ? params[:max_practice_scenarios] = params[:max_practice_scenarios].to_i : params[:max_practice_scenarios] = user.max_practice_scenarios
  
  
  
	user.update(
		email: 				 	          params[:email],
		name:  				 	          params[:name],
		phone: 				 	          params[:phone],
		notes:					          params[:notes],
    license:				          params[:license],
		max_exams: 		 	          params[:max_exams],
		max_scenarios: 	          params[:max_scenarios],
    max_practice_scenarios: 	params[:max_practice_scenarios],
		expiration_date: Date.from_fields(
			params[:expiration_year],
			params[:expiration_month],
			params[:expiration_day]
		)
	)
	
	unless params[:refund_request_year] == '' || params[:refund_request_month] == '' || params[:refund_request_day] == ''
		user.update(refund_request_date: Date.from_fields(params[:refund_request_year], params[:refund_request_month], params[:refund_request_day]))
	else
		user.update(refund_request_date: nil)
	end

	unless params[:refund_check_year] == '' || params[:refund_check_month] == '' || params[:refund_check_date] == ''
		user.update(refund_check_date: Date.from_fields(params[:refund_check_year], params[:refund_check_month], params[:refund_check_day]))
	else
		user.update(refund_check_date: nil)
	end
	
	params[:password].strip!
	params[:password].downcase!
	user.update(password: params[:password]) unless params[:password].length == 0
		
	params[:admin] ? user.update(admin: true) : user.update(admin: false)
  
	params[:set_a] ? user.update(set_a: true) : user.update(set_a: false)
  params[:set_b] ? user.update(set_b: true) : user.update(set_b: false)
  params[:set_c] ? user.update(set_c: true) : user.update(set_c: false)
  params[:set_d] ? user.update(set_d: true) : user.update(set_d: false)
  params[:hard_copy] ? user.update(hard_copy: true) : user.update(hard_copy: false)
  params[:nce_hard_copy] ? user.update(nce_hard_copy: true) : user.update(nce_hard_copy: false)
	
  params[:casestudy_downloads] ? user.update(casestudy_downloads: true) : user.update(casestudy_downloads: false)
  params[:ncmhce_downloads] ? user.update(ncmhce_downloads: true) : user.update(ncmhce_downloads: false)
	params[:nce_downloads] ? user.update(nce_downloads: true) : user.update(nce_downloads: false)
  
	params[:ncmhce_flashcards] ? user.update(ncmhce_flashcards: true) : user.update(ncmhce_flashcards: false)
	params[:nce_flashcards] ? user.update(nce_flashcards: true) : user.update(nce_flashcards: false)
	
	params[:workshop_scenarios] ? user.update(workshop_scenarios: true) : user.update(workshop_scenarios: false)
  params[:practice_exams] ? user.update(practice_exams: true) : user.update(practice_exams: false)
	
	session[:alert] = { style: 'alert-success', message: "#{user.name} has been updated." }
  
	redirect "/admin/users"
end

get '/admin/users/:id/delete/?' do
	admin!
	@user = User[params[:id]]
  @user.remove
	session[:alert] = { style: 'alert-success', message: "User has been removed." }
	redirect request.referrer
end

get '/admin/users/:id/remove/?' do
	admin!
	@user = User[params[:id]]
  @user.remove
	session[:alert] = { style: 'alert-success', message: "User has been removed." }
	redirect "/admin/users"
end

get '/admin/users/:id/remove_sample/?' do
	admin!
	@user = User[params[:id]]
  @user.remove
	session[:alert] = { style: 'alert-success', message: "Sample has been removed." }
	redirect request.referrer
end

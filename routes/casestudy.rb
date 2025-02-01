
get '/casestudies/cs_index_purch/?' do
    
  @casestudies = Casestudy.all
    
  erb :'/casestudies/cs_index_purch'
end

get '/casestudies/cs_index/?' do
	authorize!
	expired?
  
  @user = User[session[:user]]
  
  @casestudies = Casestudy.all
  @caseaverages = Caseaverage.where(user_id: session[:user], sett: params[:sett])
    
  erb :'/casestudies/cs_index'
end

# ----------  set score  ----------

get '/casestudies/:sett/setscore/?' do
	authorize!
	expired?
  
  @user = User[session[:user]]
  
	@casescores = []
	casescores = Casescore.where(user_id: session[:user])
	casescores.each {|s| @casescores << s.caseanswer_id }
  
  @casestudies = Casestudy.where(sett: params[:sett])  
  @casequestions = Casequestion.where(casestudy_id: @casestudies).order(:position)
  @caseanswers = Caseanswer.where(casequestion_id: @casequestions)
  @caseaverage = Caseaverage.where(user_id: session[:user])

    sum = 0
    @caseaverages = Caseaverage.each do  |s|
      if s.sett == params[:sett] && s.user_id == session[:user]
        sum += s.casescore
        @setscore = sum/12
      end
    end
    
    @total1 = 0
    @total2 = 0
    @total4 = 0
    @total5 = 0
    @total6 = 0
    
    @casestudies.each do |cs|
   
      @casequestions = cs.casequestions.each do |cq| 
        
        if cq.domain == "Domain 1. Professional Practice and Ethics"
          @total1 += 1
        elsif cq.domain == "Domain 2. Intake, Assessment, and Diagnosis"
          @total2 += 1
        elsif cq.domain == "Domain 4. Treatment Planning"
          @total4 += 1
        elsif cq.domain == "Domain 5. Counseling Skills and Interventions"
          @total5 += 1
        else cq.domain == "Domain 6. Core Counseling Attributes"
          @total6 += 1
        end
      end
      
    end

      
    @correct1 = 0
    @correct2 = 0
    @correct4 = 0
    @correct5 = 0
    @correct6 = 0
    
  	
    @casestudies.each do |cs|
      
      @casequestions = cs.casequestions.each do |cq|
      if cq.domain == "Domain 1. Professional Practice and Ethics"
        cq.caseanswers.each do |caseanswer|  
          if @casescores.include?(caseanswer.id) && (caseanswer.correct == "true")
            @correct1 += 1
          end
        end 
      elsif cq.domain == "Domain 2. Intake, Assessment, and Diagnosis"
        cq.caseanswers.each do |caseanswer|  
          if @casescores.include?(caseanswer.id) && (caseanswer.correct == "true")
            @correct2 += 1
          end
        end 
      elsif cq.domain == "Domain 4. Treatment Planning"
        cq.caseanswers.each do |caseanswer|
          if @casescores.include?(caseanswer.id) && (caseanswer.correct == "true")
            @correct4 += 1
          end
        end 
      elsif cq.domain == "Domain 5. Counseling Skills and Interventions"
        cq.caseanswers.each do |caseanswer|
          if @casescores.include?(caseanswer.id) && (caseanswer.correct == "true")
            @correct5 += 1
          end
        end 
      else cq.domain == "Domain 6. Core Counseling Attributes"
        cq.caseanswers.each do |caseanswer|
          if @casescores.include?(caseanswer.id) && (caseanswer.correct == "true")
            @correct6 += 1
          end
        end 
      end
    end
  end
       
  erb :'/casestudies/setscore'
end

# ----------  sample  ----------

get '/casestudies/sample/?' do
	unless session[:user]
		user = User.create(email: 'sample', password: 'sample', expiration_date: DateTime.now + 1 )
		session[:user] = user.id
		session[:sample] = true
	end
  user.save
  redirect '/casestudies/1'
end

get '/casestudies/:id/?' do
  expired?
  
  if @casestudies = Casestudy[id: 1]
    sample = true
  else
    authorize!
  end
  
  @user = User[session[:user]]
  @casestudies = Casestudy[params[:id]]
  @charts = Chart.where(casestudy_id: params[:id]).order(:part)
  @casequestions = Casequestion.where(casestudy_id: params[:id]).order(:position)
  caseanswers = Caseanswer.where(casequestion_id: params[:cxasequestion_id])
  @casescores = Casescore.all
  
  erb :'casestudies/csexam'
end

post '/casestudies/:id/?' do 
	expired?
  
  user = User[session[:user]]
  casestudies = Casestudy[params[:id]]
  charts = Chart.where(casestudy_id: params[:id]).order(:part)
  casequestions = Casequestion.where(casestudy_id: params[:id]).order(:position)
  aseanswers = Caseanswer.where(casequestion_id: params[:cxasequestion_id])
  casescores = Casescore.where(user_id: session[:user])

  caseanswers = params.filter {|key, value| key.include?("optionsRadios") }.map { |casequestion, caseanswer| caseanswer.sub!("option", "").to_i }

  caseanswers.each { |caseanswer_id| 
    Casescore.create(
      user_id:          session[:user],
      casestudy_id:     params[:id],
      caseanswer_id:    caseanswer_id
    )
  }
  

  
  redirect "/casestudies/#{params[:id]}/casescore"
end

# ----------  score  ----------

get '/casestudies/:id/casescore/?' do
	expired?
  
  @user = User[session[:user]]
  
	@casescores = []
	casescores = Casescore.where(user_id: session[:user])
	casescores.each {|s| @casescores << s.caseanswer_id }
    
  @casestudies = Casestudy[params[:id]]
  @charts = Chart.where(casestudy_id: params[:id])
  @caseanswers = Caseanswer.where(
    casequestion_id: Casequestion.select(:id).where(casestudy_id: params[:id])
  )
  
	@counter = 0
	@caseanswers.each do |caseanswer|
		if @casescores.include?(caseanswer.id) && caseanswer.correct == "true"
		  caseanswer.id 
      @counter += 1
    end
	end 
  
  @title = @casestudies.title.to_i
  @sett = @casestudies.sett
  
  @percent = (@counter * 100) / 13
  
  Caseaverage.find_or_create(casestudy_id: params[:id], user_id: session[:user], casescore: @percent, title: @title, sett: @sett)
  

  
  erb :'casestudies/casescore'
end

# ----------  restart  ----------

get '/casestudies/:id/caserestart/?' do
	
	expired?

	Casescore.where(user_id: session[:user], casestudy_id: params[:id]).destroy
  Caseaverage.where(user_id: session[:user], casestudy_id: params[:id]).destroy
  
	redirect "/casestudies/#{params[:id]}"
end

get '/casestudies/:id/finished/?' do
	
	Casescore.where(user_id: session[:user], casestudy_id: params[:id]).destroy
  Caseaverage.where(user_id: session[:user], casestudy_id: params[:id]).destroy

  User.where(id: session[:user]).destroy
  
  session[:user] 	 = nil
	session[:admin]  = nil
  
	session[:sample] = nil
	session.clear
    
	redirect "/ncmhce"
end



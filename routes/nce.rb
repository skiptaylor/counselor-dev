get '/nce/?' do
	if session[:user]
		user = User[session[:user]]
		redirect '/nce/exams' if user.max_exams > 0
	end

	erb :nce
end

get '/nce/glossary/?' do
	@exam = 'NCE'
	@glossary = Glossary.where(exam: 'NCE').order(:chapter)
	
  erb :'cards'
end

get '/nce/exams/?' do
	authorize!

	user = User[session[:user]]
	redirect '/nce' unless user.max_exams > 0

	@max_exams = User[session[:user]].max_exams
	@exams = Exam
	
  erb :'nce/index'
end

get '/nce/guide/:id/:group/?' do
	authorize!

	max_exams = User[session[:user]].max_exams

	if (params[:id] == '1') || (params[:id] == '4')
		unless max_exams >= 2
			session[:alert] = { message: "You haven't purchased that exam." }
			redirect '/nce'
		end
	else
		unless max_exams >= 4
			session[:alert] = { message: "You haven't purchased that exam." }
			redirect '/nce'
		end
	end

	@exam = Exam[params[:id]]
	@questions = @exam.questions(:order => :position, score_type2: params[:group])
	@answers = Answer.where(question_id: params[:question_id]).order(:body)
	
  erb :'nce/guide'
end

get '/nce/exams/:id/?' do
	authorize!
	expired?

	max_exams = User[session[:user]].max_exams

	if (params[:id] == '1') || (params[:id] == '4')
		unless max_exams >= 2
			session[:alert] = { message: "You haven't purchased that exam." }
			redirect '/nce'
		end
	else
		unless max_exams >= 4
			session[:alert] = { message: "You haven't purchased that exam." }
			redirect '/nce'
		end
	end

	if Averages.where(exam_id: params[:id], user_id: session[:user]).count > 0
		redirect "/nce/exams/#{params[:id]}/score"
	end
	@scores = []
	Score.where(user_id: session[:user], exam_id: params[:id]).each {|s| @scores << s.answer_id }
	@exam = Exam[params[:id]]
	@questions = Question.where(exam_id: params[:id]).order(:position)
	if params[:group]
		@questions = @questions.where(score_type: params[:group], score_type2: params[:group])
	end
	@answers = Answer.where(question_id: params[:question_id]).order(:body)
	
  erb :'nce/exam'
end

get '/nce/exams/:id/score/?' do
	authorize!
	expired?

	@scores = []
	scores = Score.where(user_id: session[:user], exam_id: params[:id])
	scores.each {|s| @scores << s.answer_id }
	@exam = Exam[params[:id]]
	@questions = Question.where(exam_id: params[:exam_id]).order(:position)
	@answers = Answer.where(question_id: @questions, :order => :body)

	@average = ((scores.where(countable: true, required: true).count.to_f / @exam.questions(:countable => true).count.to_f)*100).to_i

	@average = 0 if @average < 0
	Averages.find_or_create(exam_id: params[:id], user_id: session[:user], score: @average)
  # Averages.find_or_create(exam_id: params[:id], user_id: session[:user], score: @average)
	Use.find_or_create(user_id: session[:user], exam_id: params[:id], sample: @exam.sample)
  
	@breakdown = {}
	@breakdown['Professional Orientation'] 				 = {possible: 0, correct: 0}
	@breakdown['Research and Program Evaluation']  = {possible: 0, correct: 0}
	@breakdown['Appraisal']	 											 = {possible: 0, correct: 0}
	@breakdown['Lifestyle and Career Development'] = {possible: 0, correct: 0}
	@breakdown['Helping Relationships'] 					 = {possible: 0, correct: 0}
	@breakdown['Group Counseling'] 								 = {possible: 0, correct: 0}
	@breakdown['Human Growth and Development'] 		 = {possible: 0, correct: 0}
	@breakdown['Social and Cultural Foundations']  = {possible: 0, correct: 0}
	@breakdown['Undefined']  											 = {possible: 0, correct: 0}

	@exam.questions(:countable => true).each do |q|
		@breakdown[q.score_type][:possible] += 1
	end

	scores.each do |s|
		@breakdown[s.score_type][:correct] += 1 if s.required && s.countable
	end
	
  @breakdown2 = {} 
	@breakdown2['Domain 1: Professional Practice and Ethics']     = {possible: 0, correct: 0}
	@breakdown2['Domain 2: Intake, Assessment, and Diagnosis']    = {possible: 0, correct: 0}
	@breakdown2['Domain 3: Areas of Clinical Focus']	 						= {possible: 0, correct: 0}
	@breakdown2['Domain 4: Treatment Planning']                   = {possible: 0, correct: 0}
	@breakdown2['Domain 5: Counseling Skills and Interventions']  = {possible: 0, correct: 0}
	@breakdown2['Domain 6: Core Counseling Attributes'] 					= {possible: 0, correct: 0}
	@breakdown2['Undefined']  											              = {possible: 0, correct: 0}

	@exam.questions(:countable => true).each do |q|
		@breakdown2[q.score_type2][:possible] += 1
	end

  scores.each do |s|
		 @breakdown2[s.score_type2][:correct] += 1 if s.required && s.countable
	end

	if params[:group]
		@questions = @questions.where(score_type: params[:group], score_type2: params[:group])
	end

	erb :'nce/exam'
end

get '/nce/exams/:id/restart/?' do
	authorize!
	expired?

	Score.where(user_id: session[:user], exam_id: params[:id]).destroy
	Averages.where(exam_id: params[:id], user_id: session[:user]).destroy
	
  redirect "/nce/exams/#{params[:id]}"
end

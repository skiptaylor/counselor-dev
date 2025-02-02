post '/add-score/?' do
  
  answers = Answer[params[:answer_id]]

	Score.where(user_id: session[:user], question_id: answers.question_id).destroy if answers.question.exam_id

	Score.where(user_id: session[:user], answer_id: answer.id).destroy if answers.question.scenario_id

	Score.create(
		user_id: 		 session[:user],
		answer_id: 	 answers.id,
		question_id: answers.question_id,
		exam_id: 		 answers.question.exam_id,
		scenario_id: answers.question.scenario_id,
		value: 			 answers.value,
		required:		 answers.required,
		score_type:  answers.question.score_type,
    score_type2: answers.question.score_type2,
		countable: 	 answers.question.countable
	)
	
	sample = false
	
	if answers.question.scenario_id
		sample = true if answers.question.scenario.sample
	elsif answers.question.exam_id
		sample = true if answers.question.exam.sample
	end
	
	Use.find_or_create(
		user_id: session[:user],
		scenario_id: answers.question.scenario_id,
		exam_id: answers.question.exam_id,
		sample: sample
	)
  
end
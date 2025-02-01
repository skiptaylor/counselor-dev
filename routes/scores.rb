post '/add-score/?' do
  
  answer = Answer params[:answer]

	Score.where(user_id: session[:user], question_id: answer.question_id).destroy if answer.question.exam_id

	Score.where(user_id: session[:user], answer_id: answer.id).destroy if answer.question.scenario_id

	Score.create(
		user_id: 		 session[:user],
		answer_id: 	 answer.id,
		question_id: answer.question_id,
		exam_id: 		 answer.question.exam_id,
		scenario_id: answer.question.scenario_id,
		value: 			 answer.value,
		required:		 answer.required,
		score_type:  answer.question.score_type,
    score_type2: answer.question.score_type2,
		countable: 	 answer.question.countable
	)
	
	sample = false
	
	if answer.question.scenario_id
		sample = true if answer.question.scenario.sample
	elsif answer.question.exam_id
		sample = true if answer.question.exam.sample
	end
	
	Use.find_or_create(
		user_id: session[:user],
		scenario_id: answer.question.scenario_id,
		exam_id: answer.question.exam_id,
		sample: sample
	)
  
end
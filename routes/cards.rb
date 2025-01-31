get "/cards/?" do
	authorize!
  @cards = Glossary.where(exam: 'NCE').order(:chapter)
	erb :'cards'
end

get "/cards/:exam/:chapter/?" do
	authorize!
	@cards = Glossary.where(exam: params[:exam], chapter: params[:chapter]).order(:term)
	erb :'card'
end
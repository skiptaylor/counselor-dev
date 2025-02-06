get '/admin/glossaries/other?' do
	admin!
  @glossaries = Glossary.all
	n = Glossary.where(exam: nil)
	s = Glossary.where(exam: '')
	@glossary = n | s
  
  
	# @glossary.unique
  
  
	@glossaries.each do |g|
		g.chapter = '' if g.chapter.nil?
	end
	
  erb :'admin/glossaries'
end

get '/admin/glossaries/ncmhce?' do
	admin!
	@glossaries = Glossary.where(exam: 'NCMHCE').order(:chapter)  # need to order term
	erb :'admin/glossaries'
end

get '/admin/glossaries/nce?' do
	admin!
	@glossaries = Glossary.where(exam: 'NCE').order(:chapter)   # need to order term
	erb :'admin/glossaries'
end

get '/admin/glossaries/new/?' do
	admin!
	@term = Glossary.new
	erb :'admin/term'
end

post '/admin/glossaries/new/?' do
	admin!
	Glossary.create(
		term: params[:term],
		definition: params[:definition],
    short_def: params[:short_def],
		exam: params[:exam],
		chapter: params[:chapter]
	)
	session[:alert] = {
		style: 'alert-success',
		message: "#{params[:term]} has been created."
	}
	params[:exam] = 'other' if params[:exam].empty?
	redirect "/admin/glossaries/#{params[:exam].downcase}"
end

get '/admin/glossaries/:id/?' do
  admin!
  @term = Glossary[params[:id]]
  erb :'admin/term'
end

post '/admin/glossaries/:id/?' do
  admin!
  @term = Glossary[params[:id]]
  @term.update(
    term: params[:term],
    definition: params[:definition],
    short_def: params[:short_def],
    exam: params[:exam],
    chapter: params[:chapter]
  )
  session[:alert] = {
    style: 'alert-success',
    message: "#{params[:term]} has been updated."
  }
  params[:exam] = 'other' if params[:exam].empty?
  redirect "/admin/glossaries/#{params[:exam].downcase}"
end

get '/admin/glossaries/:id/delete/?' do
	admin!
	term = Glossary[params[:id]]
	term.destroy
		session[:alert] = {
		style: 'alert-success',
		message: "#{params[:id]} has been removed."
	}
	redirect request.referrer
end
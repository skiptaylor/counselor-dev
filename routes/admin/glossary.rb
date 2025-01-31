get '/admin/glossary/other?' do
	admin!
  @glossary = Glossary.all
	n = Glossary.where(exam: nil)
	s = Glossary.where(exam: '')
	@glossary = n | s
  
  
	# @glossary.unique
  
  
	@glossary.each do |g|
		g.chapter = '' if g.chapter.nil?
	end
	
  erb :'admin/glossary'
end

get '/admin/glossary/ncmhce?' do
	admin!
	@glossary = Glossary.where(exam: 'NCMHCE')   # need to order term
	erb :'admin/glossary'
end

get '/admin/glossary/nce?' do
	admin!
	@glossary = Glossary.where(exam: 'NCE')   # need to order term
	erb :'admin/glossary'
end

get '/admin/glossary/new/?' do
	admin!
	@term = Glossary.new
	erb :'admin/term'
end

post '/admin/glossary/new/?' do
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
	redirect "/admin/glossary/#{params[:exam].downcase}"
end

get '/admin/glossary/:id/?' do
  admin!
  @term = Glossary[params[:id]]
  erb :'admin/term'
end

post '/admin/glossary/:id/?' do
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
  redirect "/admin/glossary/#{params[:exam].downcase}"
end

get '/admin/glossary/:id/delete/?' do
	admin!
	term = Glossary[params[:id]]
	term.destroy
		session[:alert] = {
		style: 'alert-success',
		message: "#{params[:id]} has been removed."
	}
	redirect request.referrer
end
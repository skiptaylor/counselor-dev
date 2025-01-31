get '/admin/casestudies/:casestudy_id/casequestions?' do
	admin!
  @casestudies = Casestudy[params[:casestudy_id]]
	@casequestions = Casequestion[params[:id]]

	erb :'admin/casequestions'
end


get '/admin/casestudies/:casestudy_id/casequestions/new/?' do
	admin!
  @casestudies = Casestudy[params[:casestudy_id]]
	@casequestions = Casequestion.new

	erb :'admin/casequestion_new'
end

post '/admin/casestudies/:casestudy_id/casequestions/new/?' do
	admin!
  casestudies = Casestudy[params[:casestudy_id]]
  casequestions = Casequestion.create(
	  casestudy_id: params[:casestudy_id], 
    number:       params[:number],
    part:         params[:part],
    position:     params[:position],
    body:         params[:body],
    domain:       params[:domain],
    sub_domain:   params[:sub_domain],
    discussion:   params[:discussion]
  )
  
	redirect "/admin/casestudies/#{params[:id]}/edit"
end

get '/admin/casestudies/:casestudy_idd/casequestions/:casequestion_id/view/?' do
	admin!
  @casestudies = Casestudy[params[:casestudy_id]]
	@casequestions = Casequestion[params[:id]]

	erb :'admin/casestudy_edit'
end


get '/admin/casestudies/:casestudy_id/casequestions/:id/edit/?' do
	admin!
	@casestudies = Casestudy[params[:casestudy_id]]
  @casequestions = Casequestion[params[:id]]

	erb :'admin/casequestion_edit'
end

post '/admin/casestudies/:casestudy_id/casequestions/:id/edit/?' do
	admin!
  casestudies = Casestudy[params[:casestudy_id]]
  casequestions = Casequestion[params[:id]]
  casequestions.update(
    number:       params[:number],
    part:         params[:part],
    position:     params[:position],
    body:         params[:body],
    domain:       params[:domain],
    sub_domain:   params[:sub_domain],
    discussion:   params[:discussion]
  )
  
	redirect "/admin/casestudies/#{params[:casestudy_id]}/edit"
  
end

get '/admin/casestudies/:casestudy_id/casequestions/:casequestion_id/delete/?' do
  admin!
  casestudies = Casestudy[params[:casestudy_id]]
  casequestions = Casequestion[params[:id]]
  casequestions.destroy
  
  redirect "/admin/casestudies/#{params[:casestudy_id]}/edit"
end



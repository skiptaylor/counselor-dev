get '/admin/casestudies/:casestudy_id/casequestions/:casequestion_id/caseanswers/new/?' do
	admin!
  @casestudies = Casestudy[params[:casestudy_id]]
  @casequestions = Casequestion[params[:casequestion_id]]
  @caseanswers = Caseanswer[params[:id]].new
  
  erb :'admin/caseanswers_new'
end
 
post '/admin/casestudies/:casestudy_id/casequestions/:casequestion_id/caseanswers/new/?' do
	admin!
  casestudies = Casestudy[params[:casestudy_id]]
  casequestions = Casequestion[params[:casequestion_id]]
  caseanswers = Caseanswer[params[:id]].create(
    :position         => params[:position],
    :body             => params[:body],
    :correct          => params[:correct]
  ) 
  
  redirect "/admin/casestudies/#{params[:casestudy_id]}/casequestions/#{params[:casequestion_id]}/edit"
end

get '/admin/casestudies/:casestudy_id/casequestions/:casequestion_id/caseanswers/:id/edit/?' do
	admin!
  @casestudies = Casestudy[params[:casestudy_id]]
  @casequestions = Casequestion[params[:casequestion_id]]
  @caseanswers = Caseanswer[params[:id]]
  
  erb :'admin/caseanswers_edit'
end

post '/admin/casestudies/:casestudy_id/casequestions/:casequestion_id/caseanswers/:id/edit/?' do
	admin!
  @casestudies = Casestudy[params[:casestudy_id]]
  @casequestions = Casequestion[params[:casequestion_id]]
  @caseanswers = Caseanswer[params[:id]].update(
    :position         => params[:position],
    :body             => params[:body],
    :correct          => params[:correct]
  )
  
  redirect "/admin/casestudies/#{params[:casestudy_id]}/casequestions/#{params[:casequestion_id]}/edit"
end

get '/admin/casestudies/:casestudy_id/casequestions/:casequestion_id/caseanswers/:caseanswer_id/delete/?' do
	admin!
  casestudies = Casestudy[params[:casestudy_id]]
  casequestions = Casequestion[params[:casequestion_id]]
  caseanswers = Caseanswer[params[:id]]
  caseanswers.delete
  
  redirect "/admin/casestudies/#{params[:casestudy_id]}/casequestions/#{params[:casequestion_id]}/edit"
end

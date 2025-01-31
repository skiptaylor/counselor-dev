get '/admin/casestudies/:casestudy_id/charts?' do
	admin!
  @casestudies = Casestudy[params[:casestudy_id]]
	@charts = @casestudies.charts.all

	erb :'admin/charts'
end

get '/admin/casestudies/:casestudy_id/charts/new/?' do
	admin!
  @casestudies = Casestudy[params[:casestudy_id]]
	@chart = Chart.new

	erb :'admin/chart_new'
end

post '/admin/casestudies/:casestudy_id/charts/new/?' do
	admin!
  casestudies = Casestudy[params[:casestudy_id]]
  chart = Chart.create(
	  part: params[:part],
    position: params[:position],
    title: params[:title],
    body: params[:body]
  )
  
	# session[:alert] = { style: 'alert-success', message: "Chart Created" }
	redirect "/admin/casestudies/#{casestudies.id}/edit"
end

get '/admin/casestudies/:casestudy_id/charts/:id/view/?' do
	admin!
  @casestudies = Casestudy[params[:casestudy_id]]
	@charts = Chart[params[:id]]

	erb :'admin/chart'
end

get '/admin/casestudies/:casestudy_id/charts/:id/edit/?' do
	admin!
	@casestudies = Casestudy[params[:casestudy_id]]
  @charts = Chart[params[:id]]

	erb :'admin/chart_edit'
end

post '/admin/casestudies/:casestudy_id/charts/:id/edit/?' do
	admin!
  casestudies = Casestudy[params[:casestudy_id]]
  charts = Chart[params[:id]]
  charts.update(
	  part: params[:part],
    position: params[:position],
    title: params[:title],
    body: params[:body]
  )
  
	# session[:alert] = { style: 'alert-success', message: "Chart Created" }
	redirect "/admin/casestudies/#{casestudies.id}/edit"
  
end

get '/admin/casestudies/:casestudy_id/charts/:id/delete/?' do
  admin!
  casestudies = Casestudy[params[:casestudy_id]]
  charts = Chart[params[:id]]
  charts.destroy
  redirect "/admin/casestudies/#{casestudies.id}/edit"
end

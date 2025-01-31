get '/admin/certificates/?' do
	admin!
	
	@uses = Use.where(:cert_date.not => nil)
  # if params[:search] && !params[:search].nil?
#     @uses = Use.where(conditions: ["cert_date ILIKE ?", "%#{params[:search].strip}%"])
#   else
#     @uses = Use.where(:cert_date.not => nil, limit: 30)
#   end

	erb :'admin/certificates'
end


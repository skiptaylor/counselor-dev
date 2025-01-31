get '/manuals/:manual_id/manuals/?' do
   authorize!
   @user = User[session[:user]]
   @manual = Manual[params[:manual_id]]
	
	erb :'manuals/ncmhce_guide'
end

get '/manuals/:manual_id/sections/cover/?' do
   authorize!
   @user = User[session[:user]]
   @manual = Manual[params[:manual_id]]
   @section = Section.where(manual_id: params[:manual_id])
	
	erb :'manuals/sections'
end

get '/manuals/:manual_id/sections/:section_id/chapters/?' do
  authorize!
  @user = User[session[:user]]
  @manual = Manual[params[:manual_id]]
  @section = Section.where(manual_id: params[:manual_id])
  @chapter = Chapter.where(section_id: params[:section_id])
  

  erb :'manuals/chapters'
end

get '/manuals/:manual_id/sections/:section_id/chapters/:chapter_id/chapter/?' do
  authorize!
  @user = User[session[:user]]
  @manual = Manual[params[:manual_id]]
  @section = Section[params[:section_id]]
  @chapter = Chapter[params[:chapter_id]]

  erb :'manuals/chapter'
end

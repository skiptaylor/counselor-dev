get '/ncmhce/?' do
  # if session[:user]
  #   user = User[session[:user]]
  #   redirect '/ncmhce/scenarios' if user.exam_scenario > 0
  # end

  erb :ncmhce
end

get '/?' do
  erb :welcome
end

get '/welcome/?' do
  erb :welcome
end

get '/ncmhce/?' do
  erb :ncmhce
end

get '/nce/?' do
  erb :nce
end

get '/faq/?' do
  erb :faq
end


get '/feedback/?' do
  erb :feedback
end



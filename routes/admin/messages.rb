get '/admin/messages/?' do
  admin!
  
  @messages = Message.all
  
  erb :'admin/messages'
end

get '/admin/messages/new/?' do
  admin!
  
  @messages = Message.all
  
  erb :'admin/messages_new'
end

post '/admin/messages/new/?' do
  admin!
  
  message = Message.create(body: params[:body].strip)
  params[:profile]      ? message.update(:profile => true)         : message.update(:profile => false)
  params[:casestudies]  ? message.update(:casestudies => true)     : message.update(:casestudies => false)
  params[:nce]          ? message.update(:nce => true)             : message.update(:nce => false)
  
  redirect '/admin/messages'
end

get '/admin/messages/:id/edit/?' do
  admin!
  
  @messages = Message[params[:id]]
  
  erb :'admin/messages_edit'
end

post '/admin/messages/:id/edit/?' do
  admin!
  
  messages = Message[params[:id]]
  
  messages.update(body: params[:body].strip)
  
  params[:profile]      ? messages.update(:profile => true)         : messages.update(:profile => false)
  params[:casestudies]  ? messages.update(:casestudies => true)     : messages.update(:casestudies => false)
  params[:nce]          ? messages.update(:nce => true)             : messages.update(:nce => false)
    
  redirect '/admin/messages'
end

get '/admin/messages/:id/delete/?' do
  admin!
  
  messages = Message[params[:id]]
  messages.destroy
  
  redirect '/admin/messages'
end

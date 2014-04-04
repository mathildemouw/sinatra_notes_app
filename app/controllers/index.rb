get '/' do
  @notes = Note.all
  erb :index
end

get '/notes/new' do
  erb :new
end

post '/notes/new' do
  Note.create(content: params[:content])
  redirect '/'
end

get '/notes/:id/edit' do
  @editee = Note.find(params[:id])
  erb :edit
end

put '/notes/:id' do
  editee = Note.find(params[:id])
  editee.update_attributes(content: params[:content])
  redirect '/'
end

delete '/notes/:id' do
  deletee = Note.find(params[:id])
  deletee.destroy
  redirect '/'
end
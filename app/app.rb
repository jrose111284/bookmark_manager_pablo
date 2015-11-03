require 'sinatra/base'
require './app/models/link'

class BookmarkManager < Sinatra::Base
enable :sessions

	get '/links' do
		@links=Link.all
		erb(:'links/index')
	end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end

  get '/links/new' do
    erb(:'links/new')
  end

run! if file = $0

end
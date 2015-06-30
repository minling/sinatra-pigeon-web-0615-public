# create your PigeonsController here
# it should inherit from ApplicationController

class PigeonsController < ApplicationController
  get '/pigeons' do
    @pigeons = Pigeon.all
     erb :'pigeons/index'
  end

  get '/pigeons/new' do
    erb :'pigeons/new'
  end

  get '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
   erb :'pigeons/show'
  end

  get '/pigeons/:id/edit' do
    @pigeon = Pigeon.find(params[:id])
    erb :'pigeons/edit'
  end

  post '/pigeons' do

    @pigeon = Pigeon.create(params)
    redirect '/pigeons'
  end

   delete '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    @pigeon.destroy
    redirect '/pigeons'
  end

  patch '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    @pigeon.update(:color => params[:color])
    redirect "/pigeons/#{params[:id]}"
  end

end
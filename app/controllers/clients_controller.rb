class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end


  def new
    @client = Client.new
  end

  def create
    @client = Client.new(form_params)

    if @client.save
      redirect_to clients_path
    else
      render 'new'
    end

  end



  private

  def form_params
    params.require(:client).permit(:name, :info)
  end


end

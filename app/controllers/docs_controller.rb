class DocsController < ApplicationController

  def index
    @docs = Doc.all
  end

  def show
    @client = Client.find(params[:client_id])
    @doc = @client.docs.find(params[:id])
  end

  def new
    @client = Client.find(params[:client_id])
    @doc = @client.docs.new
  end

  def create
    @client = Client.find(params[:client_id])
    @doc = @client.docs.new(params.require(:doc).permit(:number, :description, :price))

    @doc.save

    redirect_to client_path(@client)
  end

end

class DocsController < ApplicationController

  def index
    @docs = Doc.all
  end

  def show
    @client = Client.find(params[:client_id])
    @doc = @client.docs.find(params[:id])

    @price = @doc.price
    @inps = @price * 4 / 100
    @ritenuta = @price * 20 / 100
    @total = @price + @inps - @ritenuta

  end

  def new
    @client = Client.find(params[:client_id])
    @doc = @client.docs.new
  end

  def create
    @client = Client.find(params[:client_id])
    @doc = @client.docs.new(form_params)

    @doc.save

    redirect_to client_path(@client)
  end

  def edit
    @client = Client.find(params[:client_id])
    @doc = @client.docs.find(params[:id])
  end

  def update
    @client = Client.find(params[:client_id])
    @doc = @client.docs.find(params[:id])

    if @doc.update(form_params)
      redirect_to doc_path(@doc)
    else
      render "edit"
    end

  end

  def destroy
  end

  private

  def form_params
    params.require(:doc).permit(:number, :description, :price)
  end


end

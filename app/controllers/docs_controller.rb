class DocsController < ApplicationController


  def index
    @docs = Doc.all
  end

  def show
    @client = Client.find(params[:client_id])
    @doc = @client.docs.find(params[:id])

    @price = @doc.price_in_euro
    @inps = @price * 4 / 100
    @ritenuta = (@price + @inps) * 20 / 100
    @total = @price + @inps - @ritenuta

    respond_to do |format|
      format.html
      format.pdf { render template: 'docs/show', pdf: @doc.number}
    end
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
      flash[:success] = "Woo, you updated your doc"
      redirect_to client_doc_path(@client, @doc)
    else
      render "edit"
    end
  end

  def destroy
    @client = Client.find(params[:client_id])
    @doc = @client.docs.find(params[:id])

    if @doc.destroy
      flash[:success] = "Woo, you destryed your doc"
      redirect_to client_path(@client)
    else
      flash[:error] = "Ops, something went wrong"
    end
  end


  private

  def form_params
    params.require(:doc).permit(:number, :order_number, :date, :payment, :deadline, :description, :price)
  end


end

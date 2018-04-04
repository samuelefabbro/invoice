class DocsController < ApplicationController

  def new
    @client = Client.find(params[:client_id])
  end

# @invoice = @client.invoices.new


end

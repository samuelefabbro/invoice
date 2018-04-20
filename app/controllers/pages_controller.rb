class PagesController < ApplicationController

  def home
    @docs = Doc.all
    @clients = Client.all
  end

  def show
  end

end

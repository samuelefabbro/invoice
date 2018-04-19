class PagesController < ApplicationController

  def home
    @docs = Doc.all
  end

  def show
  end

end

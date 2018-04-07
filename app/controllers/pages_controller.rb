class PagesController < ApplicationController

  def home
    @docs = Doc.all
  end

end

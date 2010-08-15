class HomeController < ApplicationController
  def index
    @collections = Collection.all(:order => "collected_on")
  end

end

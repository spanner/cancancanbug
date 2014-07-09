class ThingsController < ApplicationController
  respond_to :html
  load_and_authorize_resource
  
  def index
    respond_with @things
  end
  
  def new
    respond_with @thing
  end
end
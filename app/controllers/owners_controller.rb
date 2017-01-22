class OwnersController < ApplicationController
  def index
    @spaces = Space.where()
  end
end

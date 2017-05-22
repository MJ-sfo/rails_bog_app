class CreaturesController < ApplicationController
  def index
    @creatures = Creatures.all
  end
end

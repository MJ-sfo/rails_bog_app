class CreaturesController < ApplicationController
# display all creatures
  def index
    # get all creatures from db and save to instance variable
    @creatures = Creature.all
    # render the index view (it has access to instance variable)
    # remember the default behavior is to render :index
  end
end

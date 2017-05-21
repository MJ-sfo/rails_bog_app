class CreaturesController < ApplicationController
# display all creatures
  def index
    # get all creatures from db and save to instance variable
    @creatures = Creature.all
    # render the index view (it has access to instance variable)
    # remember the default behavior is to render :index
  end

  # show the new creature form
  def new
    # remember the default behavior is to render :new
  end

  def create
    creature_params = params.require(:creature).permit(:name, :description)
    creature = Creature.new(creature_params)
    if creature.save
      redirect_to creature_params
    end
  end    #def create
end

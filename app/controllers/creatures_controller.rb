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
    @creature = Creature.new
    # remember the default behavior is to render :new, url: "/creatures", method: "post"
  end

  def create

    # create a new creature from `creature_params`
    creature = Creature.new(creature_params)

    # this moved to private
    # whitelist params and save them to a variable
    # creature_params = params.require(:creature).permit(:name, :description)

    # if creature saves, redirect to route that displays all creatures
    if creature.save
      redirect_to creatures_path
      # redirect_to creatures_path is equivalent to:
      # redirect_to "/creatures"
    end
  end    #def create

  def show
    # get the creature id from the url params
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
  end

  def edit
    # get the creature id from the url params
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)

    # this moved to private
    # creature_params = params.require(:creature).permit(:name, :description)

    # creature.update_attributes(creature_params)
    # redirect_to creatures_path(creature)
    # redirect_to creature_path(creature) is equivalent to:
    # redirect_to "/creatures/#{creature.id}"
  end

  def update
    creature_id = params[:id]
    creature = Creature.find_by_id(creature_id) # no '@' for creature
    # moved to private
    # creature_params = params.require(:creature).permit(:name, :description)

    # update the creature
    creature.update_attributes(creature_params)

    # redirect to show page for the updated creature
    redirect_to creature_path(creature)
  end

  def destroy
    creature_id = params[:id]
    creature = Creature.find_by_id(creature_id) # no '@' for creature

    # update the creature
    creature.destroy

    # redirect to creatures index
    redirect_to creatures_path
  end

  private
  # above variable 'creature_params' now changed to function 'creature_params'
  def creature_params
    # whitelist params return whitelisted version
    params.require(:creature).permit(:name, :description)
  end

end    #   class CreaturesController

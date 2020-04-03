class CocktailsController < ApplicationController

  before_action :set_cocktail, only: %i[show] # c'è sempre quando ho bisogno di un ID di un cocktail che esiste già cioe quando c'è show , update(carico il db) destroy edit(è la pagina dove la modifico)

  # GET /cocktails

  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktails/new

  def new
    @cocktail = Cocktail.new
  end

  # POST /cocktails

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail, notice: 'The Cocktail was successfully created.'
    else
      render :new
    end
  end

  # GET /cocktails/:id

  def show
    @cocktail = Cocktail.new
  end

  # Use callbacks to share common setup or constraints between actions.

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredients, :doses)
  end
end

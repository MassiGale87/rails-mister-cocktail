class DosesController < ApplicationController

  before_action :set_dose, only: %i[destroy]

  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save

      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cocktail), notice: 'The dose was successfully destroyed.'
  end
end

private

 # Use callbacks to share common setup or constraints between actions.

def set_dose
    @dose = Dose.find(params[:id])
  end

def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
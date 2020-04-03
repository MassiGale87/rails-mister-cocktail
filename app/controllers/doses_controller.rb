class DosesController < ApplicationController

  before_action :set_dose, only: %i[destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)

    if @dose.save
      redirect_to cocktails_show_path(@dose.cocktail), notice: 'The Dose was successfully created.'
    else
      render :new
    end

  end

  def destroy
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktails_show_path(cocktail), notice: 'The dose was successfully destroyed.'
  end
end

private

 # Use callbacks to share common setup or constraints between actions.

def set_dose
    @dose = Dose.find(params[:id])
  end

def dose_params
    params.require(:dose).permit(:description)
  end

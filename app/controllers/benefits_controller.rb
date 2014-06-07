class BenefitsController < ApplicationController
  before_action :set_benefit, only: [:show]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefit
      @benefit = Benefit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def benefit_params
      params.require(:benefit).permit(:title, :subtitle, :content, :link)
    end
end

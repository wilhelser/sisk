class BenefitsController < ApplicationController
  before_action :set_benefit, only: [:show]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefit
      @benefit = Benefit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def benefit_params
      params.require(:benefit).permit(:title, :subtitle, :content, :link, :category_ids, :site_ids, :link_one_text, :link_two, :link_two_text, :link_three, :link_three_text, :category_id, :position)
    end
end

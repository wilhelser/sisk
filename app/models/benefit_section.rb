class BenefitSection < ActiveRecord::Base
  belongs_to :benefit
  belongs_to :section
end

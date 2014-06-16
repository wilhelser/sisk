class Site < ActiveRecord::Base
  has_many :users
  has_and_belongs_to_many :benefits

  def savings_benefits
    self.benefits.where(:category_id => 1)
  end

  def health_benefits
    self.benefits.where(:category_id => 2)
  end

  def insurance_benefits
    self.benefits.where(:category_id => 3)
  end

  def security_benefits
    self.benefits.where(:category_id => 4)
  end
end

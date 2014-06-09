class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :site
  after_create :send_welcome_email

  def can_access_site(site)
    if site == self.site
      true
    else
      false
    end
  end

  private
  def send_welcome_email
    Notifier.welcome_email(self).deliver
  end
end

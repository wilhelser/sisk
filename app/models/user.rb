class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :site
  validates :first_name, :last_name, :email, :password, :password_confirmation, :member_id, :login_code, presence: true
  before_create :set_site
  after_create :send_welcome_email

  def can_access_site(site)
    if site == self.site
      true
    else
      false
    end
  end

  def generate_uuid
    cs = [*'0'..'9']
    10.times.map { cs.sample }.join
  end

  private
  def set_site
    @code = self.login_code
    @site = Site.find_by_site_code(@code)
    self.site = @site
    self.uuid = generate_uuid
  end

  def send_welcome_email
    Notifier.welcome_email(self).deliver
  end
end

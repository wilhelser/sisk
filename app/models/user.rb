# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  site_id                :integer
#  first_name             :string(60)
#  last_name              :string(60)
#  member_id              :integer
#  login_code             :integer
#  email_updates          :boolean          default(FALSE)
#  uuid                   :string(10)
#  ent_registered         :boolean          default(FALSE)
#  authentication_token   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  belongs_to :site
  validates :first_name, :last_name, :email, :password, :member_id, :login_code, presence: true
  validates_uniqueness_of :member_id
  validate :is_not_old_member_id
  validate :login_code_is_valid
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
    9.times.map { cs.sample }.join
  end

  def is_not_old_member_id
    if member_id == "0045508563"
      errors.add(:member_id, "Member id is not valid.")
    end
  end

  def login_code_is_valid
    @results = Site.all.map {|s| s.name }
    @id = self.login_code.to_s
    unless @results.include?(@id)
      errors.add(:login_code, "Login code is not valid.")
    end
  end

  def has_registered_with_ent_api?
    self.ent_registered?
  end

  def is_superadmin?
    self.id == 4
  end

  def register_with_entertainment
    HTTParty.get("http://api.entertainment.com/AtomServer3/feeds/register?uuid=#{self.uuid}&firstName=#{self.first_name}&lastName=#{self.last_name}&action=SAVE", basic_auth: { username: "INFO@SISK.COM", password: "T1aPw4SjF" })
    Rails.logger.info "Registered!"
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

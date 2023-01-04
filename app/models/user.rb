class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  has_one :seller, dependent: :destroy
  has_one :buyer, dependent: :destroy
  has_one :rider, dependent: :destroy
  
  #reject seller if address is blank or telephone is blank
  accepts_nested_attributes_for :seller
  accepts_nested_attributes_for :buyer
  accepts_nested_attributes_for :rider
  
  def seller
    # print "seller"
    super || build_seller
  end

  def buyer
    super || build_buyer
  end

  def rider
    super || build_rider
  end

  attr_writer :login

  validate :validate_username

  def login
    @login || self.username || self.email
  end

  def validate_username
    if User.where(username: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def email_changed?
    false
  end

  def email_required?
    false
  end
 
  def will_save_change_to_email?
    false
  end

  def seller
    super || build_seller
  end

end

class Usuario < ActiveRecord::Base
  has_many :userstory
  belongs_to :proyecto

  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username
  validates_length_of :username, :within => 3..40
  validates_length_of :password, :within => 5..40
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"  

  attr_accessor :password

  def get_rol
    case self.rol
    when "po"
      return "Product Owner"
    when "sm"
      return "Scrum Master"
    when "tm"
      return "Team Member"
    end
  end

  def encrypt_pass(pass)
    return Digest::SHA1.hexdigest(pass + "random-salt")
  end

  def password=(pass)
    @password=pass
    self.hashed_password = self.encrypt_pass(@password)
  end

  def login(pass)
    return self.hashed_password == self.encrypt_pass(pass)
  end
end

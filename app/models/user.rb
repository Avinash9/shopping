require 'digest/sha2'

class User < ActiveRecord::Base
  #Validations
  validates_length_of :username, :in => 4..40
  validates_length_of :hashed_password, :in => 4..40
  validates_presence_of :username, :hashed_password, :email, :salt
  validates_uniqueness_of :username, :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  #validates_confirmation_of :password #What is this?

  attr_protected :id, :salt
  attr_accessor :password, :password_confirmation

  attr_accessible :username, :hashed_password, :user_type,
                  :firstname, :lastname, :gender, :bday_day, :bday_month, :bday_year,
                  :s_addr_str_no, :s_addr_str_name, :s_addr_city, :s_addr_state, :s_addr_zip,
                  :b_addr_str_no, :b_addr_str_name, :b_addr_city, :b_addr_state, :b_addr_zip,
                  :shipping_billing_same, :email, :password, :password_confirmation

#Association
  has_many :shoppingcarts, :dependent => :delete_all
  has_many :orders, :dependent => :delete_all

  def User.authenticate(username, password)
    u = find(:first, :conditions => ["username = ?", username])
    return NIL if u.nil?
    return u if User.encrypt(password, u.salt) == u.hashed_password
    nil
  end

  def password=(password)
    @password = password
    self.salt = User.random_string(10) if !self.salt?
    self.hashed_password = User.encrypt(@password, self.salt)
  end

=begin
  def User.login_authenticate (username, password)
    if user = find_by_username_and_hashed_password(username,password)
      user
    else
      NIL
    end
  end

  def send_new_password
    new_pass = User.random_string(10)
    self.password = self.password_confirmation = new_pass
    self.save
    Notifications.deliver_forgot_password(self.email, self.login, new_pass)
  end

=end

  protected

  def User.random_string(len)
    #generate a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end

  def User.encrypt(password, salt)
    Digest::SHA1.hexdigest(password+salt)
  end

end
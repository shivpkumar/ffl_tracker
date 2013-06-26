class Admin < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  
  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  validates_uniqueness_of :email

  def remove_sensitive_error_messages
    self.errors.full_messages.delete_if { |error| error =~ /digest/ }
  end
end

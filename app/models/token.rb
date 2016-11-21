class Token < ActiveRecord::Base
  belongs_to :user
  before_create :generate_token
  def is_valid?
  	DateTime.now < self.expires_at
  end
  private
  def generate_token
  	begin
  		self.token = SecureRandom.hex
  	end while Token.where(token: self.token).any?#Donde campo token sea igual al token generado continua
  													#Any devuelve falso cuando tiene vacío
  	self.expires_at ||= 1.month.from_now
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appliances

  attachment :profile_image

  def self.search(search, appliance_or_user)
    if appliance_or_user == '2'
      User.where(['user_name LIKE?', "%#{search}%"])
    else
      User.all
    end
  end
end

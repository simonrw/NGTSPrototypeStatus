class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  if Rails.env == 'production'
      devise :database_authenticatable,
          :recoverable, :rememberable, :trackable, :validatable
  else
      devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  end
end

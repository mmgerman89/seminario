class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :commerces
  has_many :administrators
  has_many :branches, through: :administrator
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
           
  validates_confirmation_of :password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end

class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :commerces
  has_many :administrators
  has_many :branches, through: :administrator
  belongs_to :sex
  
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
           
  validates_confirmation_of :password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true
end

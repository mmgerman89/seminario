class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :commerces
  has_many :administrators
  has_many :branches, through: :administrator
  belongs_to :sex
  
  
  has_many :friendships
  has_many :friends, -> { where("status == 'accepted'")}, through: :friendships
  
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, -> { where("status == 'accepted'")}, through: :inverse_friendships, source: :user
  
  has_many :friendship_requests, class_name: "Friendship", foreign_key: "friend_id"
  has_many :requests, -> { where("status == 'pending'")}, through: :friendship_requests, source: :user
  
  has_many :sent_requests, class_name: "Friendship", foreign_key: "user_id"
  has_many :sents, -> { where("status == 'pending'")}, through: :sent_requests, source: :friend
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
           
  validates_confirmation_of :password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true
  
  before_save :set_profile_picture
  
  def name
    self[:first_name] + ' ' + self[:last_name]
  end
  
  private
  
  def set_profile_picture
    if self[:photo_url].empty?
      if self[:sex_id] == 1
        self[:photo_url] = "/img/signup_male.jpg"
      else
        self[:photo_url] = "/img/signup_female.png"
      end
    end
  end
end

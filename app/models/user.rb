class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate do
    errors.add(:base, "Must belong to a residence") unless residents.length > 0
  end
  validates :name, presence: true
  
  before_validation(:on => :create) do
    residents.build(household: Household.find(household_id), active: true)
  end
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :household_id
  
  has_many :residents
  
  attr_accessor :household_id # for during signup
end

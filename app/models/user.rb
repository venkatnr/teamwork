class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # association 
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :projects

  def is_admin?
  	(self.roles.first.name == "admin") ? true : false  
  end

  def self.get_all_developers
  	User.joins(:roles).where("roles.name != 'admin'")
  end
end

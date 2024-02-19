class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :tvs, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :liked_tvs, through: :likes, source: :tv
         def already_liked?(tv)
          self.likes.exists?(tv_id: tv.id)
        end
end

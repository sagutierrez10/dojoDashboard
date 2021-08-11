class Dojo < ActiveRecord::Base
    validates :branch, :street, :city, :satate, presence: true
    has_many :students, dependent: :destroy
    
end

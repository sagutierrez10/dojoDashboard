class Dojo < ActiveRecord::Base
    validates :branch, :street, :city, :satate, presence: true
end

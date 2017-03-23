class User < ApplicationRecord
validates_presence_of :first_name, :last_name, :age, :gender
validates_include_of :gender, in: ['Male', 'Female', 'Other']

has_one :address, dependent: :destroy

accepts_nested_attritubtes_for :address, reject_if: :all_blank

def full_name
  "#{first_name} #{last_name}"
end

def self.by_age
  order(:age)
end

end

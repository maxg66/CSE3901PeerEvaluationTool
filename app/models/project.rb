class Project < ApplicationRecord
    has_and_belongs_to_many :groups
    has_many :evaluations
    has_many :users, through: :evaluations
end

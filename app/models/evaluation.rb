class Evaluation < ApplicationRecord
    belongs_to :user
    belongs_to :project

    validates :student_evaluated, presence: true

    validates :content, presence: true

    validates :rating, presence: true, inclusion: { in: 1..10, message: "Rating is not within range 1-10"}
end

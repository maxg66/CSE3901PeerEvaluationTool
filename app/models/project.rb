class Project < ApplicationRecord
    has_and_belongs_to_many :groups
    has_many :evaluations
    has_many :users, through: :evaluations

    validates :p_name, presence: true, length: { maximum: 50 },
                uniqueness: {message: 'Group name already taken'}

    validates :project_type, presence: true


    #VALID_DATE_REGEX = /\A([1-9][0-9][0-9][0-9])-[1-9]|(1[0-2])-[1-9]|([1-2]\d)|(30)|(31)/
    #VALID_DATE_REGEX = /\A[1-9]\d{3}-((0[1-9])|[10-12])-((0[1-9])|([1-2]\d)|([30-31]))/
    validates :due_date, presence: true#, format: { with: VALID_DATE_REGEX }

    # def valid_date?
    #     unless Chronic.parse(from_date_before_type_cast)
    #         errors.add(from_date_before_type_cast, "Date is invalid")
    #     end
    # end
end

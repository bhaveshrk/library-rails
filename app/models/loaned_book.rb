class LoanedBook < ApplicationRecord
    validates :status, presence: true
    STATUSES = [:loaned, :returned]
    def self.search(search)
        if search
            where("title ILIKE :search OR name ILIKE :search", search: "%#{search}%")
        else
            all
        end
    end
end

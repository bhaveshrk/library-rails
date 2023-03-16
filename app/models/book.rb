class Book < ApplicationRecord
    belongs_to :author
    def self.search(search)
        if search
            where("title ILIKE :search OR name ILIKE :search", search: "%#{search}%")
        else
            all
        end
    end
end

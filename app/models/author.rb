class Author < ApplicationRecord
    has_many :books
    def self.search(search)
        if search
            where("name ILIKE :search", search: "%#{search}%")
        else
            all
        end
    end
end

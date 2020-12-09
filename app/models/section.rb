class Section < ApplicationRecord
    has_many :instruments

    def count_instruments
      instruments.count
    end
end

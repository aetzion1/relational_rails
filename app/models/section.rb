class Section < ApplicationRecord
    has_many :instruments

    def count_instruments
      instruments.count
    end

    def self.by_instruments
      Section.all.sort_by {|Section| -Section.instruments.count}
    end
end

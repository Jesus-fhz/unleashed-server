class Walk < ApplicationRecord
    enum status: [:pending, :accepted, :ongoing, :finished] # maybe cancelled
end

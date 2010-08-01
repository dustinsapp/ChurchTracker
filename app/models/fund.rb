class Fund < ActiveRecord::Base
  has_many :contributions
end

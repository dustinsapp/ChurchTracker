class Contribution < ActiveRecord::Base
  belongs_to :person
  belongs_to :household
  belongs_to :collection
  belongs_to :fund
  
  CHECK = 0
  CASH = 1
  CC = 2
  ACH = 3
  NONCASH = 4
  
  TYPE_TEXTS = {CHECK => 'Check', CASH => 'Cash', CC => 'Credit Card', ACH => 'ACH', NONCASH => 'Non-cash'}
  
  def type_text()
    TYPE_TEXTS[contribution_type]
  end
end

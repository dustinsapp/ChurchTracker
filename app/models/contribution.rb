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
  
  validates_presence_of :amount, :received_on, :contribution_type, :fund_id
  validates_presence_of :reference, :if => "contribution_type == Contribution::CHECK"
  validates_presence_of :memo, :if => "contribution_type == Contribution::NONCASH"

  def type_text()
    TYPE_TEXTS[contribution_type]
  end
  
  def person_name
    person.full_name if person
  end
end

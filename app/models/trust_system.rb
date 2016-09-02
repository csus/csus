class TrustSystem < ActiveRecord::Base
  belongs_to :trust
  belongs_to :system
end

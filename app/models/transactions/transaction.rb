class Transaction < ActiveRecord::Base
  has_and_belongs_to_many :capitals
  has_and_belongs_to_many :share_packages
end

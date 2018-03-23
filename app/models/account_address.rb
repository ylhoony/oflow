class AccountAddress < ApplicationRecord
  belongs_to :account
  belongs_to :country
  has_many :sale_orders
end

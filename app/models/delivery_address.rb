class DeliveryAddress < ApplicationRecord
belongs_to :user

def full_address
	postal_code+name_address+address
end
end

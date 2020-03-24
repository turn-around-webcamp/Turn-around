class DeliveryAddress < ApplicationRecord

	belongs_to :user

	def full_address
		postal_code+address+name_address
	end
end

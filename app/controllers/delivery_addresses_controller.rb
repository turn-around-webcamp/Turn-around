class DeliveryAddressesController < ApplicationController
   def new
   	  @delivery_addresses = Delivery_address.all
   end
end

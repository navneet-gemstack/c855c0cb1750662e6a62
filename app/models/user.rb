class User < ApplicationRecord
	  validates :email, presence: true
	  validates :email, uniqueness: true

	self.per_page = 3
	
	def self.type_match(str)
		search = "%#{str}%"
		User.where('firstName  Like ? or lastName Like ? or email Like ? ',search,search,search )
		.pluck(:firstName,:lastName).map{|obj| obj.join(" ")}
	end

end

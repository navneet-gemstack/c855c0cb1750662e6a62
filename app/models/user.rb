class User < ApplicationRecord
	  validates :email, presence: true
	  validates :email, uniqueness: true
	
	def self.type_match(str)
		search = "%#{str}%"
		User.where('firstName  Like ? or lastName Like ? or email Like ? ',search,search,search )
		.pluck(:firstName,:lastName).map{|obj| obj.join(" ")}
	end

end

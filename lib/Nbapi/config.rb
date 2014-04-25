module Nbapi
	class Config
		attr_accessor :access_token, :response_format, :user_agent

		def initialize
			set_defaults
		end

		private 
		def set_defaults
			@access_token 							||= "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"
			@response_format 						||= "json"
      @user_agent                 ||= "my_email@host.com"
		end
	end
end
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]

 #  def self.from_omniauth(auth)
	#   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	#     user.email = auth.info.email
	#     user.password = Devise.friendly_token[0,20]
	#   end
	# end

	def self.find_for_github_oauth(auth, signed_in_resource=nil)
    user = signed_in_resource || User.where(:provider => auth.provider, :uid => auth.uid).first
     unless user
		   user = User.create(
			   provider:auth.provider,
			   uid:auth.uid,
			   email:auth.info.email,
			   password:Devise.friendly_token[0,20]
		 )
			end
			user
		end
  end

	def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

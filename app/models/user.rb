class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]

	def self.find_for_github_oauth(auth, signed_in_resource=nil)
    user = signed_in_resource || User.where(:provider => auth.provider, :uid => auth.uid).first
     	unless user
     		if auth.info.email
          create_user_with_email
				else
					create_user_with_mock_email
				end
			end
		user
	end

  def create_user_with_email
    user = User.create(
    provider: 	auth.provider,
    uid: 			auth.uid,
    email: 		auth.info.email ,
    password: 	Devise.friendly_token[0,20]
    )
  end

  def create_user_with_mock_email
    user = User.create(
    provider: 	auth.provider,
    uid: 				auth.uid,
    email: 			(((1..15).map {("A".."Z").to_a.sample}.join) + "@github.com"),
    password: 	Devise.friendly_token[0,20]
    )
  end

	def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
      end
    end
  end

  def email_required?
  	false
  end
end

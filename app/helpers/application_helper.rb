module ApplicationHelper

def avatar_url(user)
gravatar_id = Digest::MD5::hexdigest(user.email).downcase
"httpd://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
	end
end

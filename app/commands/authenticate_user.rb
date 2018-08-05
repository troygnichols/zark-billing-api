class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    if user = find_user
      AuthenticateUser.response_content(user)
    else
      nil
    end
  end

  def AuthenticateUser.response_content(user)
    {
      token: create_token(user),
      profile: user.attributes.slice(
        'id', 'name', 'email', 'address', 'created_at', 'updated_at')
    }
  end

  def AuthenticateUser.create_token(user)
    JSONWebToken.encode(user_id: user.id)
  end

  private

  attr_accessor :email, :password

  def find_user
    user = User.find_by(email: email, active: true)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end

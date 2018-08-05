class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    if u = user
      {
        token: JSONWebToken.encode(user_id: u.id),
        profile: user.attributes.slice(
          'id', 'name', 'email', 'address', 'created_at', 'updated_at')
      }
    else
      nil
    end
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by(email: email, active: true)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end

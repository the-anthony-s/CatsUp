module ControllerSpecHelper
  def request_headers
    {
      'Content-Type' => 'application/json',
      'Accept' => 'json'
    }
  end

  def user_attributes(user)
    user.slice(:ids, :name, :email)
  end
end

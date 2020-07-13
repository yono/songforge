class User
  def self.authenticate(_username, _password)
    _username == username && _password == password
  end

  private

  def self.username
    ENV['BASIC_AUTH_USERNAME']
  end

  def self.password
    ENV['BASIC_AUTH_PASSWORD']
  end
end

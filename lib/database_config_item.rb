module Database
  ConfigItem = Struct.new(:name, :host, :username, :password, :port, :driver, :database, :ca_cert) do
    def to_hash
      Hash[*members.map(&:to_s).zip(values).flatten]
    end

    def connection_string
      "#{driver}://#{username}:#{password}@#{host}:#{port}/#{database}"
    end

    def empty?
      values.all?(&:nil?)
    end

    def initialize(settings=nil)
      super()
      settings ||= {}
      self.driver   = settings['driver']
      self.name     = settings['name']
      self.host     = settings['host']
      self.port     = settings['port']
      self.ca_cert  = settings['ca_cert']
      self.database = settings['database']
      self.password = settings['password']
      self.username = settings['username']
    end
  end
end

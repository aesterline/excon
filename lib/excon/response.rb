module Excon
  class Response

    attr_accessor :body, :headers, :status, :remote_ip

    def data
      {
        :body      => body,
        :headers   => headers,
        :status    => status,
        :remote_ip => remote_ip
      }
    end

    def params
      $stderr.puts("Excon::Response#params is deprecated use Excon::Response#data instead (#{caller.first})")
      data
    end

    def initialize(params={})
      @body      = params[:body]    || ''
      @headers   = params[:headers] || {}
      @status    = params[:status]
      @remote_ip = params[:remote_ip]
    end

    # Retrieve a specific header value. Header names are treated case-insensitively.
    #   @param [String] name Header name
    def get_header(name)
      headers.each do |key,value|
        if key.casecmp(name) == 0
          return value
        end
      end
      nil
    end

  end # class Response
end # module Excon

require 'base64'
require 'faraday'

module Diplomat
  class Health < Diplomat::RestClient

    # Get node health
    # @param n [String] the node
    # @return [OpenStruct] all data associated with the node
    def node n
      ret = @conn.get "/v1/health/node/#{n}"
      return JSON.parse(ret.body)
    end

    # Get service checks
    # @param s [String] the service
    # @return [OpenStruct] all data associated with the node
    def checks s
      ret = @conn.get "/v1/health/checks/#{s}"
      return JSON.parse(ret.body)
    end

    # Get service health
    # @param s [String] the service
    # @return [OpenStruct] all data associated with the node
    def service s
      ret = @conn.get "/v1/health/service/#{s}"
      return JSON.parse(ret.body)
    end

    # Get service health
    # @param s [String] the state ("unknown", "passing", "warning", or "critical")
    # @return [OpenStruct] all data associated with the node
    def state s
      ret = @conn.get "/v1/health/state/#{s}"
      return JSON.parse(ret.body)
    end

    # Convenience method to get services in unknown state
    def unknown
      state("unknown")
    end

    # Convenience method to get services in passing state
    def passing
      state("passing")
    end

    # Convenience method to get services in warning state
    def warning
      state("warning")
    end

    # Convenience method to get services in critical state
    def critical
      state("critical")
    end


    # @note This is sugar, see (#node)
    def self.node *args
      Diplomat::Health.new.node *args
    end

    # @note This is sugar, see (#checks)
    def self.checks *args
      Diplomat::Health.new.checks *args
    end

    # @note This is sugar, see (#service)
    def self.service *args
      Diplomat::Health.new.service *args
    end

    # @note This is sugar, see (#state)
    def self.state *args
      Diplomat::Health.new.state *args
    end

    # @note This is sugar, see (#unknown)
    def self.unknown
      Diplomat::Health.new.unknown
    end

    # @note This is sugar, see (#passing)
    def self.passing
      Diplomat::Health.new.passing
    end

    # @note This is sugar, see (#warning)
    def self.warning
      Diplomat::Health.new.warning
    end

    # @note This is sugar, see (#critical)
    def self.critical
      Diplomat::Health.new.critical
    end

  end
end

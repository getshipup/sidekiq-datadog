# frozen_string_literal: true

require 'sidekiq-datadog'
require 'timecop'

module StatsdHelper
  def self.included(rspec)
    rspec.before do
      ENV['RACK_ENV'] ||= 'test'

      @statsd_messages = []

      statsd = class_double(Datadog::Statsd)
      statsd_instance = Datadog::Statsd.new
      allow(statsd_instance).to receive(:send_stats) do |stat, delta, type, opts = EMPTY_OPTIONS|
        full_stat = statsd_instance.send(:serializer).to_stat(stat, delta, type, tags: opts[:tags])
        statsd_messages.push full_stat
      end

      allow(statsd).to receive(:new).and_return(statsd_instance)
      stub_const('Datadog::Statsd', statsd)
    end
  end

  attr_reader :statsd_messages
end

module Mock
  class Worker; end
end

RSpec.configure do |config|
  config.include StatsdHelper
end

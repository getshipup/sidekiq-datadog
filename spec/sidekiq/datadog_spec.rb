# frozen_string_literal: true

require 'spec_helper'
require 'sidekiq/datadog/version'

describe Sidekiq::Datadog do
  it 'has a version' do
    expect(described_class::VERSION).to be_instance_of(String)
  end
end

# frozen_string_literal: true

# Local override
dotenv = File.expand_path('.env_overrides.rb', __dir__)
require dotenv if File.exist?(dotenv)

ENV['JEMALLOC_ENABLED'] ||= 'true'
ENV['RAILS_MAX_THREADS'] ||= '3'
ENV['RUBY_YJIT_ENABLE'] = '1'
ENV['WEB_CONCURRENCY'] ||= '1'

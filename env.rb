# frozen_string_literal: true

# Local override
dotenv = File.expand_path('.env_overrides.rb', __dir__)
require dotenv if File.exist?(dotenv)

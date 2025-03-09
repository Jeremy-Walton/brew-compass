# frozen_string_literal: true

# All runtime asset dependencies should be bundled by Webpack during asset precompilation.
# Therefore, the node_modules directory can be removed after assets are compiled to significantly reduce slug size.
# In rare cases, you may have a runtime dependency into node_modules directly. If this is the case and you are unable
# to bundle the dependency, delete this file and the node_modules directory will be included in your production slug.

Rake::Task['assets:precompile'].enhance do
  if Rails.env.production?
    puts '----> Removing node_modules directory to reduce slug size.'
    FileUtils.rm_rf(Rails.root.join('node_modules'))
  end
end

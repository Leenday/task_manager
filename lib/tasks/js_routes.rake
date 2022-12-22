# frozen_string_literal: true

require 'js-routes'

ROUTES_DIR = File.join('app', 'javascript', 'routes')
namespace :js_routes do
  desc 'Generate js routes for webpack'
  task generate: :environment do
    FileUtils.mkdir_p(Rails.root.join(ROUTES_DIR))
    file_name = File.join('routes', 'ApiRoutes.js')
    JsRoutes.generate!(file_name, camel_case: true)
  end
end

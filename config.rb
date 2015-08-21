require "dotenv"
require "slim"

Dotenv.load

# Contentful configuration
activate :contentful do |f|
  f.access_token  = ENV['CONTENTFUL_ACCESS_TOKEN']
  f.space         = { site: ENV['CONTENTFUL_SPACE'] }
  f.content_types = { 
    cocktails: ENV['CONTENTFUL_COCKTAILS_ID'],
    cocktail: ENV['CONTENTFUL_COCKTAIL_ID']
  }
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

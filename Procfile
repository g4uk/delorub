# Run Rails without hot reloading (static assets).
rails: REACT_ON_RAILS_ENV= rails s -b 0.0.0.0

# Build client assets, watching for changes.
rails-client-assets: rm -rf app/assets/webpack/* || true && npm run build:dev:client

# Build server assets, watching for changes. Remove if not server rendering.
rails-server-assets: npm run build:dev:server

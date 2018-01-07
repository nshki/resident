Community.find_or_create_by(name: ENV.fetch('DEFAULT_COMMUNITY') || 'Default Community')

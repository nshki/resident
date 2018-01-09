Community.find_or_create_by(
  name: ENV.fetch('DEFAULT_COMMUNITY') || 'Default Community',
)

Invite.find_or_create_by(
  code: 'secretinvitecode',
)

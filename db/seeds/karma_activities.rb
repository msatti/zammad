# Copyright (C) 2012-2021 Zammad Foundation, http://zammad-foundation.org/

Karma::Activity.create_or_update(
  name:        'ticket create',
  description: __('You have created a ticket'),
  score:       10,
  once_ttl:    60,
)
Karma::Activity.create_or_update(
  name:        'ticket close',
  description: __('You have closed a ticket'),
  score:       5,
  once_ttl:    60,
)
Karma::Activity.create_or_update(
  name:        'ticket answer 1h',
  description: __('You have answered a ticket within 1h'),
  score:       25,
  once_ttl:    60,
)
Karma::Activity.create_or_update(
  name:        'ticket answer 2h',
  description: __('You have answered a ticket within 2h'),
  score:       20,
  once_ttl:    60,
)
Karma::Activity.create_or_update(
  name:        'ticket answer 12h',
  description: __('You have answered a ticket within 12h'),
  score:       10,
  once_ttl:    60,
)
Karma::Activity.create_or_update(
  name:        'ticket answer 24h',
  description: __('You have answered a ticket within 24h'),
  score:       5,
  once_ttl:    60,
)
Karma::Activity.create_or_update(
  name:        'ticket pending state',
  description: __('Usage of advanced features'),
  score:       2,
  once_ttl:    60,
)
Karma::Activity.create_or_update(
  name:        'ticket escalated',
  description: __('You have escalated tickets'),
  score:       -5,
  once_ttl:    60 * 60 * 24,
)
Karma::Activity.create_or_update(
  name:        'ticket reminder overdue (+2 days)',
  description: __('You have tickets that are over 2 days overdue'),
  score:       -5,
  once_ttl:    60 * 60 * 24,
)
Karma::Activity.create_or_update(
  name:        'text module',
  description: __('Usage of advanced features'),
  score:       4,
  once_ttl:    60 * 30,
)
Karma::Activity.create_or_update(
  name:        'tagging',
  description: __('Usage of advanced features'),
  score:       4,
  once_ttl:    60 * 60 * 4,
)

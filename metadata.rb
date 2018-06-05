name 'ab_delights'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures ab_delights'
long_description 'Installs/Configures ab_delights'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)

depends "git"
depends 'mysql', '~> 8.0'
depends "ssh_known_hosts"
depends "application_ruby"
depends "database"
depends "poise-git"
depends "poise-ruby"
depends "passenger_apache2"

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/ab_delights/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/ab_delights'

name             'cadvisor'
maintainer       'yvelasqu'
maintainer_email 'yanara.velasquez@latam.com'
license          'All rights reserved'
description      'Installs/Configures cadvisor'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.10'

if respond_to?(:source_url)
  source_url 'https://github.com/yvelasqu/chef-cadvisor'
end

if respond_to?(:issues_url)
  issues_url 'https://github.com/yvelasqu/chef-cadvisor'
end

depends 'docker'

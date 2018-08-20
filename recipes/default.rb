#
# Cookbook Name:: cadvisor
# Recipe:: default
#

cadvisor = node['cadvisor']

docker_image cadvisor[:image] do
  tag cadvisor[:version]
  action :pull_if_missing
end

docker_container cadvisor['image'] do
  container_name 'cadvisor'
  repo cadvisor['image']
  tag cadvisor[:version]
  log_opts 'max-size=50m'
  restart_policy 'always'
  port "#{cadvisor[:listen_ip]}:#{cadvisor[:listen_port]}:8080"
  binds [
    '/:/rootfs:ro',
    '/var/run:/var/run:rw',
    '/sys:/sys:ro',
    '/var/lib/docker/:/var/lib/docker:ro',
    '/cgroup:/cgroup:ro'
  ]
  container_name cadvisor[:container]
  detach true
  privileged true
  action :run_if_missing
end

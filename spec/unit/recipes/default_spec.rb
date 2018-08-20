require 'spec_helper'

describe 'cadvisor::default' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '7.3.1611'
    ).converge(described_recipe)
  end

  it 'downloads the cadvisor image' do
    expect(chef_run).to pull_if_missing_docker_image('registry.it.lan.com/latam/cadvisor').with(
      tag: 'latest'
    )
  end

  it 'runs the cadvisor container' do
    expect(chef_run).to run_if_missing_docker_container('registry.it.lan.com/latam/cadvisor').with(
      tag: 'latest',
      port: '127.0.0.1:8080:8080',
      container_name: 'cadvisor',
      detach: true,
      privileged: true
    )
  end
end

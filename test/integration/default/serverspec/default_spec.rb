require 'spec_helper'

describe 'ntp' do
  it 'has a running service of ntp' do
    expect(service('ntp')).to be_running
  end
end

describe 'samba' do
  it 'has a running service of nmbd' do
    expect(service('nmbd')).to be_running
  end

  it 'has a running service of smbd' do
    expect(service('smbd')).to be_running
  end
end

describe 'sssd' do
  it 'has a running service of sssd' do
    expect(service('sssd')).to be_running
  end
end

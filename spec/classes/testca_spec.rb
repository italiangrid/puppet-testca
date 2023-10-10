require 'spec_helper'

describe 'testca' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it 'check repo file' do
        repo_file='/etc/yum.repos.d/test-ca.repo'
        is_expected.to contain_file('test-ca.repo').with(
          :ensure => 'file',
          :path => repo_file,
        )
      end
      it 'check igi-test-ca' do
        is_expected.to contain_package('igi-test-ca')
      end
      it 'check igi-test-ca-2' do
        is_expected.to contain_package('igi-test-ca-2')
      end
      it 'check igi-test-ca-256' do
        is_expected.to contain_package('igi-test-ca-256')
      end
    end
  end
end

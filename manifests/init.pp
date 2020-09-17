# @summary Install IGI test CA.
#
# @example
#   include testca
class testca {

  file { 'test-ca.repo':
    ensure => file,
    path   => '/etc/yum.repos.d/test-ca.repo',
    source => 'puppet:///modules/testca/test-ca.repo',
    mode   => '0644',
  }

  package {
    'igi-test-ca':
      ensure  => latest,
      require => File['test-ca.repo'],;

    'igi-test-ca-2':
      ensure  => latest,
      require => File['test-ca.repo'],;

    'igi-test-ca-256':
      ensure  => latest,
      require => File['test-ca.repo'],;
  }
}

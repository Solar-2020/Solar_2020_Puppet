class users {
  users::sshuser { 'test':
    authorized_keys => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD0d3F4uDytA8JcA94/XekLLvql0a4SI6yLD4rdUNFmOMAibZLJPCazD3+EmtREbxZxA3g0uC+tgrSifPWvPXfL4jCUZyMeFyoSxZ3EdoajNSsl5kWZQ5DY0lswKWpr+piu9AnDbDyiB/yTz6E0wcDqDLscPiGBg/J8tFNk4nyio5utQXd8/h8oSBARWQTX6wTIiZX6Xne4v2tPCwWJ5P4+egKv7/hXiTfWgfU9n6ZM3QcdjNj9xedSubaiypSx/37sg1x3fFiPXL8ICxwHdO4RljkTPx9nOirh0JpF6AtA6+4OsiV1DzyEE3IQlAIbevwdfht4hHSfzPwFz7qIpETBh1wsEYvl78FXtYlntRG6DIEjrvnEcpiypmvalyBVuUPRdcKoCT7uWxjGpgjKdAxm9I/2Dt1EbW/F7zTA3VpN27PBLHAYWngApFNo3kKZ4B4reeJ54xuqr2pibHETBlPH9e5QboQGSIj7xkbbZAzDp7rs2Wuh5QwoOU2osnqhqbyJSaNNdS1FtbSEDpKI/uCQd9anOtp+xcih7qSv9X/pWc8YVAkDCgs2WTdhuXUtwBFpnLvKdIM3+Q+jECHONdreE2hAKAh15yUQ2Ihbqhd/ccMjKXnwqXLP/HBTVCULK26Vh3/wiK64SSEU9Hb5Jx4M1+a0jZVsP3pqL1vFp/OehQ==',
    ],
    groups          => 'wheel',
  }
  class { 'sudo': }
  sudo::conf { 'test':
    content  => 'test ALL=(ALL) NOPASSWD: ALL',
  }
}

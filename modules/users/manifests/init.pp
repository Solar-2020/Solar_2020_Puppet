class users {
  class { 'sudo': }

  group { 'www':
    ensure  => present,
    members => ['deploy', 'nginx'],
  }

  users::sshuser { 'deploy':
    authorized_keys => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCqjeyuZolR/rLvWb7wYabAZr3+vyr38nhfEjVyDhNfEFGMD7LOQ6fWqXQeprRBbfZODL8CB3fpyyxQQZa9xp3bkwF9b8+t2zYo+WkNyWoUK9128H8UjeWAY8OTKloe61dAVXpv4fp38qzGPXdVirOLMP4wFbv4nnrbJxHS3MXd8BUt3FESdkj4zknj7e3SAduLfpoj57aoRDPHYEyFk4NZqKyWxlCNCQR5bYovQk4ulJFLsEnb4TWrS/B9Rk+mCjvP4E3dSQPYrq13uLymFfefR72tuxaJtLMM0x17J1poyl+TdT/yN+4+gMNj3z6jqFyzXbzv3FKjhXXCFizZvyN+NTKqhsPEFLpADow/KSgIAO6C0r9brqcSW29flUnGZv1gN3vwJkQaW6Qm1yXHbBoDdNbs8gW9BZGVLWK1zq2+5OTmQGdilw/YBG1qENBJjNLViqCS5G2FxbsUsXvXiE+c9s71A8ituR41/ZBEu8PH1D7nIOFmjAkaUdOqnQnN2d22b0qo98RtOTj7ZleYCVO4wCq0jjS3sFJpeS6C3qAD7D5qIa9zbotnJWSAFF0FJiftYLdN0f36rmGyBUlV++Bu69Lf7JBtpMbFwRPQGXE+DDJezDi64ydvQYZzUzwbrjvMdPlqUQHqZ+zk02ZqiDI5z47ko/6sOyE6GaCdXRIGpw==',
    ],
    groups          => 'wheel',
    require         => Group['www'],
  }
  -> sudo::conf { 'deploy':
    content  => 'deploy ALL=(ALL) NOPASSWD: ALL',
  }

  users::sshuser { 'a.kochnov':
    authorized_keys => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD0d3F4uDytA8JcA94/XekLLvql0a4SI6yLD4rdUNFmOMAibZLJPCazD3+EmtREbxZxA3g0uC+tgrSifPWvPXfL4jCUZyMeFyoSxZ3EdoajNSsl5kWZQ5DY0lswKWpr+piu9AnDbDyiB/yTz6E0wcDqDLscPiGBg/J8tFNk4nyio5utQXd8/h8oSBARWQTX6wTIiZX6Xne4v2tPCwWJ5P4+egKv7/hXiTfWgfU9n6ZM3QcdjNj9xedSubaiypSx/37sg1x3fFiPXL8ICxwHdO4RljkTPx9nOirh0JpF6AtA6+4OsiV1DzyEE3IQlAIbevwdfht4hHSfzPwFz7qIpETBh1wsEYvl78FXtYlntRG6DIEjrvnEcpiypmvalyBVuUPRdcKoCT7uWxjGpgjKdAxm9I/2Dt1EbW/F7zTA3VpN27PBLHAYWngApFNo3kKZ4B4reeJ54xuqr2pibHETBlPH9e5QboQGSIj7xkbbZAzDp7rs2Wuh5QwoOU2osnqhqbyJSaNNdS1FtbSEDpKI/uCQd9anOtp+xcih7qSv9X/pWc8YVAkDCgs2WTdhuXUtwBFpnLvKdIM3+Q+jECHONdreE2hAKAh15yUQ2Ihbqhd/ccMjKXnwqXLP/HBTVCULK26Vh3/wiK64SSEU9Hb5Jx4M1+a0jZVsP3pqL1vFp/OehQ==',
    ],
    groups          => 'wheel',
  }
  -> sudo::conf { 'a.kochnov':
    content  => 'a.kochnov ALL=(ALL) NOPASSWD: ALL',
  }

  users::sshuser { 'solara':
    authorized_keys => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD0d3F4uDytA8JcA94/XekLLvql0a4SI6yLD4rdUNFmOMAibZLJPCazD3+EmtREbxZxA3g0uC+tgrSifPWvPXfL4jCUZyMeFyoSxZ3EdoajNSsl5kWZQ5DY0lswKWpr+piu9AnDbDyiB/yTz6E0wcDqDLscPiGBg/J8tFNk4nyio5utQXd8/h8oSBARWQTX6wTIiZX6Xne4v2tPCwWJ5P4+egKv7/hXiTfWgfU9n6ZM3QcdjNj9xedSubaiypSx/37sg1x3fFiPXL8ICxwHdO4RljkTPx9nOirh0JpF6AtA6+4OsiV1DzyEE3IQlAIbevwdfht4hHSfzPwFz7qIpETBh1wsEYvl78FXtYlntRG6DIEjrvnEcpiypmvalyBVuUPRdcKoCT7uWxjGpgjKdAxm9I/2Dt1EbW/F7zTA3VpN27PBLHAYWngApFNo3kKZ4B4reeJ54xuqr2pibHETBlPH9e5QboQGSIj7xkbbZAzDp7rs2Wuh5QwoOU2osnqhqbyJSaNNdS1FtbSEDpKI/uCQd9anOtp+xcih7qSv9X/pWc8YVAkDCgs2WTdhuXUtwBFpnLvKdIM3+Q+jECHONdreE2hAKAh15yUQ2Ihbqhd/ccMjKXnwqXLP/HBTVCULK26Vh3/wiK64SSEU9Hb5Jx4M1+a0jZVsP3pqL1vFp/OehQ==',
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9nUUi+k8gbxQ6O65C6ni/bHvf6l2YLKU7nSgXFIbtxJPnz14LCVnzV3jvDFfxzW9BZEY1oREC+gi4W1vG67jLBswhAFJYp226Nqdjoe38wN8Uar4MhnXIyKIoo0nCOFnGo/V8nt8lz+DYlfo69aRX3agr6czVdWfBa+2ikmTeRkegubWZjUv3QbaIxkG1/sVc8W9v8FF2DHWVQ/LJOU1USbm41kotfHQ0Dgzm1SweIoktyBLhCCbs6o4NbfVbViqUtDLIjTHiq9iIL4xJllAkTxWb9oA8RfI8o3dRuDyjHFP0DPUWQNZtm48m4es1+3sU3uBOkhLPUkxEZQpA+QjD',
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDUIktRFcWms8RBczAI+ZKcJ3AvFfSyaHzuOeN82BmqtODR6fFNaF7wuKWWxMBI2pg2d1roolqdjqTwTDZxYuYCyutQtJNZaNE1uuPBWhdNAnfBfQjac13MQmScepM/+UDbZh7U0oOUHcYJweoXP0evEwruwYtdX9CXk9iZwSKKP369J6/L4gztRHN00UpKfDSR2qxTZIdRZVFdSzZqJcU/DxVbQo68iMc52yEgJhI0Emdc4a38dmR3B+ZJ1Vmoacgtz1rKAchXOXBAYhq67Nj/NLdEIX/vUMmJG90ZULfq+hEn+2uwokztAw3Pq6WuN+7pI8yBFRg9w2r763kuEIYOmkOwvGBW2HdvXAdQbyVWZUL1wTPWKf/tZBGTU2M0zVFSkyLvQS+S5g3ibJz+XMl8sYklUZC/YTs5Gr+lLHVngPRN+a8KYIGKQlcl35Fab0eiqR7GnVt8+Ro4YsWu3zTQs6sPNKlzbKtoA3uAlA0L4xvSfD/q1BgmwV6u3JJoXNU=',
    ],
    groups          => 'wheel',
  }
  -> sudo::conf { 'solara':
    content  => 'solara ALL=(ALL) NOPASSWD: ALL',
  }

}

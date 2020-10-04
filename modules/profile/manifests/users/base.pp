class profile::users::base {
  profile::users::sshuser { 'test':
    authorized_keys => [
      'fwfewfwefwefwef',
      'fuckfuckfuck',
    ]
  }
}

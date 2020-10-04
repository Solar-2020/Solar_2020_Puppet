class users {
  users::sshuser { 'test':
    authorized_keys => [
      'fwfewfwefwefwef',
      'fuckfuckfuck',
    ]
  }
}

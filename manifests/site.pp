node default {
  include nginx
  include profile::gopod::base
  include profile::myfirewall::rules
  include users
}

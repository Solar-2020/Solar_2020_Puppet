node default {
  include nginx
  include profile::gopod::base
  include profile::myfirewall::rules
  include profile::users::base
}

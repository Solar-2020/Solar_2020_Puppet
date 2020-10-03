node default {
  include nginx
  include gobackend
  include profile::myfirewall::rules
}

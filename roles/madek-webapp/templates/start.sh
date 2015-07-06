#!/bin/bash
source /etc/profile.d/rbenv-load.sh \
&& cd {{madek_webapp_dir}} \
&& rbenv-load \
&& rbenv shell {{rubies.jruby.version}} \
&& export JVM_OPTS="-Xmx{{madek_webapp_xmx_value}}" \
&& export RAILS_ENV={{rails_env}}  \
&& export RAILS_RELATIVE_URL_ROOT="/" \
&& bundle exec puma config.ru -t 4:40 -b tcp://127.0.0.1:8880 \
  >> {{madek_webapp_log_dir}}/{{madek_webapp_service_name}}.log 2>&1

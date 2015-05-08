
alias env_website_django 'source ~/.virtualenvs/website_django_env/bin/activate'
alias db_tunnel 'ssh -fNg -p2022 -L 3333:vm1:3306 ericbloch@infra1.udemy.com'
alias db_tunnel_kill 'kill `sudo lsof -t -i:3333`'
alias db_tunnel4 'ssh -fNg -p2022 -L 3334:localhost:3306 ericbloch@infra1.udemy.com'
alias db_tunnel4_kill 'kill `sudo lsof -t -i:3334`'
alias udemy_test_unit './manage.py test --settings udemy.settings.test_unit --processes 8'
alias udemy_test_integration './manage.py test --settings udemy.settings.test_integration --processes 8'
alias udemy_test_cover './manage.py test --settings udemy.settings.test_coverage'
alias udemy_shell_plus './manage.py shell_plus --settings udemy.settings.local'
alias udemy_runserver './manage.py runserver 8000'
alias udemy_killserver 'kill `sudo lsof -t -i:8000`'
alias elastic_tunnel 'ssh -fNg -p2022 -L 9200:10.1.0.104:9200 murataydos@infra1.udemy.com'
alias elastic_tunnel_kill 'kill `sudo lsof -t -i:9200`'

setenv DJANGO_SETTINGS_MODULE udemy.settings.local

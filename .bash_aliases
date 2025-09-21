# Dev environment
alias dcdev='docker compose -f docker-compose.yml -f docker-compose.dev.yml --compatibility -p deploydev'
alias dcrestartdev='dcdev stop $@ && dcdev rm -f -v $@ && dcdev up --build -d $@'
alias dclogsdev='dcdev logs --tail=100 --follow $@'
alias devshell_api='docker exec -ti deploydev_api_1 /bin/bash'
alias devshell_website='docker exec -ti deploydev_website_1 /bin/bash'


# Prod environment
alias dcprod='docker compose -f docker-compose.prod.yml --compatibility -p deployprod'
alias dcrestartprod='dcprod stop $@ && dcprod rm -f -v $@ && dcprod up --build -d $@'
alias dclogsprod='dcprod logs --tail=100 --follow $@'
alias prodshell_api='docker exec -ti deployprod_api_1 /bin/bash'
alias prodshell_website='docker exec -ti deployprod_website_1 /bin/bash'
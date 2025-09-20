alias dc='docker compose -f docker-compose.yml -f docker-compose.dev.yml --compatibility'
alias dshell='docker exec -ti deploy-ecommerce_api_1 /bin/bash'
dclogs(){
        dc logs --tail=100 --follow $@
}
dcrestart(){
        dc stop $@
        dc rm -f -v $@
        dc up --build -d $@
}
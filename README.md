# API backend
## start api backend app
`cd backend`  
`bundle` # install dependencies  
`rackup config.ru` # start server  
`curl http://127.0.0.1:9292/api/v1/news` # test the /stats endpoint  

## linting
`bundle exec rubocop --lint`

## tests
`rspec`
# =====================

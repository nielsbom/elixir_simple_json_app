# Elixir: simple JSON app

## Running the app locally

- `git clone git@github.com:nielsbom/elixir_simple_json_app.git`
- `cd elixir_simple_json`
- `mix deps.get`
- `mix release --overwrite` to create a dev release
- `PORT=4000 _build/dev/rel/simple_json_app/bin/simple_json_app start` to run the app
- go to [http://localhost:4000/foo?a=1&b=2](http://localhost:4000/foo?a=1&b=2) to view the app locally

## Using the template for another project

- remove the `.git` directory
- `git init`
- rename the files and folders, for example: `simple_json_app.ex` to `your_choice.ex`
- rename the application name: `:simple_json_app` to `:your_choice` in a bunch of files
- rename the module names: `SimpleJsonApp` to `YourChoice`
- rename the Dockerfile entrypoint
- rename the `.gitignore` tar entry
- `git commit -am "Initial commit for Your Choice"`

## Deploying to Heroku

- in the [Heroku dashboard](https://dashboard.heroku.com/new-app) make a new app
- give your app a name in Heroku: "qux"
- use the Heroku Container Registry to deploy with a Docker container
- now we use the Heroku CLI
- make sure you're logged in
- `heroku container:push web -a qux` (takes a couple of minutes)
- `heroku container:release web -a qux`
- to view the logs: `heroku logs --tail -a qux`
- now visit your app at [https://qux.herokuapp.com/foo?a=1&b=2](https://qux.herokuapp.com/foo?a=1&b=2)
- your logs should show the visit

## Sources

I used code from [this blogpost](https://medium.com/@qhwa_85848/build-docker-images-from-an-elixir-project-why-and-how-78e19468210).

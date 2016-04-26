## What you will need:

- An editorconfig plugin for your editor, so that your source file formatting follows basic conventions. See `.editorconfig` and [editorconfig.org](editorconfig.org) for more info.
- [docker](https://www.docker.com) installed on your system.
- `direnv` installed on your system, see [direnv.net](http://direnv.net)
- An `.envrc` file in the root directory of the app.
- Run `direnv allow`, to source the `.envrc` file
- A database dump (until we have seed data)
- To build the `docker-compose.yml` you will need to the two environment files: `.mge_rails.env` and `.secrets.env`
  - Please ask the maintainer for an example file

Once you have all of the above:

- Make sure you have a docker instance running, i.e.: `docker-machine start dev`. Please refer to the docker manual for more info.

- Inside the project root, build the containers: `docker-compose build` and then `docker-compose up`, will build and start the containers defined in `docker-compose.yml`
- Find the IP of your db container. I.e. `docker-machine ip dev`.
- Feed the db dump into your db container: `mysql -u root -proot -h $MYSQL_TCP_ADDR mge_development < dump.sql`
- Make sure you have [rbenv](https://github.com/rbenv/rbenv) installed on your system.
- Install the projects ruby version via `rbenv install "$(cat .ruby-version)"`
- Run `bundle install` to install all relevant gems on your system.
  - If you run into problems with `v8` on OSX, please see `./lib/scripts/installv8.sh` and `./lib/scripts/nuke.sh`. Use at your own risk!
- Run the rails server `rails s`

## How to contribute:

- Development happens on the **develop** branch
- If you want to get your changes merged in, please send a pull-request to the **develop** branch

### Before creating a pull-request
- Run `bundle exec rubocop -a` to make sure your code adheres to our style guide.
- Push your branch with your changes to your own repo, and create your pull-request


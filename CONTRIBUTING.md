## What you will need:

- docker installed on your system.
- `direnv` installed on your system, see http://direnv.net
- An `.envrc` file in the root directory of the app.
- Run `direnv allow`, to source the `.envrc` file
- A database dump (until we have seed data)
- To build the `docker-compose.yml` you will need to the two environment files: `.mge_rails.env` and `.secrets.env`
  - Please ask the maintainer for an example file
- An editorconfig plugin for your editor, so that your source file formatting follows basic conventions. See `.editorconfig` and [editorconfig.org](editorconfig.org) for more info.

## How to contribute:

- Development happens on the **develop** branch
- If you want to get your changes merged in, please send a pull-request to the **develop** branch

### Before creating a pull-request
- Run `bundle exec rubocop -a` to make sure your code adheres to our style guide.
- Push your branch with your changes to your own repo, and create your pull-request


# BitGist

A gist clone in Ruby on Rails.

## Development

Before getting started, you will need the following dependencies on your system:

- Ruby 2.7
- PostgreSQL
- Node >= 14.9

You will also need to confiugure Github Oauth credentials used for authentications. You can add these to Rails encrypted credentials
such that they look like these:

```bash
$> rails credentials:show
secret_key_base: <omitted>

github:
  client_id: <omitted>
  client_secret: <omitted>
```

Now you should be able to run `bin/setup` to, well, setup everything. In short, this install packages, and creates and migrates the database. Optionally, you can run `bin/rails db:seed` to populate some gists.

This project contains a Procfile that specifies the processes that need to run. There a Procfile-based task manager like [Overmind](https://github.com/DarthSim/overmind) is recommended to boot up the application.

To start the development server (with Overmind), run the following command:

```
overmind start
```

You now should be able to access the application from your browser at http://localhost:3000.

## Features

- Multi-file Gists
- Private and public gists
- Syntax Highlighting
- Gist Search based on description
- Github Oauth authentication


## Ideas

These are some ideas for possible features:

- User Following
- Notifications

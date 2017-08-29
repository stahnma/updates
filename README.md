# libautoupdate server

This is a scaffold for having an update mechanism which conforms the [libauatoupdate](https://github.com/pmq20/libautoupdate) protocol.


# Running
## Set environment variables

1. Install sinatra in some way that `app.rb` can load it.
1. Set the proper configuration environment variables

`RUNTIME_HOSTNAME` - the server name that the web server should hit. (e.g. `updates.puppet.com`).

`CURRENT_PROJECT_VERSION` - the latest version of the project, which is what you instruct clients to checking in. (e.g. `0.0.10`)

`PROJECT_NAME` - the name of the project you're testing. (e.g. `bolt`)

1. Place your payload in `public/#{project}/#{platform}/#{project}-#{version}.gz`
1. Run as root, because it binds at port 80 :(


# License
WTFPL

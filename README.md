# Erlang on Alpine Linux

This is based on [pentacent/alpine-erlang-base](https://hub.docker.com/r/bitwalker/alpine-elixir) with additional libraries specifically 
for building erlang libraries with native C bindings and aws cli installed.

## Usage

NOTE: This image sets up a `default` user, with home set to `/opt/app` and owned by that user. The working directory
is also set to `$HOME`. It is highly recommended that you add a `USER default` instruction to the end of your
Dockerfile so that your app runs in a non-elevated context.

To boot straight to a prompt in the image:

```
$ docker run --rm -it --user=root marksargento/alpine-erlang erl
Erlang/OTP 21 [erts-10.1.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe]

Eshell V10.1.1  (abort with ^G)
1>
```

Extending for your own application:

```dockerfile
FROM marksargento/alpine-erlang:latest

USER default

CMD ./bin/yourapp foreground
```

## License

MIT

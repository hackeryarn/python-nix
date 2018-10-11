# python-nix

This project is a starter for a simple `Flask` application with `posgresql` ready to go.

## Requirements

Install nix: 

```bash
$ curl https://nixos.org/nix/install | sh
```

## Start project

Start a `nix-shell` - it will manage all your dependencies including `postgres`:

```bash
$ nix-shell
```

Run migrations:

```bash
$ flask db migrate
```

Start the project:

```bash
$ flask run
```

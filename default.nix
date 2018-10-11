with import <nixpkgs> {};

let
  dbName = "wordcoutn_dev";
  config = "Development";
in
stdenv.mkDerivation {
  name = "flask_nix";

  buildInputs = [
    python
    pipenv
    postgresql
  ];

  shellHook = ''
    export PGDATA=~/tmp/pgdata
    export DATABASE_URL="postgresql://localhost/${dbName}"
    export APP_SETTINGS="config.${config}Config"

    pg_ctl start

    pipenv install
    pipenv shell
  '';
}

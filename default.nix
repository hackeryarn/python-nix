with import <nixpkgs> {};

let
  dbName = "wordcount_dev";
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
    export PGDATA="$PWD/tmp/pgdata"
    export DATABASE_URL="postgresql://localhost/${dbName}"
    export APP_SETTINGS="config.${config}Config"

    if [ ! -d $PGDATA ]; then
       initdb
       pg_ctl -w start
       createdb ${dbName}
    fi

    pipenv install
    pipenv shell
  '';
}

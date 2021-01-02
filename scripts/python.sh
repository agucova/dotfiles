#!/usr/bin/env bash
# Install Poetry
if test ! -f "$HOME/.poetry/bin/poetry"; then
    echo "Installing: poetry..."
    TEMP_PY="$(mktemp --suffix ".py")" &&
    wget -q -O "$TEMP_PY" 'https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py' > /dev/null && # Possible outdated, but repo is added automatically
    python3 "$TEMP_PY" -y > /dev/null
    rm -f "$TEMP_PY" > /dev/null
    mkdir -p $HOME/.config/fish/completions
    $HOME/.poetry/bin/poetry completions fish > "${HOME}"/.config/fish/completions/poetry.fish
else
    echo "Already installed: poetry"
fi

# Use PIP
function pinstall {
  if python3 -c "import sys, pkgutil; sys.exit(0 if pkgutil.find_loader(sys.argv[1]) else 1)" "$1"; then
    echo "Already installed: ${1}"
  else
    echo "Installing: ${1}..."
    sudo pip3 -q install $1 > /dev/null
  fi
}

pinstall django
pinstall flask
pinstall sqlalchemy
pinstall flask-sqlalchemy
pinstall typing
pinstall numpy
pinstall pandas
pinstall fastapi
pinstall pydantic
pinstall prettyprint
pinstall flake8
pinstall black
#!/bin/bash

if [ ! -d ".venv" ]; then
    python -m venv .venv
fi

source .venv/bin/activate

pip install sssimp

python -m sssimp

(
    cd output

    echo Laffey
    rsync -auP laffey tina.moe:wwws/
    rsync -auP six tina.moe:wwws/

    echo Turbo
    rsync -auP turbo turbo.tina.moe:wwws/

    echo Nagato
    rsync -auP nagato nagato.lan:wwws/
    ssh -t nagato.lan sudo rsync -auP wwws/ /srv/www/
)

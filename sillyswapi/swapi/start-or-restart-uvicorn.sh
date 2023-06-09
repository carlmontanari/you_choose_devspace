#!/bin/bash

uvicornPid=$(ps aux | grep '[u]vicorn swapi' | awk '{print $2}')

if [ -z $uvicornPid ];
then
  echo "no uvicorn process running..."
else
  echo "killing previous uvicorn process..."
  kill $uvicornPid
fi

echo "launching new uvicorn process..."
nohup uvicorn swapi.main:app --host 0.0.0.0 --port 80 &> /dev/null &

echo "done!"

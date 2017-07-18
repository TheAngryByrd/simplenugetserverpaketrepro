#!/usr/bin/env bash

mono .paket/paket.bootstrapper.exe

dotnet restore ./src/mycoollib
# dotnet build ./src/mycoollib
dotnet pack -o $(pwd)/dist ./src/mycoollib /p:PackageVersion=0.1.0

mono .paket/paket.exe push --url http://$(docker-machine ip default):5000 --endpoint / --api-key SECRETNUGETKEY dist/*.nupkg 


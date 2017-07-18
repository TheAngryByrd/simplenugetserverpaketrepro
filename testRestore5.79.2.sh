#!/usr/bin/env bash


mono .paket/paket.bootstrapper.exe 5.79.2

mono .paket/paket.exe clear-cache
rm -rf packages/

mono .paket/paket.exe restore
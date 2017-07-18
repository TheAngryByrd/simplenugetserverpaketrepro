#!/usr/bin/env bash


mono .paket/paket.bootstrapper.exe 5.1.6

mono .paket/paket.exe clear-cache
rm -rf packages/

mono .paket/paket.exe restore
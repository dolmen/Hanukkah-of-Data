#!/bin/sh

sqlite3 ../Data/noahs.sqlite < $(basename "$0" .sh).sql

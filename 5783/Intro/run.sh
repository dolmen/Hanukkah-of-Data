#!/usr/bin/env bash

for y in $(seq 5783 5683)
do
	if unzip -P $y ../Data/noahs-sqlite.zip; then
		echo "Password is: $y"
		break
	fi
done

#!/bin/bash
mkdir -p results
rm -rf results/*

for file in ./gpx/*.gpx
do
    filename=$(basename "$file" | cut -d '.' -f 1)
    ogr2ogr -f GeoJSON -lco COORDINATE_PRECISION=5 "results/$filename.geojson" "$file" tracks
done

ogrmerge.py -o offroad_galicia.geojson results/*.geojson -f GeoJSON -single -overwrite_ds

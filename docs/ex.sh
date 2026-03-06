idgeo@GS9:/mnt/d/idgeo/cp20252027$ touch script.sh

idgeo@GS9:/mnt/d/idgeo/cp20252027$ nano script.sh


idgeo@GS9:/mnt/d/idgeo/cp20252027$ mkdir script

idgeo@GS9:/mnt/d/idgeo/cp20252027$ mv script.sh script/


idgeo@GS9:/mnt/d/idgeo/cp20252027$ ./script.sh


idgeo@GS9:/mnt/d/idgeo/cp20252027/script$ cat mon_dossier/readme.md

idgeo@GS9:/mnt/d/idgeo/cp20252027/script$ ogr2ogr -f "Postgresql" PG:"dbname=abdoulhakim user=editeur host=192.168.10.1 port=15432 password=editeur2026" -nln public.hg -s_srs EPSG:2154 -t_srs EPSG:2154 ..
/vecteur/shp/HG.shp


idgeo@GS9:/mnt/d/idgeo/cp20252027/script$ ogr2ogr -f "Postgresql" PG:"dbname=abdoulhakim user=editeur host=192.168.10.1 port=15432 password=editeur2026" -nln public.dep_09 -s_srs EPSG:4326 -t_srs EPSG:2154 WFS:https://data.geopf.fr/wfs/ows?VERSION=2.0.0 BDCARTO_V5:departement -where "code_insee='09'"

wget https://data.geopf.fr/telechargement/download/BDALTI/BDALTIV2_2-0_25M_ASC_LAMB93-IGN69_D031_2021-05-12/BDALTIV2_2-0_25M_ASC_LAMB93-IGN69_D031_2021-05-12.7z


7z x BDALTIV2_2-0_25M_ASC_LAMB93-IGN69_D031_2021-05-12.7z


gdalbuildvrt -srcnodata -99 mtn31.vrt BDALTIV2_2-0_25M_ASC_LAMB93-IGN69_D031_2021-05-12/BDALTIV2/1_DONNEES_LIVRAISON_2021-10-00008/BDALTIV2_MNT_25M_ASC_LAMB93_IGN69_D031/*.asc


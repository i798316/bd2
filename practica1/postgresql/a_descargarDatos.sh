#!/bind/bash

# Oferta y ocupación de plazas
wget https://zaguan.unizar.es/record/87665/files/CSV.csv
mv CSV.csv Oferta2019.csv

wget https://zaguan.unizar.es/record/96835/files/CSV.csv
mv CSV.csv Oferta2020.csv

wget https://zaguan.unizar.es/record/108270/files/CSV.csv
mv CSV.csv Oferta2021.csv

echo "1/6 apartados descargados"

# Resultados de las titulaciones
wget https://zaguan.unizar.es/record/95644/files/CSV.csv
mv CSV.csv Resultados2019.csv

wget https://zaguan.unizar.es/record/107369/files/CSV.csv
mv CSV.csv Resultados2020.csv

wget https://zaguan.unizar.es/record/118234/files/CSV.csv
mv CSV.csv Resultados2021.csv

echo "2/6 apartados descargados"

# Notas de corte
wget https://zaguan.unizar.es/record/87663/files/CSV.csv
mv CSV.csv Notas2019.csv

wget https://zaguan.unizar.es/record/98173/files/CSV.csv
mv CSV.csv Notas2020.csv

wget https://zaguan.unizar.es/record/109322/files/CSV.csv
mv CSV.csv Notas2021.csv

echo "3/6 apartados descargados"

# Acuerdos de movilidad
wget https://zaguan.unizar.es/record/83980/files/CSV.csv
mv CSV.csv Movilidad2019.csv

wget https://zaguan.unizar.es/record/95648/files/CSV.csv
mv CSV.csv Movilidad2020.csv

wget https://zaguan.unizar.es/record/107373/files/CSV.csv
mv CSV.csv Movilidad2021.csv

echo "4/6 apartados descargados"

# Alumnos egresados por titulación
wget https://zaguan.unizar.es/record/95646/files/CSV.csv
mv CSV.csv Egresados2019.csv

wget https://zaguan.unizar.es/record/107371/files/CSV.csv
mv CSV.csv Egresados2020.csv

wget https://zaguan.unizar.es/record/118236/files/CSV.csv
mv CSV.csv Egresados2021.csv

echo "5/6 apartados descargados"

# Rendimiento por asignatura y titulación

wget https://zaguan.unizar.es/record/95645/files/CSV.csv
mv CSV.csv Rendimiento2019.csv

wget https://zaguan.unizar.es/record/107370/files/CSV.csv
mv CSV.csv Rendimiento2020.csv

wget https://zaguan.unizar.es/record/118235/files/CSV.csv
mv CSV.csv Rendimiento2021.csv

echo "Descarga completada"

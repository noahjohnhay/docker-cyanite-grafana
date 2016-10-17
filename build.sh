echo "====================================="
echo "=         BUILDING CYANITE          ="
echo "====================================="
cd ../cyanite
docker build --tag="cyanite:0.5.1" .
sleep 3
docker run -d -p 2003:2003 --name="cyanite" cyanite:0.5.1
sleep 10
echo "====================================="
echo "=         BUILDING GRAPHITE         ="
echo "====================================="
cd ../graphite_api
docker build --tag="graphite_api:1.1.3" .
sleep 3
docker run -d -p 8000:8000 -p 80:80 --link cyanite:cyanite --name "graphite" graphite_api:1.1.3 
sleep 10
echo "====================================="
echo "=              ALL DONE             ="
echo "====================================="

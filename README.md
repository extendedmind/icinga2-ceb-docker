# Icinga2 Docker Container for Command Execution Bridge

## Use a data volume container to save configuration
docker create -v /etc/icinga2:/etc/icinga2 --name icinga2-ceb-data extendedmind/icinga2-ceb /bin/true

## ..follow that with..
docker run -d -p 5665:5665 -t --name icinga2-ceb --volumes-from icinga2-ceb-data extendedmind/icinga2-ceb:latest

## ..and then configure the remote execution bridge:
docker exec -t icinga2-ceb icinga2 node wizard

# Icinga2 Docker Container for Command Execution Bridge

### Use a data volume container to save configuration...
docker create --name icinga2-ceb-data extendedmind/icinga2-ceb /bin/true

### ...run the Icinga2 CEB container with the data volume container.
docker run -d -p 5665:5665 -t --name icinga2-ceb --volumes-from icinga2-ceb-data extendedmind/icinga2-ceb:latest

### Configure the remote execution bridge by starting a bash...
docker exec -i -t icinga2-ceb bash

### ...where run the setup wizard with instructions from
http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/icinga2-client
icinga2 node wizard

### NOTE: The obvious "docker exec -t icinga2-ceb icinga2 node wizard" gets stuck on first command of wizard.

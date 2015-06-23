# Icinga2 Docker Container for Command Execution Bridge

### Build the container with:
docker build -t extendedmind/icinga2-ceb:latest .

### Use a data volume container to save configuration...
docker create --name icinga2-ceb-data extendedmind/icinga2-ceb:latest

### ...and run the Icinga2 CEB container with the data volume container:
docker run -d -p 5665:5665 -t --name icinga2-ceb --volumes-from icinga2-ceb-data extendedmind/icinga2-ceb:latest

### Configure the remote execution bridge by starting bash...
docker exec -i -t icinga2-ceb bash

### ...where the setup wizard can be run with instructions from http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/icinga2-client
icinga2 node wizard

### On the Icinga2 server, add the newly created Icinga2 host...
sudo icinga2 node add HOST_NAME

### ...configure it...
sudo icinga2 node set HOST_NAME --host HOST_NAME --port 5665

### ...and update config:
sudo icinga2 node update-config && sudo service icinga2 restart

### NOTE: The obvious "docker exec -t icinga2-ceb icinga2 node wizard" gets stuck on first command of wizard.

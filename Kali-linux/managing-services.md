> Managin Services
-------------------------------------------------------------
# SSH Service - Default Port 22/TCP
[] - sudo systemctl start/stop/enable/disable ssh - start will just start it enable will start it at startup
[] - sudo ss -antlp | grep sshd

# HTTP Service - Default Port 80/TCP

[] - sudo systemctl start apache2

# See All Services 
[] - systemctl list-unit-files
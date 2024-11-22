Precheck for installing Wazuh Cluster

Check connectivity on the ports that will be necessary before installing on the different nodes:

- On one node, Script to start temporary services on ports:
  
for port in 1514 1515 1516 514 55000 9200 $(seq 9300 9400) 443; do sudo nc -l -p $port >/dev/null 2>&1 & done

- From the client, check the ports: Run the check command on the client, as you did before:
  
for port in 1514 1515 1516 514 55000 9200 $(seq 9300 9400) 443; do echo -n "Testing port $port... " && nc -zv <IP_DEL_SERVIDOR> $port 2>&1 | grep -q 'succeeded' && echo "OK" || echo "FAILED" done

- End the nc processes on the server: Once the test is complete, stop the nc processes on the server:
  
sudo pkill nc

- Useful commands:

sudo netstat -tuln

sudo yum install -y nmap-ncat

sudo dnf install -y nmap-ncat

sudo apt install -y netcat-openbsd


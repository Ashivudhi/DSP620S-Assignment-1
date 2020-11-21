#Cali - Music Storage App

A simple storage system for songs released by an artist or a group of artists.
The architecture of the application will comprise of a server and a client which will communicate with one another via remote invocation.
##You first clone it in on your machine by doing a 
git clone https://github.com/Ashivudhi/DSP620S-Assignment-1/
##Since Targets for the client and Server jar are ignored by git, you will have to build the project for such to be generated
ballerina build -a
##You than have to run the server for it to be listening at port 9090
ballerina run /target/bin/server.jar
##You will then have to run the client to communicate to the server
ballerina run /target/bin/client.jar

###at this point an interface will be returned for you to select what operation you want to execute :stuck_out_tongue_winking_eye:

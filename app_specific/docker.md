

# Tricks for handling and debugging docker containers


## show all ips of docker container
short/long versions:
```shell
docker inspect --f '{{.Name}} - {{.NetworkSettings.IPAddress }}' $(docker ps -aq)
docker inspect --format='{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
```



## using docker events

According to [How can I debug a docker container initialization? - Server Fault](https://serverfault.com/a/744711):

Docker events command may help and Docker logs command can fetch logs even after the image failed to start.
First start docker events in the background to see whats going on.
`docker events&`

Then run your failing docker run ... command. Then you should see something like the following on screen:

`2015-12-22T15:13:05.503402713+02:00 xxxxxxxacd8ca86df9eac5fd5466884c0b42a06293ccff0b5101b5987f5da07d: (from xxx/xxx:latest) die`


Then you can get the startup hex id from previous message or the output of the run command. Then you can use it with the logs command:

docker logs `<copy the instance id from docker events messages on screen>`

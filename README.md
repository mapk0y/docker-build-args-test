test build-args option that added to docker 1.9.

```console
[[NORMAL]]
+ docker build --no-cache -t build-args-normal .
Sending build context to Docker daemon 56.32 kB
Step 1 : FROM debian
 ---> bf84c1d84a8f
Step 2 : ARG user="nginx"
 ---> Running in dbabdafafd67
 ---> 872c5ab46156
Removing intermediate container dbabdafafd67
Step 3 : RUN groupadd ${user}  && useradd -g ${user} ${user}
 ---> Running in 1a624960b84c
 ---> 9260e2b2892d
Removing intermediate container 1a624960b84c
Step 4 : USER ${user}
 ---> Running in 2793705f324a
 ---> 90ffbab886a0
Removing intermediate container 2793705f324a
Successfully built 90ffbab886a0
+ docker run --rm build-args-normal id
uid=1000(nginx) gid=1000(nginx) groups=1000(nginx)
+ set +x

[[ADD BUILD ARGS]]
+ docker build --no-cache -t build-args-add --build-arg=user=apache .
Sending build context to Docker daemon 56.32 kB
Step 1 : FROM debian
 ---> bf84c1d84a8f
Step 2 : ARG user="nginx"
 ---> Running in c3acc2ecd957
 ---> e0d12af90d63
Removing intermediate container c3acc2ecd957
Step 3 : RUN groupadd ${user}  && useradd -g ${user} ${user}
 ---> Running in 9ee38548ac96
 ---> 80b62389c46d
Removing intermediate container 9ee38548ac96
Step 4 : USER ${user}
 ---> Running in 12dc651fb2da
 ---> eb26a1ff75f3
Removing intermediate container 12dc651fb2da
Successfully built eb26a1ff75f3
+ docker run --rm build-args-add id
uid=1000(apache) gid=1000(apache) groups=1000(apache)
+ set +x
```

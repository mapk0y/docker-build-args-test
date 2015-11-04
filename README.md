test build-args option that added to docker 1.9.

```console
[[NORMAL]]
Sending build context to Docker daemon 4.096 kBSending build context to Docker daemon 4.096 kB
Step 1 : FROM debian
 ---> bf84c1d84a8f
Step 2 : ARG user="nginx"
 ---> Running in b23025bdced4
 ---> e9242bc22905
Removing intermediate container b23025bdced4
Step 3 : RUN groupadd ${user}  && useradd -g ${user} ${user}
 ---> Running in c1a51adce0c5
 ---> 0b7595e6b6ce
Removing intermediate container c1a51adce0c5
Step 4 : USER ${user}
 ---> Running in c569280a0c12
 ---> 8bcd48e81ea0
Removing intermediate container c569280a0c12
Successfully built 8bcd48e81ea0
uid=1000(nginx) gid=1000(nginx) groups=1000(nginx)
[[ADD BUILD ARGS]]
Sending build context to Docker daemon 4.608 kBSending build context to Docker daemon 4.608 kB
Step 1 : FROM debian
 ---> bf84c1d84a8f
Step 2 : ARG user="nginx"
 ---> Running in a34fe4265989
 ---> 9b7fce7f420c
Removing intermediate container a34fe4265989
Step 3 : RUN groupadd ${user}  && useradd -g ${user} ${user}
 ---> Running in acf2289ff436
 ---> df438771432a
Removing intermediate container acf2289ff436
Step 4 : USER ${user}
 ---> Running in 3fdee6244cc5
 ---> 26dc0618ef66
Removing intermediate container 3fdee6244cc5
Successfully built 26dc0618ef66
uid=1000(apache) gid=1000(apache) groups=1000(apache)
```

## wp-cli

### Testing
```sh
docker build -t ansible-test .
docker run -d -e=container=docker \
    --stop-signal=SIGRTMIN+3 \
    --cap-add=SYS_ADMIN --security-opt=seccomp:unconfined \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v $(pwd)/tasks:/app/roles/wp-ansible/tasks \
    -v $(pwd)/defaults:/app/roles/wp-ansible/defaults -v $(pwd)/examples/site.yaml:/app/site.yaml ansible-test /sbin/init
```
### Todo 
- Specify plugins, config for every site via `*`
- Manage db tasks for creating site db if root user provided
- Options for purging non-configured resources
- Option to backup db before running installs
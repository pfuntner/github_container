# Installing Github Server
This is an attempt to install a private Github server so I can play with hooks.

I am basing this on [_How to Run Your Own Git Server_](https://www.linux.com/learn/how-run-your-own-git-server).


## `git` frontend script
I created a frontend to `/usr/bin/git` that specifies the local port with which to reach the container via `ssh`.

From a client, I can do:

```
$ github_container/git clone git@localhost:/home/git/gitwork.git
Cloning into 'gitwork'...
Warning: Permanently added '[localhost]:52311' (ECDSA) to the list of known hosts.
warning: You appear to have cloned an empty repository.
$
```

Note there is a warning because the repo is empty but that's ok.  I might work on creating some content but I'm happy with it so far.

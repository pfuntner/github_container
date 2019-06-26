# Installing Github Server
This is an attempt to install a private Github server so I can play with hooks.

I am basing this on [_How to Run Your Own Git Server_](https://www.linux.com/learn/how-run-your-own-git-server).


## `git` frontend script
I created a frontend to `/usr/bin/git` that specifies the local port with which to reach the container via `ssh`.

From a client, I can do:

```
{PATH_TO_SERVER_DIR}/git clone git@localhost:/home/git/gitwork.git
```

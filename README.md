#  JupyterLab

This is a Dockerfile that JupyterLab automatically builds Docker images.

For more details,

Github: [link](https://github.com/SilvesterHsu/jupyterlab)

Docker: [link]()

# How to run it?

```
docker run -it --name lab -p "$PORT":8888 -v "$PWD":/notebooks silvesterhsu/jupyterlab:"$TAG"
```

## Set password

Once you start container, an unique`token` will be shown in the terminal.

![token](https://tva1.sinaimg.cn/large/006y8mN6gy1g7i9d2cyisj30nz07y451.jpg)

Use the `token` to setup a password when you open the browser `127.0.0.1:8888`.

![set password](https://tva1.sinaimg.cn/large/006y8mN6gy1g7i9ghwmaxj30gg06tdg8.jpg)

Once the password is set and successfully logged in, jupyterLab completes the password configuration. You need to terminate and restart the lab container in the terminal.

Use `control+C` to stop the jupyterlab container, or start a new terminal:

```
docker restart lab
```

Then, setting the password is complete.

## Extension

This image has already installed some common used extension, such as [jupyterlab-toc](https://github.com/jupyterlab/jupyterlab-toc), [jupyterlab_code_formatter](https://github.com/ryantam626/jupyterlab_code_formatter)and [jupyterlab_sublime](https://github.com/ryantam626/jupyterlab_sublime) etc.

**Manage Extensions:**

Go to `Settings -> Enable Extension Manager (experimental)`.

Once found, you can find a tag similar to the puzzle on the left. It can be very convenient to install and remove extensions.

## Using Hot Key

Go to `Settings -> Advanced Setting Editor -> Keyboard Shortcuts`to add hot key.

For example, add hot key for `autopep8`:

```
{
    "shortcuts": [
    {
        "command": "notebook:move-cell-down",
        "keys": [
        "Ctrl ["
        ],
        "selector": ".jp-Notebook:focus",
        "title": "Move Cells Down",
        "category": "Notebook Cell Operations"
    },
    {
        "command": "notebook:move-cell-up",
        "keys": [
        "Ctrl ]"
        ],
        "selector": ".jp-Notebook:focus",
        "title": "Move Cells Down",
        "category": "Notebook Cell Operations"
    }
    ]
}
```




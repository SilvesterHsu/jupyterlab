#  JupyterLab

This is a Dockerfile that JupyterLab automatically builds Docker images.

# Why build it?

support for Jupiter lab, and commonly used plugins in jupyter lab.

For more details,

Github: [link](https://github.com/SilvesterHsu/jupyterlab)

Docker: [link](https://cloud.docker.com/repository/docker/silvesterhsu/jupyterlab)

# How to run it?

```
docker run -it --name lab --restart=always -p "$PORT":8888 -v "$PWD":/notebooks silvesterhsu/jupyterlab:"$TAG"
```

`$PORT`: Port mapping. It is the port that needs to link the local to the image. In docker, jupyter will open port `8888` as a web access. If the local port `8888` is not occupied, it is recommended to use `8888`.

`$PWD`: File mapping. Project work path

`$TAG`:  `latest` or `ARM`, if not filled in, the latest version is downloaded by default. It all depends on your CPU. If you are installing with **Raspberry Pi**, please use `ARM`.

**Example:**

```
docker run -it --name lab --restart=always -p 8888:8888 -v ~/new_project:/notebooks silvesterhsu/jupyterlab
```

## Set password

Once you start container, an unique`token` will be shown in the terminal.

![token](https://tva1.sinaimg.cn/large/006y8mN6gy1g7i9d2cyisj30nz07y451.jpg)

Use the `token` to setup a password when you open the browser `127.0.0.1:8888`.

**note:** The port number depends on the port you are mapping

![set password](https://tva1.sinaimg.cn/large/006y8mN6gy1g7i9ghwmaxj30gg06tdg8.jpg)

Once the password is set and successfully logged in, jupyterLab completes the password configuration. You need to terminate and restart the lab container in the terminal.

Use `control+C` to stop the jupyterlab container, or start a new terminal:

```
docker restart lab
```

It is necessary to restart the container. After the password is stored, it needs to be restarted to apply.

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




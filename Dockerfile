FROM python:slim

# nodejs
RUN apt update; apt-get install nodejs npm -y

# jupyter lab
COPY requirements.txt /root/
RUN pip install -r /root/requirements.txt && \
    jupyter lab --generate-config && \
    jupyter labextension install @jupyterlab/toc && \
    jupyter labextension install @lckr/jupyterlab_variableinspector && \
    jupyter labextension install @krassowski/jupyterlab_go_to_definition && \
    jupyter labextension install @ryantam626/jupyterlab_code_formatter && \
    jupyter serverextension enable --py jupyterlab_code_formatter && \
    jupyter labextension install @ryantam626/jupyterlab_sublime

RUN mkdir /notebooks
WORKDIR "/notebooks"

EXPOSE 8888
VOLUME ["/notebooks"]
CMD ["/bin/bash", "-c", "jupyter lab --ip=0.0.0.0 --allow-root"]

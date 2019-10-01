FROM python:slim

# nodejs
RUN apt update; apt-get install nodejs npm -y

# jupyter lab
COPY requirements.txt /root/
RUN pip install -r /root/requirements.txt

# extension
COPY extensions /root/
RUN jupyter lab --generate-config && \
    cd /root/jupyterlab-toc && \
    jlpm install && \
    jlpm run build && \
    jupyter labextension install . && \
    cd /root/jupyterlab_code_formatter && \
    npm install && \
    npm run build && \
    jupyter labextension link . && \
    pip install -e . && \
    jupyter serverextension enable --py jupyterlab_code_formatter && \
    cd /root/jupyterlab_sublime && \
    npm install && \
    npm run build && \
    jupyter labextension link . && \
    cd  /root && \
    jupyter labextension install @lckr/jupyterlab_variableinspector && \
    jupyter labextension install @krassowski/jupyterlab_go_to_definition

RUN mkdir /notebooks
WORKDIR "/notebooks"

EXPOSE 8888
VOLUME ["/notebooks"]
CMD ["/bin/bash", "-c", "jupyter lab --ip=0.0.0.0 --allow-root"]

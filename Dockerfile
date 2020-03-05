FROM jupyter/scipy-notebook

USER root

RUN conda config --set show_channel_urls yes && \
    conda clean -i && \
    conda install -v --yes -c conda-forge clickhouse-driver && \
    conda install -v --yes -c conda-forge clickhouse-sqlalchemy && \
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple ipython-sql openpyxl

USER $NB_UID

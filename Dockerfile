FROM jupyter/scipy-notebook

USER root

RUN apt-get update && \
    apt-get install -y libmysqlclient-dev && \
    rm -rf /var/lib/apt/lists && \
    conda config --set show_channel_urls yes && \
    conda clean -i && \
    conda install -v --yes -c conda-forge clickhouse-driver && \
    conda install -v --yes -c conda-forge clickhouse-sqlalchemy && \
    pip install ipython-sql openpyxl torndb mysqlclient xlsxwriter pymysql

USER $NB_UID

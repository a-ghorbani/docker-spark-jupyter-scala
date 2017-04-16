# Apache Spark + Miniconda + Scala kernel for Jupyter on Docker 

This docker image is based on [this](https://hub.docker.com/r/aghorbani/spark-miniconda) spark-Miniconda docker image, which additionally includes some useful data science tools:

* [jupyter-scala](https://github.com/alexarchambault/jupyter-scala),
* [Apache Toree](https://github.com/apache/incubator-toree),
* [declarativewidgets](https://github.com/jupyter-incubator/declarativewidgets),
* [jupyter_dashboards](https://github.com/jupyter-incubator/dashboards),
* [vega](https://github.com/vega/ipyvega) and
* [plotly](https://plot.ly/python/getting-started/).  

## Pull the image from Docker Repository

```
docker pull aghorbani/spark-jupyter-scala
```

## Build the image

```
docker build --rm -t aghorbani/spark-jupyter-scala  .
```

## Running the image

```
docker run -it -p 8088:8088 -p 8042:8042 -p 4040:4040 -p 8888:8888 -h sandbox aghorbani/spark-jupyter-scala
```

### Store your notebooks in a local volume

```
docker run -it \
           -v /path/to/local/notebooks:/notebooks \
           -p 8088:8088 -p 8042:8042 -p 4040:4040 -p 8888:8888 \
           -h sandbox \
           aghorbani/spark-jupyter-scala
```

In the above command please replace `/path/to/local/notebooks` to your local volume, 
where you would like to have the notebooks.

For further details on the spark part of this image have a look [here](https://hub.docker.com/r/aghorbani/spark).


# Details of the base image are here: hub.docker.com/r/jupyter/scipy-notebook
# Tag [29f53f8b9927] is latest image as of Apr 23, 2020 

FROM jupyter/scipy-notebook:29f53f8b9927

MAINTAINER Jon Krohn <jon@jonkrohn.com>

COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/

USER $NB_USER

# Install dependencies from requirements.txt
# This combines layers and uses caching more effectively.
RUN pip install --no-cache-dir -r /tmp/requirements.txt

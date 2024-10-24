#!/bin/bash

chown -R admin:www-data ./psm-portal
# ndt-portal folder first
find ./psm-portal -type d -exec chmod u=rwx,g=rx,o= '{}' +
find ./psm-portal -type f -exec chmod u=rw,g=r,o= '{}' +
# ndt-portal/storage second
find ./psm-portal/storage -type d -exec chmod u=rwx,g=rwx,o= '{}' +
find ./psm-portal/storage -type f -exec chmod u=rw,g=rw,o= '{}' +
# ndt-portal/bootstarp/cache third
find ./psm-portal/bootstrap/cache -type d -exec chmod u=rwx,g=rwx,o= '{}' +
find ./psm-portal/bootstrap/cache -type f -exec chmod u=rw,g=rw,o= '{}' +


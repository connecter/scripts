#!/bin/bash

gcloud auth list          # lists active accounts

gcloud config set compute/zone us-central1-a
gcloud config set project evident-ethos-793

echo simba:$(cat ssh/simba.pub) > /tmp/keys
echo videobridge:$(cat ssh/videobridge.pub) >> /tmp/keys
echo jicofo:$(cat ssh/jicofo.pub) >> /tmp/keys
echo zazu:$(cat ssh/zazu.pub) >> /tmp/keys


gcloud compute project-info add-metadata --metadata-from-file sshKeys=/tmp/keys

#gcloud config list -all

#gcloud compute instances create core1 --image https://www.googleapis.com/compute/v1/projects/coreos-cloud/global/images/coreos-stable-522-6-0-v20150128 --machine-type g1-small --metadata-from-file user-data=cloud-config.yaml

#
#gcloud compute instances delete core1
#
#https://cloud.google.com/compute/docs/instances#sshkeys
#

#!/bin/bash

gcloud.cmd compute instance-templates create selenium-grid-template \
    --machine-type g1-small \
    --image-family ubuntu-1604-lts \
    --image-project ubuntu-os-cloud \
    --boot-disk-type pd-ssd \
    --boot-disk-size 10GB \
    --tags selenium-grid \
    --scopes useraccounts-ro,storage-ro,logging-write,monitoring-write,service-management,service-control,compute-ro \
    --metadata-from-file startup-script=selenium-grid/stratup-scripts.sh

gcloud.cmd compute instance-groups managed create selenium-grid \
    --base-instance-name selenium-grid \
    --size 1 \
    --region $(gcloud.cmd config get-value compute/region) \
    --template selenium-grid-template
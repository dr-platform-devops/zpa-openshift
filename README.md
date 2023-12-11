# ZPA App Connector Openshift Helm Chart

This repository contains the official ZPA App Connector Helm chart for Openshift.

## Prerequisites

Helm 3 \
Openshift 4.11 \
Metrics Server

## Docker image

This process assumes you have full network access to the docker images hosted on

https://hub.docker.com/u/zscaler

<br/><br/>

## Installation

In order to install the zpa-app-connector-openshift please use the below steps

1. Login as kubeadmin and switch to default project. You will be on the default project when you login as kubeadmin unless there is a change in the settings. So you would not need any command to move to default project. \
If you are not on the default, please use the command\
    `oc project default`

<br/><br/>


2. Install the helm chart
From the folder , \
    `helm install [NAME] [CHART] [flags]` \
    `helm install [NAME] --set zsglobal.provisionkey.value="<provision_key>"  zpa-app-connector-openshift-0.1.0.tgz` \
     You can retrieve the provisioning key from the [ZPA Admin Portal](https://admin.private.zscaler.com/). To learn more, see [About App Connector Provisioning Keys](https://help.zscaler.com/zpa/about-connector-provisioning-keys).

<br/><br/>

3. Verify if the pods are running.
zscaler-zpa is the namespace that is added when this helm chart is installed \
    `oc get pods -n zscaler-zpa`
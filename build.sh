#!/usr/bin/env bash

cp ~/.ssh/id_rsa.pub ./id_rsa.pub
vagrant up --provision
vagrant halt


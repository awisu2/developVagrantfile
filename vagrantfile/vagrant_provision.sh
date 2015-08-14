#!/bin/sh

# ansibleのインストール
if ! [ `which ansible` ]; then
    yum update -y
    yum install -y ansible
fi

# cd /vagrant
# ansible-playbook -i ./ansible/hosts ./ansible/playbooks/site.yml

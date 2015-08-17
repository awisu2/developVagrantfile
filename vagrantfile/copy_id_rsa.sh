#!/bin/sh

# 現在のディレクトリに移動
CURDIR=`dirname $0`

# パスの作成
SSH_CONFIG="${CURDIR}/.ssh_config"
ID_RSA="${CURDIR}/.id_rsa"

# vagrantのssh設定を取得
vagrant ssh-config > ${SSH_CONFIG}

#上書き確認のため、一度取得
scp -F ${SSH_CONFIG} machine0:.ssh/id_rsa ${ID_RSA}

# 存在確認をしてコピー
if [ -e ${ID_RSA} ]; then
    rm -f ${ID_RSA}
else
    IDNTITY=`cat ${SSH_CONFIG} | grep IdentityFile | sed -e '1!d' | sed -e 's/IdentityFile//g' | sed -e 's/[ :]//g'`
    scp -F "${SSH_CONFIG}" "/${IDNTITY}" machine0:.ssh/id_rsa
fi

#　不要ファイルの削除
rm -f ${SSH_CONFIG}

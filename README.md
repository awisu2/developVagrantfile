# developVagrantfile

ansibleを利用した開発用の汎用環
境構築用vagrantfile

## 使い方

とりあえず2台のサーバを立ち上げ、
machine0からmachine1へパスワード無しでssh出来る環境を構築

1. vagrant up
2. sh ./copy_id_rsa.sh
3. 後は好きな様に、VagrantFileいじってください

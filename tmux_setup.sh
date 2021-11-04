#!/bin/bash

# 必須パッケージのインストール
sudo apt update
sudo apt install git automake bison build-essential pkg-config libevent-dev libncurses5-dev
# ソースコードのダウンロード
cd /usr/local/src/
sudo git clone https://github.com/tmux/tmux
# ビルド
cd tmux
sudo ./autogen.sh
sudo ./configure --prefix=/usr/local
sudo make
# インストールと確認
sudo make install
which tmux  # /usr/local/bin/tmux となっていることを確認
tmux -V

## sudo
### sudoをインストール
rootに変更

		$ su
		Password:
		#

インストール

		# apt install sudo

インストールされたか確認

		# apt list --installed | grep sudo
		または
		# dpkg -l | grep sudo

PATHを設定する

		# vi ~/.bash_profile
		export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"

sudo groupにユーザを追加

		# adduser <username> sudo
		または
		# usermod -aG sudo <username>

追加されたかの確認

		sudoに誰が所属しているのか
		# getent group sudo
		<username>が所属しているグループ
		# groups <username>

変更を有効にする

		# reboot

### sudoの設定

sudoコマンドを記録するディレクトリを作成

		$ sudo mkdir /var/log/sudo

sudoersファイルの設定

		$ sudo vi /etc/sudoers.d/<filename>

sudo が「失敗」をログに記録して終了する前に、 ユーザがパスワードを入力できる回数の設定。デフォルトは３回。

		Defaults        passwd_tries=3

ユーザが不正なパスワードを入力したときに表示するメッセージ。デフォルトは「Sorry, try again.」

		Defaults        badpass_message="<error-message>"

すべてのsudo入力と出力をアーカイブする

		Defaults        log_input,log_output
		Defaults        iolog_dir="/var/log/sudo"

sudoコマンドを/var/log/sudo/<filename>に保存する

		Defaults        logfile="/var/log/sudo/<filename>"

ttyを要求する

		Defaults requiretty

sudoの実行に擬似端末(tty)を要求する。つまり、このオプションが有効になっている場合、sudoの実行できるのはログインセッション(sshで擬似端末を要求した場合含む)だけで、cronなどからの実行を許可させない。デフォルトでは無効(RHEL系のディストリビューションでは設定ファイルで有効にされている場合がある)。  

---------------------------------
sudoreplay

		sudo sudoreplay [TSID] -d /var/log/sudo

## SSH UFW
### openssh-serverのインストールと設定
openssh-serverのインストール

		$ sudo apt install openssh-server

インストールされたか確認

		# apt list --installed | grep ssh
		または
		$ dpkg -l | grep ssh

sshの設定

		$ sudo vi /etc/ssh/sshd_config

port4242に設定する

		13: port 4242

rootでのログインを禁止する

		32: PermitRootLogin no

以下を有効化する

	#RSAAuthentication yes
	#PubkeyAuthentication yes
	#AuthorizedKeysFile     .ssh/authorized_keys

更新

		# sudo systemctl restart ssh

sshステータスの確認

		# sudo systemctl status ssh
		または
		# sudo service ssh status

----------------
SSH鍵を作成する

		$ ssh-keygen -t rsa


### ufwのインストールと設定
ufwのインストール

		$ sudo apt install ufw

インストールされたか確認

		# apt list --installed | grep ufw
		または
		$ dpkg -l | grep ufw

ファイアーウォールの有効化

		$ sudo ufw enable

4242portからの接続を許可

		$ sudo ufw allow 4242

-------------------
削除コマンド

		$ sudo ufw delete allow 4242

ufwの設定確認

		$ sudo ufw status
		$ sudo ufw status verbose

### SSH経由でサーバーに接続する
4242portを介してsshで接続する

		$ ssh <username>@<ip-address> -p 4242

sshセッションを終了する

		$ exit

## パスワードポリシー設定
パスワード品質チェックライブラリをインストール

		$ sudo apt install libpam-pwquality

インストールされたか確認

		# apt list --installed | grep libpam-pwquality
		または
		$ dpkg -l | grep libpam-pwquality

パスワードの有効期限

		$ sudo vi /etc/login.defs

パスワードを30日ごとに期限切れにするように設定する

		160: PASS_MAX_DAYS   30

パスワードの最短利用日数を2日に設定する

		161: PASS_MIN_DAYS   2

パスワードの有効期限が来る前に警告を発する日数を設定する(デフォルトは７)

		162: PASS_WARN_AGE   7
 
/etc/security/pwquality.conf

		$ sudo vi /etc/security/pwquality.conf

パスワードの最低文字数を設定する

		11: minlen=10

パスワードに小文字を含める

		25: lcredit = -1

パスワードに大文字を含める

		20: ucredit = -1

パスワードの最大連続文字数を設定する

		38: maxrepeat = 3

変更前のパスワードに含まれる文字が変更後のパスワードに7文字以上含めない

		6: difok = 7
	
/etc/pam.d/common-password

		$ sudo vi /etc/pam.d/common-password

パスワードにユーザー名を含めない(reject_username)  
ルートにも同じパスワードポリシーを設定する(enforce_for_root)

		25: password  requisite      pam_pwquality.so retry=3 reject_username enforce_for_root


--------------------------
**common-passwordにまとめて書くこともできる**

		25: password  requisite      pam_pwquality.so retry=3 minlen=10 ucredit=-1 lcredit=-1 maxrepeat=3 difok=7 reject_username enforce_for_root

## 新規グループ作成

		$ sudo addgroup user42

sudo groupにユーザを追加

		$ sudo adduser <username> user42
		または
		$ sudo usermod -aG user42 <username>

追加されたかの確認

		user42に誰が所属しているのか
		$ sudo getent group user42
		<username>が所属しているグループ
		$ sudo groups <username>

## cron
cronをrootとして設定

		$ sudo crontab -u root -e

シェルスクリプトを10分ごとに実行するようにスケジュールする

		23: */10 * * * * sh /path/to/monitoring.sh

cron設定確認

		$ sudo crontab -u root -l

cronの状態、再起動、停止

		$ sudo systemctl status cron
		$ sudo systemctl restart cron
		$ sudo systemctl stop cron

		$ sudo systemctl disable
		$ sudo systemctl enable

---------------------

- パスワード情報変更

パスワードが有効な最長日数

		$ sudo chage -M 30 <username>

パスワード変更間隔の最短日数

		$ sudo chage -m 2 <username>

パスワードの変更が必要となる前に警告する期間

		$ sudo chage -W 7 <username>

ユーザーパスワードの有効期限情報を確認

		$ sudo chage -l <username>

- ユーザー情報のみ表示する

		$ cut -d: -f1 /etc/passwd

- LVM拡張

		$ sudo lvextend -L+<size> /path/to/lvm

- パスワードの変更

		$ sudo passwd <username>

- ホスト名の変更

		$ sudo hostnamectl set-hostname <new-hostname>

- 公開鍵をサーバーに転送する方法

		$ ssh-copy-id remote_host
		$ ssh-copy-id -i ~/.ssh/id_rsa.pub [リモートユーザー]@[リモートサーバーのホスト名]

- vim install

		$ sudo apt install vim

- nodejs, npm, yarn

		$ sudo apt install nodejs
		$ sudo apt install npm
		$ sudo npm install -g yarn

- libbsd-dev : compile -> -lbsd

		$ sudo apt install libbsd-dev

> sudo log replay  
> lsof -i | grep ssh  
> cron stop -> disable  

- [clangd](https://clangd.llvm.org/installation.html)

- [LVMで 論理ボリュームの作成、拡張、縮小、複製](https://qiita.com/TsutomuNakamura/items/93c6333c8dd32aeb197a)
- [パスワードポリシーを設定する](https://www.server-world.info/query?os=Debian_10&p=password)
- [UbuntuやCentOSに最新のtmuxを導入する](https://qiita.com/ha4gu/items/aebe9207904f52ee4fb6#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E5%85%88)

- [Born2beroot notion](https://42-cursus.notion.site/42-cursus/Born2beroot-a6f74a67af104da4a013fa1b2db77c65)

Born2beRoot  

Contents  
  
1 Preamble  
2 Introduction  
3 General guidelines  
4 Bonus part  
5 submission and peer-evaluation  
  
Chapter 1  
Preamble  
  
You can do anything you want to do  
	Virtual  
	Machine  
Thiis is your world  
  
Chapter 2  
Introduction  
  
This project aims to introduce you to the wonderful world of virtualization.
You will create your first machine in VirtualBox (or UTM if you can’t use VirtualBox)
under specific instructions. Then, at the end of this project, you will be able to set up
	your own operating system while implementing strict rules.  
このプロジェクトは、仮想化の素晴らしい世界を紹介することを目的としています。  
VirtualBox（VirtualBoxを使用できない場合はUTM）で最初のマシンを作成します。  
そして、このプロジェクトの終わりには、厳しいルールを守りながら、  
自分のオペレーティングシステムをセットアップできるようになります。  

Chapter 3  
General guidelines  
  
The use of VirtualBox (or UTM if you can’t use VirtualBox) is mandatory.  
You only have to turn in a signature.txt file at the root of your repository.  
You must paste in it the signature of your machine’s virtual disk.  
Go to Submission and peer-evaluation for more information.  
リポジトリのルートにsignature.txtファイルを投入するだけです。  
あなたはマシンの仮想ディスクの署名を貼り付ける必要があります。  
詳しくは、「提出とピア評価」をご覧ください。  
  
Chapter 4  
Mandatory part  
  
This project consists of having you set up your first server by following specific rules.  
このプロジェクトでは、特定のルールに従って初めてのサーバーを立ち上げていただきます。  
  
Since it is a matter of setting up a server, you will install the  
minimum of services. For this reason, a graphical interface is of no  
use here. It is therefore forbidden to install X.org or any other  
equivalent graphics server. Otherwise, your grade will be 0.  
サーバーを立ち上げるのですから、最低限のサービスをインストールします。  
そのため、ここではグラフィカルなインターフェースは必要ありません。  
したがって、X.orgやその他の同等のグラフィックサーバーをインストールすることは禁じられています。  
さもなければ、あなたの成績は0になります。  
  
You must choose as an operating system either the latest stable version of Debian (no testing/unstable),  
or the latest stable version of CentOS.Debian is highly recommended if you are new to system administration.  
オペレーティングシステムとして、最新の安定版のDebian（testing/unstableは不可）、  
または最新の安定版のCentOSのいずれかを選択する必要があります。  
システム管理に慣れていない方はDebianを強くお勧めします。  
  
Setting up CentOS is quite complex. Therefore, you don’t have to set up KDump.   
However, SELinux must be running at startup and its configuration has to be adapted for the project’s needs.  
AppArmor for Debian must be running at startup too.  
CentOSの設定はかなり複雑です。そのため、KDumpの設定をする必要はありません。  
ただし、SELinuxは起動時に実行する必要があり、その設定はプロジェクトのニーズに合わせて  
設定をプロジェクトのニーズに合わせる必要があります。AppArmor も起動時に実行されている必要があります。  
  
You must create at least 2 encrypted partitions using LVM. Below is an example of the expected partitioning:  
LVMを使用して少なくとも2つの暗号化パーティションを作成する必要があります。以下は、予想されるパーティションの例です。  
  
During the defense, you will be asked a few questions about the operating system you chose.   
For instance, you should know the differences between aptitude and apt,   
or what SELinux or AppArmor is. In short, understand what you use!  
弁護活動の際には、選択したOSについていくつかの質問を受けます。  
あなたが選んだOSについていくつか質問されます。  
例えば、aptitudeとaptの違いや、SELinuxやAppArmorとは何か、などです。  
要するに、自分が使っているものを理解しましょう。  
  
A SSH service will be running on port 4242 only.   
For security reasons, it must not be possible to connect using SSH as root.  
SSHサービスはポート4242のみで動作します。  
セキュリティ上の理由から rootでSSH接続することはできません。  
  
The use of SSH will be tested during the defense by setting up a new  
account. You must therefore understand how it works.  
SSHの使用は、新しいアカウントを設定することで、防御の間にテストされます。  
そのため、その仕組みを理解しておく必要があります。  
  
You have to configure your operating system with the UFW firewall and thus leave only port 4242 open.  
オペレーティングシステムにUFWファイアウォールを設定し、ポート4242のみを開放する必要があります。  
  
Your firewall must be active when you launch your virtual machine.   
For CentOS, you have to use UFW instead of the default firewall. To install it, you will probably need DNF.  
仮想マシンを起動する際には、ファイアウォールが有効になっている必要があります。  
CentOSでは、デフォルトのファイアウォールの代わりにUFWを使用する必要があります。  
  
The hostname of your virtual machine must be your login ending with 42 (e.g., wil42).   
You will have to modify this hostname during your evaluation.  
You have to implement a strong password policy.  
You have to install and configure sudo following strict rules.   
In addition to the root user, a user with your login as username has to be present.  
This user has to belong to the user42 and sudo groups.  
仮想マシンのホスト名は、あなたのログイン名の末尾が42でなければなりません（例, wil42）。  
このホスト名は、評価中に変更する必要があります。  
強力なパスワードポリシーを導入する必要があります。  
厳格なルールに従って sudo をインストールし、設定する必要があります。  
ルートユーザーに加えて、あなたのログイン名をユーザー名とするユーザーがいなければなりません。  
このユーザーは user42 と sudo グループに属していなければなりません。  
  
During the defense, you will have to create a new user and assign it to a group  
防御の際には、新しいユーザーを作成し、それをグループに割り当てる必要があります。  
  
To set up a strong password policy, you have to comply with the following requirements:  
Your password has to expire every 30 days.  
The minimum number of days allowed before the modification of a password will  
be set to 2.  
The user has to receive a warning message 7 days before their password expires.  
Your password must be at least 10 characters long. It must contain an uppercase  
letter and a number. Also, it must not contain more than 3 consecutive identical  
characters.  
The password must not include the name of the user.  
The following rule does not apply to the root password:  
	The password must have at least 7 characters that are not part of the former password.  
Of course, your root password has to comply with this policy.  
強力なパスワードポリシーを設定するには、以下の要件を満たす必要があります。   
パスワードは30日ごとに失効しなければならない。  
パスワードの変更が許可される最小日数は2に設定されます。  
ユーザーは、パスワードの有効期限が切れる7日前に警告メッセージを受け取らなければなりません。  
パスワードは、少なくとも10文字以上でなければなりません。大文字と数字を含む必要があります。  
また、3つ以上の連続した同じ文字を含んではいけません。  
パスワードにユーザー名が含まれていてはいけません。  
次のルールは、ルートパスワードには適用されません。  
パスワードには、以前のパスワードに含まれていない7文字以上の文字が含まれていなければなりません。  
もちろん、あなたのルートパスワードはこのポリシーに準拠していなければなりません。  
  
After setting up your configuration files, you will have to change all   
the passwords of the accounts present on the virtual machine, including the root account.  
設定ファイルをセットアップした後は、rootアカウントを含む、  
仮想マシン上に存在するアカウントのパスワードをすべて変更する必要があります。  
  
To set up a strong configuration for your sudo group, you have to comply with the following requirements:  
sudoグループに強力な設定をするためには、以下の要件を満たす必要があります。以下の要件を満たす必要があります。  
  
Authentication using sudo has to be limited to 3 attempts in the event of an incorrect password.  
A custom message of your choice has to be displayed if an error due to a wrong password occurs when using sudo.  
Each action using sudo has to be archived, both inputs and outputs.   
The log file has to be saved in the /var/log/sudo/ folder.  
The TTY mode has to be enabled for security reasons.   
For security reasons too, the paths that can be used by sudo must be restricted.  
Example:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin  
sudo を使用した認証は、パスワードが正しくない場合の試行回数を 3 回に制限する必要があります。  
sudo の使用中に誤ったパスワードによるエラーが発生した場合、選択したカスタムメッセージを表示しなければならない。  
誤ったパスワードによるエラーが発生した場合、任意のカスタムメッセージを表示する必要があります。  
sudo を使用した各アクションは、入力と出力の両方をアーカイブする必要があります。  
ログファイル ログファイルは /var/log/sudo/ フォルダに保存されなければなりません。  
セキュリティ上の理由から、TTY モードを有効にする必要があります。  
セキュリティ上の理由から、sudo で使用できるパスを制限する必要があります。  
  
Finally, you have to create a simple script called monitoring.sh. It must be developed in bash.  
At server startup, the script will display some information (listed below) on   
all terminals every 10 minutes (take a look at wall). The banner is optional. No error must be visible.  
最後に、monitoring.shというシンプルなスクリプトを作成する必要があります。これはbashで開発する必要があります。  
サーバーの起動時に、このスクリプトは10分ごとにすべてのターミナルにいくつかの情報（以下のリスト）を表示します（wallを見てみてください）。  
バナーは任意です。エラーが表示されてはいけません。  
  
Your script must always be able to display the following information:  
あなたのスクリプトは、常に以下の情報を表示できる必要があります。  
  
• The architecture of your operating system and its kernel version.  
• The number of physical processors.  
• The number of virtual processors.  
• The current available RAM on your server and its utilization rate as a percentage.  
• The current available memory on your server and its utilization rate as a percentage.  
• The current utilization rate of your processors as a percentage.  
• The date and time of the last reboot.  
• Whether LVM is active or not.  
• The number of active connections.  
• The number of users using the server.  
• The IPv4 address of your server and its MAC (Media Access Control) address.  
• The number of commands executed with the sudo program.  
- 使用しているOSのアーキテクチャとそのカーネルバージョン。  
- 物理プロセッサの数。  
- 仮想プロセッサの数  
- サーバー上の現在使用可能なRAMとその使用率（%）。  
- サーバー上の現在使用可能なメモリとその使用率（%）。  
- プロセッサーの現在の使用率（パーセント表示）。  
- 前回の再起動の日時。  
- LVMがアクティブかどうか。  
- アクティブな接続の数。  
- サーバーを使用しているユーザーの数。  
- サーバーのIPv4アドレスとそのMAC（Media Access Control）アドレス。  
- sudoプログラムで実行されたコマンドの数。  
  
During the defense, you will be asked to explain how this script works.   
You will also have to interrupt it without modifying it. Take a look at cron.  
弁護活動では、このスクリプトがどのように機能するかを説明することが求められます。  
また、修正せずに中断することも求められます。cronを見てみましょう。  
  
Chapter 5  
Bonus part  
  
Bonus list:  
  
  
To complete the bonus part, you have the possibility to set up extra  
services. In this case, you may open more ports to suit your needs.  
Of course, the UFW rules has to be adapted accordingly.  
ボーナス部分を完成させるには、追加のサービスを設定する可能性があります。  
サービスを設定することができます。この場合、必要に応じてより多くのポートを開くことができます。  
もちろん、UFWのルールはそれに合わせて変更する必要があります。  
  
The bonus part will only be assessed if the mandatory part is  
PERFECT. Perfect means the mandatory part has been integrally done  
and works without malfunctioning. If you have not passed ALL the  
mandatory requirements, your bonus part will not be evaluated at all.  
ボーナスパートは、必須パートが以下の場合にのみ評価されます。  
PERFECT. 完璧とは、必須部分が一体的に行われており 誤動作なく動作していることを意味します。  
すべての必須条件に合格していない場合 すべての必須項目に合格していない場合、ボーナスパートはまったく評価されません。  
  
Chapter 6  
Submission and peer-evaluation  
  
You only have to turn in a signature.txt file at the root of your Git repository.   
You must paste in it the signature of your machine’s virtual disk.   
To get this signature, you first have to open the default installation folder (it is the folder where your VMs are saved):  
あなたは、Gitリポジトリのルートにsignature.txtファイルを投入するだけです。  
あなたは このファイルには、あなたのマシンの仮想ディスクの署名を貼り付ける必要があります。  
	この署名を得るためには まず、デフォルトのインストールフォルダ（VMが保存されているフォルダ）を開きます。を開いてください。  
  
Then, retrieve the signature from the ".vdi" file (or ".qcow2 for UTM’users) of your virtual machine in sha1 format.   
Below are 4 command examples for a centos_serv.vdi file:  
次に、仮想マシンの「.vdi」ファイル（UTMユーザーの場合は「.qcow2」）から署名を取得します。  
sha1フォーマットで取得します。以下は、centos_serv.vdiを対象とした4つのコマンド例です。  
ファイルを対象とした4つのコマンド例です。  
  
Please note that your virtual machine’s signature may be altered  
after your first evaluation. To solve this problem, you can  
duplicate your virtual machine or use save state.  
仮想マシンの署名は、最初の評価後に変更されることがありますので、ご注意ください。  
最初の評価の後、仮想マシンの署名が変更されることがあります。  
この問題を解決するには、次の方法があります。仮想マシンを複製するか、セーブステートを使用してください。  
  
It is of course FORBIDDEN to turn in your virtual machine in your Git  
repository. During the defense, the signature of the signature.txt  
file will be compared with the one of your virtual machine. If the  
two of them are not identical, your grade will be 0.  
もちろん、Gitリポジトリに仮想マシンを登録することは禁じられています。  
防御の際には、signature.txtの署名と仮想マシンの署名が比較されます。  
ファイルの署名が、あなたの仮想マシンの署名と比較されます。もし 同じでなければ成績は0になります。  

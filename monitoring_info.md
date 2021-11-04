# Architecture
## uname
-a --all                カーネル名（-s）、ホスト名（-n）、カーネルリリース番号（-r）、カーネルバージョン（-v）、ハードウェア名（-m）、CPU（-p、不明な場合は省略）、ハードウェアプラットフォーム（-i、不明な場合は省略）、OSの名前（-o）をこの順番で表示する  
-s --kernel-name        カーネル名を表示する（デフォルト）  
-n --nodename           ホスト名（ネットワークノード）を表示する  
-r --kernel-release     カーネルリリース番号を表示する  
-v --kernel-version     カーネルのバージョンを表示する  
-m --machine            ハードウェア名（x86_64など）を表示する  
-p --processor          CPUの種類を表示する（不明な場合は、"unknown"）  
-i --hardware-platform  ハードウェアプラットフォームを表示する（不明な場合は、"unknown"）  
-o --operating-system   OSの名前を表示する  


# CPU physical
## grep
「grep」は、ファイルの中で「文字列（パターン）」が含まれている行を表示するコマンドです。検索対象には、複数のファイルやディレクトリを指定できます。ファイルを指定しなかった場合は、標準入力から読み込みます。パイプ（｜）と組み合わせて、他のコマンドの出力結果から必要な箇所だけを絞り込んで表示する際によく使われます。

## /proc/cpuinfo
- [Linuxの/proc/cpuinfoからわかる情報メモ](https://jikkenjo.net/1950.html)  
- [LinuxでのCPU情報の確認方法](https://senooken.jp/post/2020/11/14/)  
Linuxの場合，CPUの情報は/proc/cpuinfoに記されている。/proc/cpuinfoを直接参照してもいいし，lscpuコマンドもこちらのファイルを参照するため，このコマンドの実行結果をみてもいい。
  
### sort -u
同一行は1つ目だけを出力する（「-c」と併せて使用した場合、厳密に順序を確認する）

### wc -l
改行の数を表示する


# vCPU
- [物理CPUと論理CPUを理解する](https://www.codetd.com/ja/article/12639922)  
vCPU(仮想CPU)とは、仮想化されたコンピュータ上で動作するOSやアプリケーションソフトなどから見て、コンピュータのCPU（中央処理装置）として振る舞うもの。
> (論理プロセッサーの数) コンピュータから見たときに，存在するように見えるCPUのコア数。ハイパースレッド処理が有効になっている場合，物理的なCPUのコア数よりも多く表示される場合がある。


# Memory Usage
## RAM
RAM とは「Random Access Memory」（ランダムアクセスメモリ）の略。CPUが何らかの処理を行ったり、画面上に何かしらのデータを表示したりするときに使う作業用のメインメモリ（主記憶装置）。RAMのデータは頻繁に書き換えられ、電源が切れると作業に使っていた一時データも消える。
> ROM  「Read Only Memory」（リードオンリーメモリ）の略。こちらはRead Onlyという名前の通り、書き込み不可・読み出しのみ可能なメモリを指す。

## free
free はシステムの物理メモリとスワップメモリの使用量、空き容量を表示します。  
-b	--bytes	メモリの量をバイト単位で表示する  
-k	--kilo	メモリの量をKB単位で表示する（デフォルト）  
-m	--mega	メモリの量をMB単位で表示する  
-g	--giga	メモリの量をGB単位で表示する  
	--tera	メモリの量をTB単位で表示する  
-h	--human	読みやすい単位で表示する  
	--si	単位を換算する際に1024ではなく1000で割って計算する  
-l	--lohi	LowメモリとHighメモリの状況も表示する  
-t	--total	物理メモリとスワップメモリの合計を示す行も表示する  
-s 間隔	--seconds 間隔	再出力の間隔を「ss.tt秒」で指定する（デフォルトは1回出力して終了する）  
-c 回数	--count 回数	再出力する回数を指定する（デフォルトは1回出力して終了する）  

## awk
- [awkコマンドの基本](https://qiita.com/yamazon/items/563af1b485ff413d381f)  
awkは入力として受け取った文字列に対して、フィールド区切り文字やレコード区切り文字を指定して、「列」に対する処理を行うためのコマンドです。また、awk 単体としても、1つのプログラムです。
> ex:

		1フィールド目を出力
		$ echo 1 2 3 4 |awk '{print $1}'
		1
		フィールド区切り文字に":"を指定
		$ echo 1:2:3:4 |awk -F'[:]' '{print $1}'
		1


# Disk Usage
## df
- [【Linux】ディスク容量を確認できるdfコマンドについて](https://it-kyujin.jp/article/detail/1248/)  
df コマンドは「disk free」という英語の略であり、文字通りディスク（disk）容量の空きスペース（free）を確認することできるコマンドとなっている。  
df は各ファイルシステムにおいて、 すでに使用中のディスクの量と使用可能なディスクの量を表示する。引き数がない場合、 df は現在マウントされている (全てのタイプの) 全ファイルシステムについて 使用量と使用可能量を表示する。 引き数が指定されている場合、 df は引き数 file が含まれるファイルシステムについて表示する。  
-h, --human-readable  それぞれのサイズに、 例えばメガバイトなら M のようなサイズ文字を付加する。 10 の累乗ではなく 2 の累乗を用いるので、 M は 1,048,576 バイトを表す。  

## tr
tr - 文字の変換・削除や、連続する文字の圧縮を行う。  
tr [オプション] 文字セット1 [文字セット2]  
-d	--delete	［文字セット1］に含まれる文字があったら削除する  
-s	--squeeze-repeats	［文字セット1］に含まれる文字が連続していたら1つにまとめる  
-t	--truncate-set1	［文字セット1］を［文字セット2］の長さに切り詰めてから処理を行う  
-c	--complement	［文字セット1］に含まれない文字全て（の補集合）を対象とする  


# Cpu load
## top
- [Linuxサーバー監視でのCPU使用率の計算方法](https://support.site24x7.com/portal/en/kb/articles/how-is-the-total-cpu-usage-calculated-for-a-linux-server-monitor)  
top は現在実行中のプロセスをCPU利用率が高い順に表示します。表示はリアルタイムで更新されていき、「q」を入力すると終了します。  
-n 回数	表示を繰り返す回数を指定する  
-b	バッチモード。キー操作を受け付けず、「-n」で指定された回数または「CTRL+C」などで強制終了（kill）されるまで実行を続ける。topの結果をファイルに保存する際などに役立つ  
  
CPU使用率 = 100 - アイドル時間（idle time）  
ex ... %Cpu(s): 12.5 us, 6.9 sy, 0.0 ni, 99.7 id, 0.3 wa, 0.0 hi, 0.0 si, 0.0 st
us : un-niced なユーザ空間プロセス (OS 上で動作するように作られたプログラム) が実行された時間のパーセンテージ  
sy : カーネル空間プロセス (OS としての機能を司るプログラム) が実行された時間のパーセンテージ  
ni : nice や renice 等により nice 値が変更されたユーザ空間プロセスが実行された時間のパーセンテージ (つまり、nice により狙い通りに優先的に動作しているかを確認することができる)  
id : idle 状態を過ごしたプロセスの時間のパーセンテージ  
wa : Disk IO が終わるのを待っているプロセスの実行時間のパーセンテージ  
hi : ハードウェア割込みの時間のパーセンテージ  
si : ソフトウェア割込みの時間のパーセンテージ  
st : ハイパーバイザに徴収された実行時間のパーセンテージ  
## sed
「sed」は「Stream EDitor」の略で、「sed スクリプトコマンド ファイル名」で、指定したファイルをコマンドに従って処理し、標準出力へ出力します。ファイル名を省略した場合は、標準入力からのデータを処理します。sedコマンドでは、パイプとリダイレクトを活用するのが一般的です。  
-e スクリプト	--expression=スクリプト  スクリプト（コマンド）を追加する,  指定したスクリプトで置換を行う


# Last boot
## last
「last」はシステムのログイン履歴を一覧表示するコマンドです。「/var/log/wtmp」ファイルを参照し、新しいログインから順に表示します。  
--time-format [format]
出力するタイムスタンプの書式を [format] にする。format は、notime, short, full, iso の内のどれかである。notime はタイムスタンプを全く表示せず、short はデフォルト、full は --fulltimes オプションと同じである。iso は ISO-8601 のフォーマットでタイムスタンプを表示する。ISO フォーマットは、タイムゾーンの情報を含んでいるので、 ログのプリントアウトがシステムの外部で調べられるときに、望ましい形式になる。  
- [ISO 8601](https://ja.wikipedia.org/wiki/ISO_8601)  
## head
ファイルの最初の部分を出力する  
各 FILE の先頭 10 行を標準出力に出力します。 FILE が 2 個以上指定された場合は ヘッダーとしてファイル名が内容の前に出力されます。ファイルの指定がない場合や FILE が - の場合, 標準入力から読み込みを行います。  
-n, --lines=,[-]NUM/  
先頭 10 行の代わりに各ファイルの先頭 NUM 行を表示する。 前に'-' がある場合、各ファイルの最後の NUM 行を除いた 全てを表示する


# LVM use
## test
- [UNIX & Linux コマンド・シェルスクリプト リファレンス if, test](https://shellscript.sunone.me/if_and_test.html)  
test [ expr ]  
test は条件式 expr を評価した結果によって、 0 (真) または 1 (偽) を終了ステータスとして返す。  
## command1 && command2 || command3
- [シェルスクリプトの三項演算子で注意するべきこと](https://qiita.com/kokorinosoba/items/2f95ffd897b8ba2fe0de)  

		if test $'(lvdisplay | grep available | wc -l)';then
			echo yes
		else
			echo no
		fi

## lvdisplay
lvdisplay は論理ボリュームの詳細な情報を表示するコマンドです。  
-a	--all	全ての論理ボリュームを表示する  
--segments	セグメントの情報を表示する  
-m	--maps	論理ボリュームとのマッピング情報を表示する  


# Connexions TCP
## ss
- [ssコマンドの使い方と表示の見方](https://monologu.com/usage-ss-command/)
ss は socket statistics の略で、netstatに替わる Linux標準のネットワークの状態確認コマンドです。  
> ソケット - プログラムとネットワークをつなげる接続口のこと  
-t	--tcp	TCPソケットを表示  
> State ... ESTAB（接続中）、LISTEN（接続待ち）  


# User log
## users
users [ファイル名]  
users はログイン中のユーザーを一覧表示するコマンドです。  
ファイルを指定しない場合、/var/run/utmp を読み込んでユーザー名を表示します。/var/log/wtmp ファイルを指定して、ユーザー名を表示することもできます。  


# Network: IP
- [IPv4とIPv6の違い8つとは？IPv4 over IPv6についても解説](https://www.fenet.jp/infla/column/network/ipv4%E3%81%A8ipv6%E3%81%AE%E9%81%95%E3%81%848%E3%81%A4%E3%81%A8%E3%81%AF%EF%BC%9Fipv4-over-ipv6%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6%E3%82%82%E8%A7%A3%E8%AA%AC/)  
## hostname
hostname は、システムのホスト名を表示するコマンドです。  
-I	--all-ip-addresses	全てのアドレスを表示する  

## ip
addr	a、address	ネットワークデバイスのIPアドレス  
- [Linux - MAC Addressを確認する](https://codechacha.com/ja/linux-mac-address/)


# Sudo


# wall
wall は、ログインしている全てのユーザーの「端末（ターミナル）」に一斉にメッセージを送信するコマンドです。

# echo
echo はメッセージなどを表示するコマンドです。「echo メッセージ」でメッセージを表示します。「echo $変数名」で環境変数やシェル変数を表示する際にも使用います。  
-n	最後の改行を出力しない  
-e	エスケープシーケンスを解釈する  
-E	エスケープシーケンスを解釈しない（デフォルト）  

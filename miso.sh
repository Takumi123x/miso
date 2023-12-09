tset=/data/tbm-set

#$e "\ec\e[37;00m\e[J";
#MARK(){ $e "\e[7m\e[3$(( $RANDOM * 6 / 32767 + 1 ))m";}
MARK(){ $e "\e[7m\e[30m";}
MARK2(){ $e "\e[7m\e[37m";}
UNMARK(){ $e "\e[27m";}
BLT(){ $e "\e[7m\e[0;30m";}

Absurd_point(){
imit=170
TPUT  7 $imit; $e "|";TPUT  8 $imit; $e "|";TPUT  9 $imit; $e "|";TPUT 10 $imit; $e "|";TPUT 11 $imit; $e "|";TPUT 12 $imit; $e "|";
TPUT 13 $imit; $e "|";TPUT 14 $imit; $e "|";TPUT 15 $imit; $e "|";TPUT 16 $imit; $e "|";TPUT 17 $imit; $e "|";TPUT 18 $imit; $e "|";
TPUT 19 $imit; $e "|";TPUT 20 $imit; $e "|";TPUT 21 $imit; $e "|";TPUT 22 $imit; $e "|";TPUT 23 $imit; $e "|";TPUT 24 $imit; $e "|";
TPUT 25 $imit; $e "|";TPUT 26 $imit; $e "|";TPUT 27 $imit; $e "|";TPUT 28 $imit; $e "|";TPUT 29 $imit; $e "|";TPUT 30 $imit; $e "|";
TPUT 31 $imit; $e "|";TPUT 32 $imit; $e "|";TPUT 33 $imit; $e "|";TPUT 34 $imit; $e "|";TPUT 35 $imit; $e "|";TPUT 36 $imit; $e "|";
TPUT 37 $imit; $e "|";TPUT 38 $imit; $e "|";TPUT 39 $imit; $e "|";
}

FCD(){
FakeOP=Absurd_point
$FakeOP
}

Fullscreen_force(){
TPUT 1 1; $E " "
}

ff=Fullscreen_force

About_case(){
Absurd_point;
MARK2;TPUT 47 45
           printf "ENTER - Select,NEXT                                                                  ";UNMARK
}

made_iso (){
clone_a (){
clear
dirf="$(echo "$(<~/miso/pc_ext.txt)")"
TPUT  6 1;ls -x $dirf
MARK2;TPUT 47 1;$e "	                        ";TPUT 47 1;$e "cmd:|select|back|exit|term:";read p;UNMARK;
case $p in
"")
echo "not select anything"
read -p " "
clone_a
;;
"exit")
clear
ARM-SW
;;
"select")
xorriso \
-x \
-rockridge on \
-find / -exec mkisofs_r -- \
-volid "CD_LABEL" \
-for_backup \
-joliet on \
-compliance "iso_9660_level=3:deep_paths:long_paths:long_names" \
-file_size_limit off -- \
-outdev "$(echo "$(<~/miso/pc_ext.txt)")".iso \
-blank as_needed \
-map "$(echo "$(<~/miso/pc_ext.txt)")" /
;;
*)
internal_path="$dirf"
if [ -e $dirf/$p ]
then
echo "$dirf/$p" > ~/miso/pc_ext.txt
clone_b
else
clone_a
fi
;;
esac
}

clone_b (){
clear
dirf="$(echo "$(<~/miso/pc_ext.txt)")"
TPUT  6 1;ls -x $dirf
MARK2;TPUT 47 1;$e "	                        ";TPUT 47 1;$e "cmd:|select|back|exit|term:";read p;UNMARK;
case $p in
"")
echo "not select anything"
read -p " "
clone_b
;;
"exit")
clear
ARM-SW
;;
"select")
xorriso \
-x \
-rockridge on \
-find / -exec mkisofs_r -- \
-volid "CD_LABEL" \
-for_backup \
-joliet on \
-compliance "iso_9660_level=3:deep_paths:long_paths:long_names" \
-file_size_limit off -- \
-outdev "$(echo "$(<~/miso/pc_ext.txt)")".iso \
-blank as_needed \
-map "$(echo "$(<~/miso/pc_ext.txt)")" /
;;
*)
internal_path="$dirf"
if [ -e $dirf/$p ]
then
echo "$dirf/$p" > ~/miso/pc_ext.txt
clone_b
else
clone_a
fi
;;
esac
}

dirf="/mnt/c"
$e "\ec\e[37;00m\e[J"
clear
TPUT  6 1;ls -x $dirf
MARK2;TPUT 47 1;$e "	                        ";TPUT 47 1;$e "cmd:|select|back|exit|term:";read p;UNMARK;
case $p in
"")
echo "not select anything"
read -p " "
Extract_browse
;;
"exit")
clear
ARM-SW
;;
"select")
xorriso \
-x \
-rockridge on \
-find / -exec mkisofs_r -- \
-volid "CD_LABEL" \
-for_backup \
-joliet on \
-compliance "iso_9660_level=3:deep_paths:long_paths:long_names" \
-file_size_limit off -- \
-outdev "$(echo "$(<~/miso/pc_ext.txt)")".iso \
-blank as_needed \
-map "$(echo "$(<~/miso/pc_ext.txt)")" /
;;
*)
internal_path="$dirf"
if [ -e $dirf/$p ]
then
echo "$dirf/$p" > ~/miso/pc_ext.txt
clone_b
else
clone_a
fi
;;
esac
}

extract_browse (){
Alone_a (){
clear
dirf="$(echo "$(<~/miso/pc_ext.txt)")"
TPUT  6 1;ls -x $dirf
MARK2;TPUT 47 1;$e "	                        ";TPUT 47 1;$e "cmd:|select|back|exit|term:";read p;UNMARK;
case $p in
"")
echo "not select anything"
read -p " "
Alone_a
;;
"exit")
clear
ARM-SW
;;
"select")
if [ -e "$(echo "$(<~/miso/pc_ext.txt)" | sed -e 's/\(.iso\)*$//g')".iso ]
then
cd ~
mkdir $internal_root/AP
7z x "$(echo "$(<~/miso/pc_ext.txt)" | sed -e 's/\(.iso\)*$//g')".iso -o$(echo "$(<~/miso/pc_ext.txt)" | sed -e 's/\(.iso\)*$//g')
fi
;;
*)
internal_path="$dirf"
if [ -e $dirf/$p ]
then
echo "$dirf/$p" > ~/miso/pc_ext.txt
Alone_b
else
Alone_a
fi
;;
esac
}

Alone_b (){
clear
dirf="$(echo "$(<~/miso/pc_ext.txt)")"
TPUT  6 1;ls -x $dirf
MARK2;TPUT 47 1;$e "	                        ";TPUT 47 1;$e "cmd:|select|back|exit|term:";read p;UNMARK;
case $p in
"")
echo "not select anything"
read -p " "
Alone_b
;;
"exit")
clear
ARM-SW
;;
"select")
if [ -e "$(echo "$(<~/miso/pc_ext.txt)" | sed -e 's/\(.iso\)*$//g')".iso ]
then
cd ~
mkdir $internal_root/AP
7z x "$(echo "$(<~/miso/pc_ext.txt)" | sed -e 's/\(.iso\)*$//g')".iso -o$(echo "$(<~/miso/pc_ext.txt)" | sed -e 's/\(.iso\)*$//g')
fi
;;
*)
internal_path="$dirf"
if [ -e $dirf/$p ]
then
echo "$dirf/$p" > ~/miso/pc_ext.txt
Alone_b
else
Alone_a
fi
;;
esac
}

dirf="/mnt/c"
$e "\ec\e[37;00m\e[J"
clear
TPUT  6 1;ls -x $dirf
MARK2;TPUT 47 1;$e "	                        ";TPUT 47 1;$e "cmd:|select|back|exit|term:";read p;UNMARK;
case $p in
"")
echo "not select anything"
read -p " "
Extract_browse
;;
"exit")
clear
ARM-SW
;;
"select")
if [ -e "$(echo "$(<~/miso/pc_ext.txt)" | sed -e 's/\(.iso\)*$//g')".iso ]
then
cd ~
mkdir $internal_root/AP
7z x "$(echo "$(<~/miso/pc_ext.txt)" | sed -e 's/\(.iso\)*$//g')".iso -o$(echo "$(<~/miso/pc_ext.txt)" | sed -e 's/\(.iso\)*$//g')
fi
;;
*)
internal_path="$dirf"
if [ -e $dirf/$p ]
then
echo "$dirf/$p" > ~/miso/pc_ext.txt
Alone_b
else
Alone_a
fi
;;
esac
}

ARM-SW (){
#Device info
clear
      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
      R(){ CLEAR ;stty sane;printf %b '\e[46m' '\e[8]' '\e[H\e[J';};
   HEAD(){ DRAW
           for each in $(seq 45 25);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 1
           $E " ";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 47 2
           printf "ENTER - SELECT,NEXT                      ";TPUT  2 2; $e "ISO MAKER                                ";UNMARK;MARK2;
TPUT   5 2; $e "╔Tool═══════════════════════════════════╗";
TPUT   6 2; $e "║                                       ║";
TPUT   7 2; $e "║                                       ║";
TPUT   8 2; $e "║                                       ║";
TPUT   9 2; $e "║                                       ║";
TPUT  10 2; $e "║                                       ║";
TPUT  11 2; $e "║                                       ║";
TPUT  12 2; $e "║                                       ║";
TPUT  13 2; $e "╚═══════════════════════════════════════╝";
TPUT   6 3; $e "ISO Maker GUI"
TPUT   7 3; $e "by TakuruKagami"
MARK;TPUT  14 3; $e "                                         ";TPUT  13 43; $e " ";TPUT  12 43; $e " ";TPUT  11 43; $e " ";TPUT  10 43; $e " ";TPUT  9 43; $e " ";TPUT  8 43; $e " ";TPUT  7 43; $e " ";TPUT  6 43; $e " ";UNMARK;}
   FOOT2(){ UNMARK;TPUT 3 45
   printf "$set_info";}
   
clear
super_info=" "
clear
MU_X=5

#Device info

  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT 16 $MU_X; $e "Extract ISO                     ";$ff;}
     M1(){ TPUT 18 $MU_X; $e "Make ISO                        ";$ff;}
     M2(){ TPUT 22 $MU_X; $e "Exit                            ";$ff;}
      LM=2
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ clear;set_info=$Case_universal;R;HEAD;FOOT2;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
   ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M0;SC;if [[ $cur == "" ]];then R;clear;extract_browse;INIT;fi;;
        1) S=M1;SC;if [[ $cur == "" ]];then R;clear;made_iso;INIT;fi;;
        2) S=M2;SC;if [[ $cur == "" ]];then R;clear;$e "\ec\e[37;00m\e[J";exit;fi;;
 esac;POS;done
}


ARM-SW

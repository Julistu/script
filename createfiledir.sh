#!/bin/bash
# simple script menu

read -p "当前媒体文件源目录为/home/stu/Videos/source，要修改请输入新路径：" path
if [ ! -n "$path" ] ;then
    path=/home/stu/Videos/source
else
    echo "新的源目录为：$path"
fi
    ABCpath="${path%/*}/按首字母"
    yearpath="${path%/*}/按年份"
    sortpath="${path%/*}/按类型"

echo "当前媒体文件源目录为$path"
echo "当前媒体文件首字母目录为$ABCpath"
echo "当前媒体文件年份目录为$yearpath"
echo "当前媒体文件类型目录为$sortpath"
read -p "按回车键继续。"

function createfiledirbyabc {
# clear
#path=/home/stu/Videos/按首字母
 if [ -d "$ABCpath" ]
 then
     echo "$ABCpath"
 else
     mkdir "$ABCpath"
 fi

 for dir in {A..Z};do
     mkdir "$ABCpath/$dir"
     echo "已新建文件夹$ABCpath/$dir"
 done
}
 
function createfiledirbyyear {
	#clear
	#path=/home/stu/Videos/按年份
	if [ -d "$yearpath" ]
	then
		echo "$yearpath"
	else
		mkdir "$yearpath"
	fi

	read -p "请输入要建立的起始年份：" startyear
	read -p "请输入要建立的截止年份：" stopyear
	while(($startyear<=$stopyear))
	do 
		filename="${startyear}年"
		mkdir "$yearpath/$filename"
		let "startyear++"
	done
}
 
function createfiledirbysort {
 #clear
	#path=/home/stu/Videos/按类型
	if [ -d "$sortpath" ]
	then
		echo "$sortpath"
	else
		mkdir "$sortpath"
	fi

	read -p "请输入要建立的分类：" newsort
	if [ -d "$sortpath/$newsort" ]
	then
		echo "已存在分类：$sortpath/$newsort"
	else
		mkdir "$sortpath/$newsort"
	fi
}
 
function menu {
# clear
 echo
 echo -e "\t\t分类整理新建文件夹\n"
 echo -e "\t1. 按首字母分类整理新建26个文件夹"
 echo -e "\t2. 按年份新建文件夹"
 echo -e "\t3. 按类型新建文件夹"
 echo -e "\t0. 退出目录\n\n"
 echo -en "\t\t请选择: "
 read -n 1 option
}
 
while [ 1 ]
do
 menu
 case $option in
 0)
 break ;;
 1)
 createfiledirbyabc ;;
 2)
 createfiledirbyyear ;;
 3)
 createfiledirbysort ;;
 *)
 #clear
 echo "对不起，按键错误" ;;
 esac
 echo -en "\n\n\t\t按任意键继续..."
 read -n 1 line
done
#clear

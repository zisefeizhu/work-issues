#!/bin/sh

function menu ()
{
 cat << EOF
---------------------------------------------
  |************Menu Gitlab CICD ************|
  |************By   zisefeizhu *************|
---------------------------------------------
`echo -e "\033[35m 1) 选择部署项目\033[0m"`
`echo -e "\033[35m 2) 选择部署分支\033[0m"`
`echo -e "\033[35m 3) 选择merge分支\033[0m"`
`echo -e "\033[35m 4) 退出\033[0m"`
EOF
read -p "input you num：" num1
case $num1 in
 1)
  echo "Select deployment project!!"
  deployment-project
  ;;
 2)
  echo "Welcome to admin!!"
  admin_menu
  ;;
 3)
  clear
  menu
  ;;
 4)
  exit 0
  ;;
 *)
  echo "Input Error ,Please again !!!"
  exit 1
  ;;
esac
}

function deployment-project ()
{
 cat << EOF
----------------------------------------
|***************PERSON****************|
----------------------------------------
`echo -e "\033[35m 1)Zhangsan\033[0m"`
`echo -e "\033[35m 2)Lisi\033[0m"`
`echo -e "\033[35m 3)Wangwu\033[0m"`
`echo -e "\033[35m 4)Back\033[0m"`
EOF
read -p "input you num：" num2
case $num2 in
 1)
  echo "Welcome to Zhangsan !!"
  person_menu
  ;;
 2)
  echo "Welcome to Lisi !!"
  person_menu
  ;;
 3)
  echo "Welcome to Wangwu !!"
  person_menu
  ;;
 4)
  clear
  menu
  ;;
 *)
  echo "the is Fail!!"
  person_menu
esac
}

function admin_menu ()
{
 cat << EOF
----------------------------------------
|***************ADMIN****************|
----------------------------------------
`echo -e "\033[35m 1)Admin\033[0m"`
`echo -e "\033[35m 2)Admin1\033[0m"`
`echo -e "\033[35m 3)Admin2\033[0m"`
`echo -e "\033[35m 4)Back\033[0m"`
EOF
read -p "input you num：" num3
case $num3 in
 1)
  echo "Welcome to Admin !!"
  admin_menu
  ;;
 2)
  echo "Welcome to Admin1 !!"
  admin_menu
  ;;
 3)
  echo "Welcome to Admin2 !!"
  admin_menu
  ;;
 4)
  clear
  menu
  ;;
 *)
  echo "the is Fail!!"
  admin_menu
esac
}
menu
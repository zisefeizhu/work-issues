#!/bin/bash
source /etc/profile
#定义邮件发送列表
maillist=(
  linkun@realibox.com
)
#发送邮件函数
send_mail(){
    SUBJECT="$1域名即将到期"
    if [ $2 -ge 0 ];then
        CONTENT="$1:此域名即将到期，剩余时间已不足$2天，请及时续期！"
        for mail in ${maillist[*]};do
            echo -e ""当前检测的域名:" $domain\n "剩余天数: " $days\n ${CONTENT} " | mail -s "${SUBJECT}" $mail
        done
    else
        day=$((-$2))
        CONTENT="$1:此域名已到期，已超出$day天，请及时续费！"
        for mail in ${maillist[*]};do
            echo -e "${CONTENT}" | mail -s "${SUBJECT}" $mail
        done
    fi
}
#检测mails命令是否存在，不存在则安装mail包
is_install_mail()
{
    which mail &> /dev/null
    if [ $? -ne 0 ];then
        yum install -y mail
    fi
}
is_install_mail
#定义需要被检测的域名列表
domainlist=(
  account.realibox.cn
  admin.realibox.cn
  studio.realibox.cn
  open.realibox.cn
  open-admin.realibox.cn
  www.realibox.cn
  www.realibox.com
  open.realibox.com
  studio.realibox.com
  asset.realibox.com
  image.realibox.com
  staging.asset.realibox.com
  vr.venucia.com.cn
  ed23d.admin.realibox.com
  studio.realibox.com
  realibox.dfpv.com.cn
  realibox.com
  studio.stage.realibox.com
  open.stage.realibox.com
  account.stage.realibox.com
)
#检测域名到期时间并通知
for domain in ${domainlist[*]};do
   echo "当前检测的域名：" $domain
    #取出域名过期时间
    end_time=$(echo | timeout 1 openssl s_client -servername $domain -connect $domain:443 2>/dev/null | openssl x509 -noout -enddate 2>/dev/null | awk -F '=' '{print $2}' )

    ([ $? -ne 0 ] || [[ $end_time == '' ]]) &&  exit 10
    end_times=`date -d "$end_time" +%s `
    tmp=`date -d today +"%Y-%m-%d %T"`
    current_times=`date -d "$tmp" +"%s"`

    let left_time=$end_times-$current_times
    hours=`expr $left_time / 3600`
    echo "剩余小时: " $hours

    #转换成时间戳
    #end_times=`date -d "$end_time" +%s `
    #以时间戳的形式显示当前时间
    #tmp=`date -d today +"%Y-%m-%d %T"`
    current_times=`date -d "$tmp" +"%s"`
    #域名到期剩余天数
    let left_time=$end_times-$current_times
    days=`expr $left_time / 86400`
    #days=`expr $left_time / 3600`
    echo "剩余天数: " $days
   if [ $days -lt 30 ]; then
       echo "https 证书有效期少于7天，存在风险"
       send_mail $domain $days
   elif [ $days -ge 366 ]; then
       echo "https 证书是无效的!"
       send_mail $domain $days
   fi
done
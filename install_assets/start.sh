#~/bin/bash
#这个脚本主要是加入了 classpath 的设置

export CLASSPATH=$CLASSPATH:`dirname $0`/../config/java
echo "classpath: " $CLASSPATH
jruby -S $1 $2 $3 $4

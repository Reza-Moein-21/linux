#!/bin/bash

echo "Extract maven"
sleep 1
tar -xvf *maven*.tar.gz -C /opt

echo "Extract tomcat ###########"
sleep 1
tar -xvf *tomcat*.tar.gz -C /opt

echo "Extract Eclipse"
sleep 1
tar -xvf *eclipse*.tar.gz -C /opt

echo "Extract Spring boot cli"
sleep 1
tar -xvf *spring*.tar.gz -C /opt

echo "Extract Intellij idea"
sleep 1
tar -xvf *idea*.tar.gz -C /opt

echo "Extract Oracle jdk 11"
sleep 1
tar -xvf *jdk-11*.tar.gz -C /opt

echo "Extract Wildfly"
sleep 1
tar -xvf *wildfly*.tar.gz -C /opt

echo "Extract gradle"
sleep 1
unzip *gradle*.zip -d /opt/

echo "Go to /opt"
sleep 1
cd /opt;

echo "Rename maven"
sleep 1
mv *maven* maven/

echo "Rename tomcat"
sleep 1
mv *tomcat* tomcat/

echo "Rename Eclipse"
sleep 1
mv *eclipse* eclipse-jee/

echo "Rename Spring boot cli"
sleep 1
mv *spring* spring/ 

echo "Rename Intellij idea"
sleep 1
mv *idea* idea/

echo "Rename Oracle jdk 11"
sleep 1
mv *jdk-11* jdk-11/

echo "Rename Wildfly"
sleep 1
mv *wildfly* wildfly/

echo "Rename gradle"
sleep 1
mv *gradle* gradle/
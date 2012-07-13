#!/bin/sh

#MAINCLASS="cruz.components.usecase1.Main3PrimitiveComponents"
#MAINCLASS="cruz.components.usecase1.Main4PrimitiveComponents"
#MAINCLASS="cruz.components.usecase1.Main5PrimitiveComponents"
MAINCLASS="cruz.components.usecase1.Main1Composite6PrimitiveComponents"
MAINCLASS="cruz.components.usecase3.TestingMain"
#MAINCLASS="cruz.components.usecase3.TestingMain2"
#MAINCLASS="cruz.components.usecase3.TwitterTestMain"
#MAINCLASS="cruz.components.usecase3.TwitterMain"
#MAINCLASS="cruz.components.usecase4.ServicesMain"

echo
echo --- Component Monitoring example ---------------------------------------------
echo ---
echo --- Running $MAINCLASS
echo ---

CLASSPATH=.
APP_HOME="/user/cruz/desktop/home/workspace/ComponentsExamples"
PROACTIVE="/user/cruz/desktop/home/git/programming"
#PROACTIVE="/user/cruz/desktop/home/workspace/ProActive-Component-Monitoring"
PAGCMSCRIPT="/user/cruz/desktop/home/workspace/PAGCMScript"

CLASSPATH=$CLASSPATH:$APP_HOME/bin
CLASSPATH=$CLASSPATH:$PROACTIVE/dist/lib/ProActive.jar
CLASSPATH=$CLASSPATH:$PROACTIVE/dist/lib/fractal.jar
#------- PAGCMScript
CLASSPATH=$CLASSPATH:$PAGCMSCRIPT/pagcmscript-1.0.jar
CLASSPATH=$CLASSPATH:$PAGCMSCRIPT/lib/fscript-2.1.2-SNAPSHOT.jar
CLASSPATH=$CLASSPATH:$PAGCMSCRIPT/lib/monolog-1.8.jar
CLASSPATH=$CLASSPATH:$PAGCMSCRIPT/lib/jta-1.1.jar
CLASSPATH=$CLASSPATH:$PAGCMSCRIPT/lib/antlr-3.1.1.jar
CLASSPATH=$CLASSPATH:$PAGCMSCRIPT/lib/google-collect-snapshot-20080530.jar

#CLASSPATH=$CLASSPATH:$APP_HOME/lib/twitter4j-core-2.1.4-SNAPSHOT.jar

##------ REST libraries (CXF)
#CLASSPATH=$CLASSPATH:$APP_HOME/lib/cxf-rest/cxf-2.3.0.jar
#CLASSPATH=$CLASSPATH:$APP_HOME/lib/cxf-rest/cxf-manifest.jar
#CLASSPATH=$CLASSPATH:$APP_HOME/lib/cxf-rest/jsr311-api-1.1.1.jar
#CLASSPATH=$CLASSPATH:$APP_HOME/lib/cxf-rest/geronimo-servlet_3.0_spec-1.0.jar
#CLASSPATH=$CLASSPATH:$APP_HOME/lib/cxf-rest/wsdl4j-1.6.2.jar
#CLASSPATH=$CLASSPATH:$APP_HOME/lib/cxf-rest/woodstox-core-asl-4.0.8.jar
#CLASSPATH=$CLASSPATH:$APP_HOME/lib/cxf-rest/commons-logging-1.1.1.jar
#CLASSPATH=$CLASSPATH:$APP_HOME/lib/cxf-rest/stax2-api-3.0.2.jar
##------ 
CLASSPATH=$CLASSPATH:$PROACTIVE/dist/lib/cxf-2.5.2.jar
#CLASSPATH=$CLASSPATH:$PROACTIVE/dist/lib/cxf-manifest.jar
CLASSPATH=$CLASSPATH:$PROACTIVE/dist/lib/jaxrs-api-2.0.1.GA.jar
#CLASSPATH=$CLASSPATH:$PROACTIVE/dist/lib/geronimo-servlet_3.0_spec-1.0.jar
#CLASSPATH=$CLASSPATH:$PROACTIVE/dist/lib/org.apache.servicemix.bundles.wsdl4j-1.6.1_1.jar
#CLASSPATH=$CLASSPATH:$APP_HOME/lib/cxf-rest/woodstox-core-asl-4.0.8.jar
CLASSPATH=$CLASSPATH:$PROACTIVE/dist-lib/commons-logging-1.1.1.jar
#CLASSPATH=$CLASSPATH:$APP_HOME/lib/cxf-rest/stax2-api-3.0.2.jar

for i in `ls $PROACTIVE/dist/lib/*.jar`;
do
   CLASSPATH=$CLASSPATH:$i
done

#for i in `ls $PROACTIVE/lib/*.jar`;
#do
#   CLASSPATH=$CLASSPATH:$i
#done

#for i in `ls $PROACTIVE/lib/ws-common/*.jar`;
#do
#   CLASSPATH=$CLASSPATH:$i
#done

#for i in `ls $PROACTIVE/lib/cxf/*.jar`;
#do
#   CLASSPATH=$CLASSPATH:$i
#done


#echo "CLASSPATH=$CLASSPATH"

workingDir=`dirname $0`

JAVACMD=$JAVA_HOME/bin/java"\
	 -cp $CLASSPATH \
	 -Dgcm.provider=org.objectweb.proactive.core.component.Fractive \
	 -Djava.security.manager \
	 -Djava.security.policy=${APP_HOME}/proactive.java.policy \
	 -Dlog4j.configuration=file:${APP_HOME}/proactive-log4j \
	 -Dproactive.future.ac=true \
	 -Dproactive.home=$PROACTIVE \
	 -Dos=unix"

$JAVACMD $MAINCLASS "$@"

echo
echo ---------------------------------------------------------
echo "Finished at" `date`
echo


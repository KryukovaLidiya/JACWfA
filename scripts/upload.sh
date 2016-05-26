#!/bin/bash
# This script uploads all nesessary files of the test suit on the target device.

DATA_DIR=$1
EXEC_DIR=$2

if [ -n "$EXEC_DIR" ]; then
	adb shell mkdir -p $EXEC_DIR
	echo "push: $MTTEST_PROJECT_ROOT/build/apk/$MTTEST_DEVICE_EXEC_NAME -> $EXEC_DIR/$MTTEST_DEVICE_EXEC_NAME"
	adb push $MTTEST_PROJECT_ROOT/build/apk/$MTTEST_DEVICE_EXEC_NAME $EXEC_DIR
	adb push $MTTEST_PROJECT_ROOT/build/native/android/ $EXEC_DIR/libs
fi

#push resources
adb shell mkdir -p $DATA_DIR/goldens
adb push $MTTEST_PROJECT_ROOT/cfg/goldens $DATA_DIR/goldens

adb shell mkdir -p $DATA_DIR/testsets
adb push $MTTEST_PROJECT_ROOT/cfg/testsets $DATA_DIR/testsets

adb shell mkdir -p $DATA_DIR/configs
adb push $MTTEST_PROJECT_ROOT/cfg/configs $DATA_DIR/configs

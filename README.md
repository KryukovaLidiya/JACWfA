# JACWfA

Java* Aplication Component Workload for Android*.
Java* ACW for Android* - the client Java workload powered by MTTest framework.

It targets multiple kernels widely used on mobile systems like Android:

++ ai          (artificial intelligence scenarios by libGdx AI library)
++ compression (compression scenarios)
++ dmath       (decimal math algorithms)
++ fmath       (float math algorithms)
++ html        (html parser by jsoup library)
++ image       (image processing by BoofCV library)
++ jni         (jni stress scenarios)
++ lphysics    (physics engine scenarios by jBullet)
++ pdf         (pdf tests)
++ sort        (various sort algorithms)
++ xphysics    (physics engine scenarios by jBox2D)

++ suite ALL [use -s option] masterset:all:     [ai compression dmath fmath html image jni lphysics pdf sort xphysics]

Java* ACW for Android* is based on xml configurations, to see micros (tests) in every kernel please go to:
Project_dir/cfg/

How to run Java* ACW for Android*:

User mode

- download and run JavaACW-<Version>.apk, use GUI to navigate
    install: adb install -r ./JavaACW-1.0.apk (uninstall old version first if error happened: adb uninstall com.intel.mttest.android )
    run:
        use GUI to startup application
        adb shell "am start -S -n com.intel.mttest.android/com.intel.mttest.android.StarterActivity -e autostart true -e -s masterset:all". See Developer mode for details

Developer mode

1. Goto the project folder

2. Setup Java* ACW for Android environment

2.1 Configure mttest.properties file to be able to build and run, see hints in the property file

2.2 Perform the next command to setup proxy (if necessary), needed to download external dependencies by ant:
    - export ANT_OPTS="-Dhttp.proxyHost=<your.host.addr> -Dhttp.proxyPort=<your.port>"

2.3 Use Android SDK Manager to download and install Android SDK with 'Android Support Library' and 'Android Support Repository'

3. Setup ANDROID_SERIAL to your device (e.g. expoert ANDROID_SERIAL=<your device serial>)

4. Build
    ./mttest.sh build -m [Java|Host|Device]
     *** to make build run faster you may want to give Java more memory, eg "export _JAVA_OPTIONS: -Xmx2g" before the build

5. Use mttest.sh - this is major script to use Java* ACW for Android*.
   Run './mttest.sh' for mttest.sh manual. MTTest supports several modes:
    - Java (run on JVM)
    - Device (run on Android device)
        a. command line mode (by dalvikvm)
        b. apk mode (as a standard Android application run by application manager)
    - Host (run on Linux by ART host)

6. Run from command line

    Parameters:

    All modes support unified parameters:
    -s [test1,group2,test3] 
        Allows to pick testing set. Example '-s masterset:all:html,masterset:all:ai:com.intel.JACW.ai.scArrive'.
        {masterset:all} by default. It links on ./cfg/testsets/ALL/all.xml

    -c [config file name]
        Defines duration of testing cycle.  Example [-c medium.xml].
        {medium.xml} by default. It links on ./cfg/configs/medium.xml

    -t [integer]; 
        Defines number of threads. Example [-t 2].
        {-t 1} by default.

    Run modes:

    mode Java)
        Command perform 4 runs on [32 / 64 bit] JVM with [-client / -server] options.
        ./mttest.sh run -m Java (run the whole workload)
        How to specify test. 
            - pass '-s' key, e.g. ./mttest.sh run -m Java -s masterset:all:html
            - it's possible to use multiply test definition, -s masterset:all:html,masterset:all:ai:com.intel.JACW.ai.scArrive

    mode Host)
        ./mtthet.sh run -m Host

    mode Device) 
        Install apk and run on the device
        ./mttest.sh run -m Device
            Direct VM invocation without application interface.
        ./mttest.sh run-android -m Device
            Start application with 'autostart' argument.

7. Look for resutls in ./results/date_stamp/

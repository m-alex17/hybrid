import analysis.ResourceInfo;
import manifest.Manifest;
import path.Path;
import soot.Scene;
import soot.SootClass;
import soot.jimple.infoflow.InfoflowConfiguration;
import soot.jimple.infoflow.android.InfoflowAndroidConfiguration;
import soot.jimple.infoflow.android.SetupApplication;
import soot.jimple.toolkits.callgraph.CallGraph;
import soot.options.Options;
import util.AndroidCallGraphFilter;
import util.AndroidUtil;
import util.Util;
import util.apktoolUtil;

import java.io.*;
import java.time.Duration;
import java.time.Instant;
import java.util.*;
import java.util.regex.Pattern;

public class Main {

    private final static String USER_HOME = System.getProperty("user.home");
    //    private static final String androidJar = USER_HOME + "\\Downloads\\Compressed\\android-platforms";
    private static final String androidJar = USER_HOME + "\\Downloads\\Compressed\\android-platforms-master";
//        static String apkPath = "F:\\mTPMS.apk"; //Sensor
//          static String apkPath = "F:\\DriSMo.apk";
//          static String apkPath = "F:\\com.drismo_17.apk";
//          static String apkPath = "F:\\Apps\\Top45\\Flipboard_4.2.91-b5216.apk";
//          static String apkPath = "F:\\Apps\\Top45\\Super-Bright-LED-Flashlight_1.0.8.apk";

//          static String apkPath = "F:\\CleanCalculator.apk";
//          static String apkPath = "F:\\DriSMo (2).apk";


//        static String apkPath = "F:\\skymap.apk";
//        static String apkPath = "F:\\net.sourceforge.opencamera_1.49.apk"; // Aceteon
//        static String apkPath = "F:\\Ushahidi.apk";
//        static String apkPath = "F:\\Fitbit.v2.29.apk";
//        static String apkPath = "F:\\Osmand.apk";
//        static String apkPath = "F:\\Osmand-rev-99ba127f50.apk";


//                  WAKELOCK

//    static String apkPath = "F:\\K9Mail-rev-57e55734c4.apk";
//    static String apkPath = "F:\\CallMeter-rev-4e9106ccf2.apk";
//    static String apkPath = "F:\\ConnectBot_rev_76c4f80e47.apk";
//    static String apkPath = "F:\\IRCCloud-rev-1ab8ba96f6.apk"; //WifiLock
//    static String apkPath = "F:\\Apps\\DroidLeaks\\Ushahidi-rev-9d0aa75b84.apk"; //gps buggy version
//    static String apkPath = "F:\\Apps\\DroidLeaks\\Ushahidi-rev-337b48f5f2.apk"; //gps reversion

//    static String apkPath = "F:\\Apps\\DroidLeaks\\OsmDroid-rev-f6a2e34592.apk"; //nothing
//    static String apkPath = "F:\\Apps\\DroidLeaks\\vLC_rev_14b18bc27f.apk"; //nothing
//    static String apkPath = "F:\\Apps\\DroidLeaks\\Open-GPSTracker-rev-8ac7905a5a.apk"; //nothing
//    static String apkPath = "F:\\Apps\\DroidLeaks\\K9Mail-rev-e6132286a0.apk"; //nothing
//    static String apkPath = "F:\\Apps\\DroidLeaks\\IRCCloud-rev-1ab8ba96f6.apk"; //wifiLock
//    static String apkPath = "F:\\Apps\\DroidLeaks\\ConnectBot_rev_76c4f80e47.apk"; //nothing
//    static String apkPath = "F:\\Apps\\DroidLeaks\\CallMeter-rev-10729ea13b.apk"; //crash
//    static String apkPath = "F:\\Apps\\DroidLeaks\\CSipSimple-rev-88d62bc951.apk"; //nothing


    static String apkPath = "F:\\Apps\\Sentinel\\org.thecongers.mtpms_2.apk"; // sensor
//        static String apkPath = "F:\\Apps\\Sentinel\\com.drismo_17.apk"; // sensor
//    static String apkPath = "F:\\Apps\\Sentinel\\eu.hydrologis.geopaparazzi_39.apk"; // Sensor
//    static String apkPath = "F:\\Apps\\Sentinel\\de.tui.itlogger_2.apk"; // ?
//    static String apkPath = "F:\\Apps\\Sentinel\\com.SecUpwN.AIMSICD_43.apk"; // sensor
//    static String apkPath = "F:\\Apps\\Sentinel\\ru.o2genum.coregame_3.apk"; // sensor


//    static String apkPath = "F:\\bikecomputer.apk"; //false positive gps release later import
//    static String apkPath = "F:\\openmaps_13.apk"; //


//    static String apkPath = "F:\\app-debug.apk";
//    static String apkPath = "F:\\sensroLeak.apk";
//    static String apkPath = "F:\\Stellarium_Mobile_PLUS_Star_Map_v1.7.6_Apktops.ir.apk";
//    static String apkPath = "F:\\HERE WeGo Maps Navigation.apk";
//    static String apkPath = "F:\\com.instagram.android.apk";
//    static String apkPath = "F:\\Google-Maps_11.15.4.apk";
//    static String apkPath = "F:\\Google-Maps-11.15.4(www.FarsRoid.com).apk";

//    static String apkPath = "F:\\Apps\\IMGdroid\\CameraView_apkpure.com.apk";
//    static String apkPath = "F:\\Apps\\IMGdroid\\com.clover.apk";
//    static String apkPath = "F:\\Apps\\IMGdroid\\com.GlideImageView_apkpure.com.apk";
//    static String apkPath = "F:\\Apps\\IMGdroid\\com.moez.QKSMS.apk";
//    static String apkPath = "F:\\Apps\\IMGdroid\\droid-comic-viewer.apk";
//    static String apkPath = "F:\\Apps\\IMGdroid\\document_iewer.apk";
//    static String apkPath = "F:\\Apps\\IMGdroid\\org.imagePicker_13.apk"; /* DisplayBrightness */

    public static SetupApplication app;


    public static Boolean pause = false;
    public static Boolean stop = false;
    public static Boolean destroy = false;


    public static List<String> activities = new ArrayList<>();
    public static List<SootClass> orderedActivities;


    public static HashSet<SootClass> validActivities = new HashSet<>();

    public static String resourceTestType = "";

    public static ResourceInfo resourceInfo = new ResourceInfo();
    public static AndroidCallGraphFilter androidCallGraphFilter;
    public static CallGraph cg;
    public static String packageName;

    public static void main(String[] args) throws FileNotFoundException {

//        SootConfig.androidPlatformLocation = androidJar;
//        SootConfig.apkFileLocation = apkPath;
//        CallGraph cg = SootConfig.initSoot();
        Instant startStatic = Instant.now();
// CODE HERE

        Util.getInstance().deleteTestFiles("sensorResult");
        Util.getInstance().deleteTestFiles("gpsResult");
        Util.getInstance().deleteTestFiles("javaioResult");
        Util.getInstance().deleteTestFiles("wakelockResult");
        Util.getInstance().deleteTestFiles("wifilockResult");
        Util.getInstance().deleteTestFiles("displayBrightnessResult");
        Util.getInstance().deleteTestFiles("displayTimeOutResult");

//        Thread thread = new Thread(() -> {
//            try {
//                apktoolUtil.main(new String[]{apkPath});
//            } catch (IOException | InterruptedException e) {
//                e.printStackTrace();
//            }
//        });
//
//        thread.start();

        //*****************APKTool****************************
        try {
            apktoolUtil.main(new String[]{apkPath});
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }


        orderedActivities = new ArrayList<>();
        List<Path> paths;
        List<String> resource = new ArrayList<>();
        resource.add("android.hardware.SensorManager");


        // initiate the Graph
        {
            InfoflowConfiguration.CallgraphAlgorithm cgAlgorithm = InfoflowConfiguration.CallgraphAlgorithm.CHA;
            final InfoflowAndroidConfiguration config = AndroidUtil.getFlowDroidConfig(apkPath, androidJar, cgAlgorithm);
            config.getAnalysisFileConfig().setAndroidPlatformDir(androidJar);
            config.setCodeEliminationMode(InfoflowConfiguration.CodeEliminationMode.NoCodeElimination);
            // todo optimization
//            config.setMemoryThreshold(1);
            config.setCallgraphAlgorithm(cgAlgorithm); // CHA or SPARK
            SetupApplication app = new SetupApplication(config);
            app.getConfig().setMergeDexFiles(true);
            soot.options.Options.v().set_whole_program(true);
            Options.v().set_no_writeout_body_releasing(true);
            app.constructCallgraph();
//            cg = Scene.v().getCallGraph();
//            cg = SootConfig.initSoot();

        }

        packageName = Manifest.getPackageName(apkPath);
        System.out.println("pacckageName: " + packageName);
        Manifest manifest = new Manifest();
        activities = manifest.getMainActivityName(apkPath);


//      Creating Activities we need to investigate
        {
            for (String s : activities) {

                if (s.startsWith(".")) {

                    s = packageName + s;
                    System.out.println("***" + s);
                }
                SootClass circleClasss = Scene.v().getSootClass(s);
                validActivities.add(circleClasss);
            }

            System.out.println(validActivities);

            androidCallGraphFilter = new AndroidCallGraphFilter(AndroidUtil.getPackageName(apkPath));
            for (SootClass sootClass : androidCallGraphFilter.getValidClasses()) {
                for (String s : activities) {
                    if (sootClass.getName().contains(s)) {
                        if (haveNumber(sootClass.getName()))
                            validActivities.add(sootClass);
                    }
                }

            }


            // union with all
            validActivities.addAll(androidCallGraphFilter.getActivityClasses(AndroidUtil.getPackageName(apkPath)));
            System.out.println(validActivities);
            int classIndex = 0;
            orderActivities(validActivities);
            for (SootClass sootClass : orderedActivities) {
                System.out.printf("Class %d: %s%n", ++classIndex, sootClass.getName());

            }
        }

        System.out.println("**********Beginning of Analysis**********");

        String rsrcType;
        List<String> lookingFor;

        resourceInfo.setResourceType("android.hardware.SensorManager");
        rsrcType = resourceInfo.getResourceType();
        setrsrInfo(rsrcType);
        lookingFor = resourceInfo.getAcquireMethod();


        System.out.println("**********Beginning of Analysis of Sensor**********");
        paths = Util.getInstance().doAnalysis(lookingFor, packageName, rsrcType, orderedActivities, resourceInfo);
        Util.getInstance().mapID(paths, resourceTestType, apkPath, androidCallGraphFilter);
        resourceInfo.clear();


//
        System.out.println(lookingFor + "******-" + resourceTestType);


        System.out.println("**********Beginning of Analysis of Sensor Update Rate**********");
        Util.getInstance().clearBeforeNewRound();
        resourceInfo.setResourceType("updateRate");
        rsrcType = resourceInfo.getResourceType();
        setrsrInfo(rsrcType);
        lookingFor = resourceInfo.getAcquireMethod();
        Util.getInstance().doFreqAnalysis(lookingFor, packageName, rsrcType, orderedActivities, resourceInfo, resourceTestType, apkPath, androidCallGraphFilter);
        resourceInfo.clear();
//
        System.out.println("**********Beginning of Analysis of GPS**********");
        Util.getInstance().clearBeforeNewRound();

        resourceInfo.setResourceType("android.location.LocationListener");
        rsrcType = resourceInfo.getResourceType();
        setrsrInfo(rsrcType);
        lookingFor = resourceInfo.getAcquireMethod();

        System.out.println("************");
        System.out.println(lookingFor + "******-" + resourceTestType);
        paths = Util.getInstance().doAnalysis(lookingFor, packageName, rsrcType, orderedActivities, resourceInfo);
        try {
            Util.getInstance().mapID(paths, resourceTestType, apkPath, androidCallGraphFilter);
            resourceInfo.clear();
        } catch (Exception e) {
            System.out.println(e);
        }
//
//
        System.out.println("**********Beginning of Analysis of WakeLock**********");
        resourceInfo.setResourceType("android.os.PowerManager.WakeLock");
        Util.getInstance().clearBeforeNewRound();

        System.out.println(lookingFor + "******-" + resourceTestType);
        rsrcType = resourceInfo.getResourceType();
        setrsrInfo(rsrcType);
        lookingFor = resourceInfo.getAcquireMethod();
        paths = Util.getInstance().doAnalysis(lookingFor, packageName, rsrcType, orderedActivities, resourceInfo);

        try {
            Util.getInstance().mapID(paths, resourceTestType, apkPath, androidCallGraphFilter);
            resourceInfo.clear();
        } catch (Exception e) {
            System.out.println(e);
        }
////
        System.out.println("**********Beginning of Analysis of WifiLock**********");
        resourceInfo.setResourceType("wifiLock");
        Util.getInstance().clearBeforeNewRound();

        rsrcType = resourceInfo.getResourceType();
        setrsrInfo(rsrcType);
        lookingFor = resourceInfo.getAcquireMethod();
//        paths.clear();
        paths = Util.getInstance().doAnalysis(lookingFor, packageName, rsrcType, orderedActivities, resourceInfo);
        try {
            Util.getInstance().mapID(paths, resourceTestType, apkPath, androidCallGraphFilter);
            resourceInfo.clear();
        } catch (Exception e) {
            System.out.println(e);
        }
////////
        System.out.println("**********Beginning of Analysis of displayTimeOut**********");
        resourceInfo.setResourceType("displayTimeOut");
        Util.getInstance().clearBeforeNewRound();

        rsrcType = resourceInfo.getResourceType();
        setrsrInfo(rsrcType);
        lookingFor = resourceInfo.getAcquireMethod();

        paths = Util.getInstance().doAnalysis(lookingFor, packageName, rsrcType, orderedActivities, resourceInfo);
        try {
            Util.getInstance().mapID(paths, resourceTestType, apkPath, androidCallGraphFilter);
            resourceInfo.clear();
        } catch (Exception e) {
            System.out.println(e);
        }
//////
        System.out.println("**********Beginning of Analysis of displayBrightness**********");
        resourceInfo.setResourceType("displayBrightness");
        Util.getInstance().clearBeforeNewRound();

        rsrcType = resourceInfo.getResourceType();
        setrsrInfo(rsrcType);
        lookingFor = resourceInfo.getAcquireMethod();

        paths = Util.getInstance().doAnalysis(lookingFor, packageName, rsrcType, orderedActivities, resourceInfo);
        try {
            Util.getInstance().mapID(paths, resourceTestType, apkPath, androidCallGraphFilter);
            resourceInfo.clear();
        } catch (Exception e) {
            System.out.println(e);
        }

//***************************************************************************//////////////////////////////////////


        Instant finishStatic = Instant.now();
        float timeElapsed = Duration.between(startStatic, finishStatic).toMillis();
        System.out.println("Time Elapsed at Static phase is:" + timeElapsed);
        System.out.print("Time Elapsed at Static phase is: ");
        System.out.printf("%.2f", (timeElapsed) / 1000);


        //***************************Phase TestCase***********************

//        {

//             1 start emulator; go to root mode 2 for each category run test, W8 to finish. break by testCaseFiltering
        System.out.println("**********Start of Testing**********");
        String pyPath = System.getProperty("user.dir") + "\\startEmulator.py";
        System.out.println("path is:****" + pyPath);
        System.out.println(Util.getInstance().getApkName(apkPath));
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("python", pyPath, apkPath);
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            process.waitFor();
            Reader reader = new InputStreamReader(process.getInputStream());
            new BufferedReader(new InputStreamReader(process.getErrorStream()));
            BufferedReader bf = new BufferedReader(reader);

            String s;
            while ((s = bf.readLine()) != null) {
                System.out.println(s);
                if (s.contains("Success")) break;
            }

            process.destroy();
        } catch (Exception e) {
            System.out.println(e);
        }
//
////            ********************************************************************************************************
        Instant startDynamic = Instant.now();
//
        pyPath = System.getProperty("user.dir") + "\\sensorTest.py";
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("python", pyPath, Util.getInstance().getApkName(apkPath));
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            process.waitFor();
            Reader reader = new InputStreamReader(process.getInputStream());
            new BufferedReader(new InputStreamReader(process.getErrorStream()));
            BufferedReader bf = new BufferedReader(reader);

            String s;
            while ((s = bf.readLine()) != null) {
                System.out.println(s);
                if (s.contains("Confirmed")) {
                    System.out.println("Sensor Leak is Confirmed for" + Util.getInstance().getApkName(apkPath));
                }
            }

            process.destroy();
        } catch (Exception e) {
            System.out.println(e);
        }

//
        pyPath = System.getProperty("user.dir") + "\\gpsTest.py";
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("python", pyPath, apkPath);
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            process.waitFor();
            Reader reader = new InputStreamReader(process.getInputStream());
            new BufferedReader(new InputStreamReader(process.getErrorStream()));
            BufferedReader bf = new BufferedReader(reader);

            String s;
            while ((s = bf.readLine()) != null) {
                System.out.println(s);
                if (s.contains("Confirmed")) {
                    System.out.println("GPS Leak is Confirmed for" + Util.getInstance().getApkName(apkPath));
                }
            }
            process.destroy();
        } catch (Exception e) {
            System.out.println(e);
        }

        pyPath = System.getProperty("user.dir") + "\\wakelockTest.py";
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("python", pyPath, apkPath);
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            process.waitFor();
            Reader reader = new InputStreamReader(process.getInputStream());
            new BufferedReader(new InputStreamReader(process.getErrorStream()));
            BufferedReader bf = new BufferedReader(reader);

            String s;
            while ((s = bf.readLine()) != null) {
                System.out.println(s);
                if (s.contains("Confirmed")) {
                    System.out.println("wakelock Leak is Confirmed for" + Util.getInstance().getApkName(apkPath));
                }
            }
            process.destroy();
        } catch (Exception e) {
            System.out.println(e);
        }

        pyPath = System.getProperty("user.dir") + "\\wifilockTest.py";
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("python", pyPath, apkPath);
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            process.waitFor();
            Reader reader = new InputStreamReader(process.getInputStream());
            new BufferedReader(new InputStreamReader(process.getErrorStream()));
            BufferedReader bf = new BufferedReader(reader);

            String s;
            while ((s = bf.readLine()) != null) {
                System.out.println(s);
                if (s.contains("Confirmed")) {
                    System.out.println("wifi Leak is Confirmed for" + Util.getInstance().getApkName(apkPath));
                }
            }
            process.destroy();
        } catch (Exception e) {
            System.out.println(e);
        }

        pyPath = System.getProperty("user.dir") + "\\updateRateTest.py";
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("python", pyPath, apkPath);
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            process.waitFor();
            Reader reader = new InputStreamReader(process.getInputStream());
            new BufferedReader(new InputStreamReader(process.getErrorStream()));
            BufferedReader bf = new BufferedReader(reader);

            String s;
            while ((s = bf.readLine()) != null) {
                System.out.println(s);
                if (s.contains("Confirmed")) {
                    System.out.println("Update rate Leak is Confirmed for" + Util.getInstance().getApkName(apkPath));
                }
            }
            process.destroy();
        } catch (Exception e) {
            System.out.println(e);
        }

        pyPath = System.getProperty("user.dir") + "\\displayTimeOutTest.py";
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("python", pyPath, apkPath);
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            process.waitFor();
            Reader reader = new InputStreamReader(process.getInputStream());
            new BufferedReader(new InputStreamReader(process.getErrorStream()));
            BufferedReader bf = new BufferedReader(reader);

            String s;
            while ((s = bf.readLine()) != null) {
                System.out.println(s);
                if (s.contains("Confirmed")) {
                    System.out.println("displayTimeOut Leak is Confirmed for" + Util.getInstance().getApkName(apkPath));
                }
            }
            process.destroy();
        } catch (Exception e) {
            System.out.println(e);
        }

        pyPath = System.getProperty("user.dir") + "\\displayBrightnessTest.py";
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("python", pyPath, apkPath);
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            process.waitFor();
            Reader reader = new InputStreamReader(process.getInputStream());
            new BufferedReader(new InputStreamReader(process.getErrorStream()));
            BufferedReader bf = new BufferedReader(reader);

            String s;
            while ((s = bf.readLine()) != null) {
                System.out.println(s);
                if (s.contains("Confirmed")) {
                    System.out.println("displayBrightness Leak is Confirmed for" + Util.getInstance().getApkName(apkPath));
                }
            }
            process.destroy();
        } catch (Exception e) {
            System.out.println(e);
        }

//        Instant finishDynamic = Instant.now();
//        timeElapsed = Duration.between(startDynamic, finishDynamic).toMillis();
//        System.out.println("Time Elapsed at Dynamic phase is:" +timeElapsed);
//        System.out.print("Time Elapsed at Dynamic phase is: ");
//        System.out.printf("%.2f", (timeElapsed)/1000);


    }


//**************************EndOfMain************************************************************************************
//    ***********************************************************************************************************************

    public static Boolean haveNumber(String msg) {
        String regex = "(.)*(\\d)(.)*";
        Pattern pattern = Pattern.compile(regex);
        return pattern.matcher(msg).matches();
    }

    public static void orderActivities(HashSet<SootClass> hashSet) {
        String temp;
        for (SootClass s : hashSet) {
            if (!s.getName().contains("$")) {
                orderedActivities.add(s);
                temp = s.getName();
                System.out.println("***temp" + temp);
                for (SootClass s1 : hashSet) {
                    if (s1.getName().contains("$")) {
                        if (temp.equals(s1.getName().substring(0, s1.getName().lastIndexOf("$")))) {
                            System.out.println("----" + s1.getName());
                            orderedActivities.add(s1);
                        }
                    }
                }
            }
        }

    }

    public static void setrsrInfo(String rsrcType) {
        switch (rsrcType) {
            case "android.hardware.SensorManager":

                resourceInfo.setAcquireMethod("<android.hardware.SensorManager: boolean registerListener(android.hardware.SensorEventListener,android.hardware.Sensor,int)>");
                resourceInfo.setAcquireMethod("<android.hardware.SensorManager: boolean registerListener(android.hardware.SensorEventListener,android.hardware.Sensor,int)>");
                resourceInfo.setReleaseMethod("<android.hardware.SensorManager: void unregisterListener(android.hardware.SensorEventListener)>");
                resourceTestType = "sensorResult";
                break;

            case "updateRate":
                resourceInfo.setAcquireMethod("<android.hardware.SensorManager: boolean registerListener(android.hardware.SensorEventListener,android.hardware.Sensor,int)>");
                resourceInfo.setAcquireMethod("<android.hardware.SensorManager: boolean registerListener(android.hardware.SensorEventListener,android.hardware.Sensor,int)>");
                resourceInfo.setReleaseMethod("<android.hardware.SensorManager: void unregisterListener(android.hardware.SensorEventListener)>");
                resourceTestType = "freqResult";
                break;

            case "android.os.PowerManager.WakeLock":
                resourceInfo.setAcquireMethod("<android.os.PowerManager$WakeLock: void acquire>");
                resourceInfo.setAcquireMethod("android.os.PowerManager$WakeLock: void acquire");
                resourceInfo.setAcquireMethod("<android.os.PowerManager$WakeLock: void acquire(long)>");
                resourceInfo.setReleaseMethod("<android.os.PowerManager$WakeLock: void release()>");
                resourceTestType = "wakelockResult";
                break;

            case "android.location.LocationListener":
                System.out.println();
                resourceInfo.setAcquireMethod("<android.location.LocationManager: void requestLocationUpdates(java.lang.String,long,float,android.location.LocationListener)>");
                resourceInfo.setReleaseMethod("<android.location.LocationManager: void removeUpdates(android.location.LocationListener)>");
                resourceTestType = "gpsResult";
                break;
            case "displayBrightness":
                System.out.println();
                resourceInfo.setAcquireMethod("screen_brightness");
                // resourceInfo.setReleaseMethod("<android.hardware.SensorManager: void unregisterListener(android.hardware.SensorEventListener)>");
                resourceTestType = "displayBrightnessResult";
                break;
            case "displayTimeOut":
                System.out.println();
                resourceInfo.setAcquireMethod("screen_off_timeout");
                // resourceInfo.setReleaseMethod("<android.hardware.SensorManager: void unregisterListener(android.hardware.SensorEventListener)>");
                resourceTestType = "displayTimeOutResult";
                break;
            case "wifiLock":
                resourceInfo.setAcquireMethod("<android.net.wifi.WifiManager$WifiLock: void acquire()>");
                resourceInfo.setReleaseMethod("<android.net.wifi.WifiManager$WifiLock: void release()>");
                resourceTestType = "wifilockResult";
                break;

        }
    }

}

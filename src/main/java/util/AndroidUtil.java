package util;

import org.xmlpull.v1.XmlPullParserException;
import soot.Scene;
import soot.SootClass;
import soot.SootMethod;
import soot.jimple.infoflow.InfoflowConfiguration;
import soot.jimple.infoflow.android.InfoflowAndroidConfiguration;
import soot.jimple.infoflow.android.axml.AXmlNode;
import soot.jimple.infoflow.android.manifest.ProcessManifest;

import java.io.IOException;
import java.util.*;

public class AndroidUtil {


    public static String getPackageName(String apkPath) {
        String packageName = "";
        try {
            ProcessManifest manifest = new ProcessManifest(apkPath);
            packageName = manifest.getPackageName();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (XmlPullParserException e) {
            e.printStackTrace();
        }
        return packageName;
    }

    public static ArrayList<AXmlNode> getListOfActivities(String apkPath) {
        ArrayList<AXmlNode> activityName = null;
        try {
            ProcessManifest manifest = new ProcessManifest(apkPath);
            activityName = manifest.getAllActivities();

        } catch (IOException e) {
            e.printStackTrace();
        } catch (XmlPullParserException e) {
            e.printStackTrace();
        }
        return activityName;
    }


    public static boolean isAndroidMethod(SootMethod sootMethod) {
        String clsSig = sootMethod.getDeclaringClass().getName();
        List<String> androidPrefixPkgNames = Arrays.asList("android.", "com.google.android", "androidx.");
        return androidPrefixPkgNames.stream().map(clsSig::startsWith).reduce(false, (res, curr) -> res || curr);
    }

    public static InfoflowAndroidConfiguration getFlowDroidConfig(String apkPath, String androidJar) {
        return getFlowDroidConfig(apkPath, androidJar, InfoflowConfiguration.CallgraphAlgorithm.SPARK);
    }

    public static InfoflowAndroidConfiguration getFlowDroidConfig(String apkPath, String androidJar, InfoflowConfiguration.CallgraphAlgorithm cgAlgorithm) {
        final InfoflowAndroidConfiguration config = new InfoflowAndroidConfiguration();
        config.getAnalysisFileConfig().setTargetAPKFile(apkPath);
        config.getAnalysisFileConfig().setAndroidPlatformDir(androidJar);
        config.setCodeEliminationMode(InfoflowConfiguration.CodeEliminationMode.NoCodeElimination);
        config.setEnableReflection(true);
        config.setMergeDexFiles(true);

        config.setFlowSensitiveAliasing(true);
        config.setAliasingAlgorithm(InfoflowConfiguration.AliasingAlgorithm.FlowSensitive);
//        config.setImplicitFlowMode(InfoflowConfiguration.ImplicitFlowMode.AllImplicitFlows);
//        config.getAccessPathConfiguration().setAccessPathLength(20);
//        config.getPathConfiguration().setMaxPathLength(20);
        config.getPathConfiguration().setPathBuildingAlgorithm(InfoflowConfiguration.PathBuildingAlgorithm.ContextSensitive);
        config.getPathConfiguration().setPathReconstructionMode(InfoflowConfiguration.PathReconstructionMode.Fast);

        config.setCallgraphAlgorithm(cgAlgorithm);
        return config;
    }


}
package util;

import soot.Scene;
import soot.SootClass;
import soot.SootMethod;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AndroidCallGraphFilter implements CallGraphFilter {

    private Map<String, String> extendedActivities = new HashMap<>();

    public List<SootClass> getValidClasses() {
        return validClasses;
    }

    private List<SootClass> validClasses = new ArrayList<>();
    private List<SootClass> extendedClasses = new ArrayList<>();

    public AndroidCallGraphFilter(String appPackageName) {
        for (SootClass sootClass : Scene.v().getApplicationClasses()) {
            if (!sootClass.getName().contains(appPackageName))
                continue;
            if (sootClass.getName().contains(appPackageName + ".R") || sootClass.getName().contains(appPackageName + ".BuildConfig"))
                continue;

            validClasses.add(sootClass);
        }
    }

    private boolean isValidMethod(SootMethod sootMethod) {
        if (AndroidUtil.isAndroidMethod(sootMethod))
            return false;
        if (sootMethod.getDeclaringClass().getPackageName().startsWith("java"))
            return false;
        if (sootMethod.toString().contains("<init>") || sootMethod.toString().contains("<clinit>"))
            return false;
        if (sootMethod.getName().equals("dummyMainMethod"))
            return false;
        return true;
    }

    @Override
    public boolean isValidEdge(soot.jimple.toolkits.callgraph.Edge sEdge) {
        if (!sEdge.src().getDeclaringClass().isApplicationClass())// || sEdge.tgt().getDeclaringClass().isApplicationClass())
            return false;
        if (!isValidMethod(sEdge.src()) || !isValidMethod(sEdge.tgt()))
            return false;
        boolean flag = validClasses.contains(sEdge.src().getDeclaringClass());
        flag |= validClasses.contains(sEdge.tgt().getDeclaringClass());
        return flag;
    }

    public List<SootClass> getActivityClasses(String appPackageName) {
        for (SootClass sootClass : Scene.v().getApplicationClasses()) {
            if (!sootClass.getName().contains(appPackageName))
                continue;
            if (sootClass.getName().contains(appPackageName + ".R") || sootClass.getName().contains(appPackageName + ".BuildConfig"))
                continue;
            if (sootClass.hasSuperclass()) {

                if (sootClass.getSuperclassUnsafe().toString().contains("android.app.Activity") ||
                        sootClass.getSuperclassUnsafe().toString().contains("BaseActivity")) {
                    extendedClasses.add(sootClass);
                }
            }

        }
        return extendedClasses;
    }


    public Map<String, String> getExtendedActivities(String appPackageName) {
        List<String> temp = new ArrayList<>();
        for (SootClass sootClass : Scene.v().getApplicationClasses()) {
            if (!sootClass.getName().contains(appPackageName))
                continue;
            if (sootClass.getName().contains(appPackageName + ".R") || sootClass.getName().contains(appPackageName + ".BuildConfig"))
                continue;
            if (sootClass.hasSuperclass()) {

                if (sootClass.getSuperclassUnsafe().toString().contains("android.app.Activity") ||
                        sootClass.getSuperclassUnsafe().toString().contains("BaseActivity")) {
                    temp.add(sootClass.toString());

                }
            }

        }
        for (SootClass sootClass : Scene.v().getApplicationClasses()) {
            if (!sootClass.getName().contains(appPackageName))
                continue;
            if (sootClass.getName().contains(appPackageName + ".R") || sootClass.getName().contains(appPackageName + ".BuildConfig"))
                continue;
            if (sootClass.hasSuperclass()) {
                for (String string : temp) {
                    if (string.equals(sootClass.getSuperclassUnsafe().toString())) {

                        extendedActivities.put(sootClass.toString(), sootClass.getSuperclassUnsafe().toString());

                    }
                }
            }
        }
        return extendedActivities;
    }

}
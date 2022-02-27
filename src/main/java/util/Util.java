package util;

import LoopHandler.Loop;
import LoopHandler.LoopFinder;
import analysis.ResourceInfo;
import path.Path;
import soot.*;
import soot.jimple.*;
import soot.jimple.toolkits.callgraph.CallGraph;
import soot.jimple.toolkits.callgraph.Targets;
import soot.toolkits.graph.ExceptionalUnitGraph;
import soot.toolkits.graph.UnitGraph;

import java.io.*;
import java.nio.file.FileSystems;
import java.util.*;
import java.util.regex.Pattern;

public class Util {

    private static Util instance;

    public static HashMap<String, Boolean> visited = new HashMap<>();
    public static HashMap<String, Boolean> visitedRel = new HashMap<>();
    public static HashMap<String, Integer> mapRegisterToID = new HashMap<>();
    public static HashMap<String, String> mapRegisterToClsNum = new HashMap<>();

    static Queue<SootMethod> qOfMethods = new LinkedList<>();

    public HashMap<String, Integer> getMapRegisterToID() {
        return mapRegisterToID;
    }

    public HashMap<String, String> getMapRegisterToClsNum() {
        return mapRegisterToClsNum;
    }

    static Queue<String> qOfRegisters = new LinkedList<String>();


    public static Util getInstance() throws FileNotFoundException {
        if (instance == null) {
            instance = new Util();

        }
        return instance;
    }


    public static void getMethodName(SootMethod sm) {
        Body body = sm.retrieveActiveBody();
        UnitGraph unitGraph = new ExceptionalUnitGraph(body);
        Iterator<Unit> iter = body.getUnits().snapshotIterator();

        while (iter.hasNext()) {
            final Unit unit = iter.next();
            Stmt stmt = (Stmt) unit;

            if ((stmt instanceof InvokeStmt || stmt instanceof AssignStmt)
                    && stmt.containsInvokeExpr()) {
                SootMethod sd = stmt.getInvokeExpr().getMethod();
                String methodName = sd.getName();
                String declaringClass = sd.getDeclaringClass().getName();
            }

        }
    }


    public void temp(SootMethod sm) {
        LoopFinder l = new LoopFinder();
        try {
            Set<Loop> res = l.getLoops(sm.retrieveActiveBody());
            for (Loop loop : res) {
                Stmt targ = loop.getBackJumpStmt();
                sm.getActiveBody().getUnits().remove(targ);
            }
        } catch (Exception e) {
            System.out.println("Exception in tempLoop");
            System.out.println(e);

        }


    }

    public static Value getLeftOP(Unit unit) {
        Value leftop = null;
        Stmt stmt = (Stmt) unit;
        if (stmt instanceof AssignStmt) {
            leftop = ((AssignStmt) stmt).getLeftOp();
        } else if (stmt instanceof IdentityStmt) {
            leftop = ((IdentityStmt) stmt).getLeftOp();
        } else if (stmt instanceof InvokeStmt) {
            List<ValueBox> ValueBoxList = unit.getUseAndDefBoxes();
            if (ValueBoxList.size() > 2) {
                leftop = ValueBoxList.get(ValueBoxList.size() - 2).getValue();
            }
        }
        return leftop;
    }

    public static void getAllMethos(List<SootMethod> list1, CallGraph cg) {
        List<SootMethod> temp = new ArrayList<SootMethod>();
        for (int i = 0; i < list1.size(); i++) {
            Iterator<MethodOrMethodContext> iterator = new Targets(cg.edgesOutOf(list1.get(i)));
            while (iterator.hasNext()) {
                SootMethod sMethod = (SootMethod) iterator.next();
                if (!sMethod.getSignature().startsWith("<android") && !sMethod.getSignature().startsWith("<java")
                        && !sMethod.getSignature().contains("<init>"))
                    temp.add(sMethod);

            }
        }
        try {
            if (!temp.isEmpty()) {
                getAllMethos(temp, cg);
            }
        } catch (Exception e) {
        }

    }

//    public boolean judegValueIsIdStmt(Body body, Value value) {
//        for (Unit unit : body.getUnits()) {
//            Stmt stmt = (Stmt) unit;
//            if (stmt instanceof IdentityStmt) {
//                Value leftValue = getLeftOP(unit);
//                if (leftValue.equals(value)) {
//                    return true;
//                }
//            }
//        }
//        return false;
//    }

    public static String getShortActivityName(String sourceString) {
        return removeDot(getPackageActivityName(sourceString));
    }

    public static String getPackageActivityName(String sourceString) {
        String tgtClass;
        String[] strings = sourceString.split(" ");
        if (strings.length > 1) {
            tgtClass = strings[1];
            if (sourceString.contains("\""))
                tgtClass = tgtClass.substring(tgtClass.indexOf("\""), tgtClass.lastIndexOf("\""));
            if (sourceString.contains("/"))
                tgtClass = tgtClass.replaceAll("/", ".");
//			String[] strings2 = tgtClass.split("/");
//			tgtClass = strings2[strings2.length-1];
        } else {
            tgtClass = strings[0];
        }
        return tgtClass;
    }

    public static String removeQuot(String s) {
        StringTokenizer st = new StringTokenizer(s, "\"");
        while (st.hasMoreTokens()) {
            s = st.nextToken();
        }
        return s;
    }

    public static String removeDot(String s) {
        StringTokenizer st = new StringTokenizer(s, ".");
        while (st.hasMoreTokens()) {
            s = st.nextToken();
        }
        return s;
    }

    public boolean checkVisitedMethod(String method) {

        for (Map.Entry<String, Boolean> entry : visited.entrySet()) {
            String key = entry.getKey();
            if (method.equals(key)) {
                return true;
            }
        }

        return false;
    }

    private boolean checkForAqc(String methodSignature) {
        for (Map.Entry<String, Boolean> entry : visited.entrySet()) {
            String key = entry.getKey();

            if (methodSignature.equals(key)) {
                if (entry.getValue()) {
                    return true;
                } else {
                    return false;
                }
            }
        }

        return false;
    }

    public boolean checkMethod(SootMethod method, List<String> lookingFor, String packageName) {

        if (checkVisitedMethod(method.getSignature())) {
            return checkForAqc(method.getSignature());
        }

        temp(method);
        int index = 50;

        Local thisLocal = null;
        String identifier = method.getSignature();
        System.out.println("My method Name is " + identifier);

        if (identifier.contains("leakcanary"))
            return false;
        if (identifier.contains("void <init>"))
            return false;

        if (smo(lookingFor, identifier, method, packageName)) return true;

        while (index != 0 && !qOfMethods.isEmpty()) {
            System.out.println(qOfMethods.size() + "q size");
            SootMethod removable = qOfMethods.remove();
            index = index - 1;

            if (removable.isPhantom()) continue;

            temp(removable);
            identifier = removable.getSignature();

            if (smo(lookingFor, identifier, removable, packageName)) return true;

        }

        return false;
    }

    public boolean checkConstructorSpecialinvoke(Stmt stmt) {

        if (!stmt.toString().contains("(android.view.Menu)")) {
            if (!stmt.toString().contains("void onCreate(android.os.Bundle)")) {
                if (!stmt.toString().contains("android.content.Intent")) {

                    if (stmt.toString().contains("void <init>")) {

                        return true;
                    }
                }
            }
        }

        return false;
    }

    public boolean checkStaticinvoke(Stmt stmt, String packageName) {
        String temp = "";
        if (stmt.toString().contains("staticinvoke")) {
            if (!stmt.toString().contains("if")) {
                temp = stmt.toString();
                if (temp.contains(packageName)) {
                    if (!temp.contains("java.lang.Runnable"))
                        System.out.println(temp + "****staticinvoke");
                    return true;
                }

                temp = temp.substring(temp.indexOf("staticinvoke") + 14);
                if (!temp.startsWith("android") & !temp.startsWith("java")) {
                    if (!temp.contains("java.lang.Runnable"))
                        return true;
                }
            }


        }

        return false;
    }

    public boolean checkHasService(Stmt stmt) {
        return stmt.toString().contains("android.content.Intent,android.content.ServiceConnection");
    }

    public String getServiceClass(Unit[] c) {
        Stmt stmt;
        for (int i = 0; i < c.length; i++) {
            stmt = (Stmt) c[i];

            if (stmt.toString().contains("<android.content.Intent:")) {

                if (stmt.toString().contains("(r0, class")) {
                    System.out.println(stmt.toString() + "777");
                    String temp = stmt.toString();
                    System.out.println(temp.substring(temp.lastIndexOf("L") + 1, temp.lastIndexOf(";")));
                    temp = temp.substring(temp.lastIndexOf("L") + 1, temp.lastIndexOf(";"));
                    temp = temp.replaceAll("/", ".");
                    return temp;
                }
            }
        }
        return "null";
    }

    public List<SootMethod> checkServiceBody(SootClass sootClass) {
        List<SootMethod> sootMethods = new ArrayList<>();
        for (SootMethod sootMethod : sootClass.getMethods()) {
            sootMethods.add(sootMethod);
        }
        return sootMethods;

    }


    private boolean smo(List<String> lookingFor, String identifier, SootMethod removable, String packageName) {


        List<Stmt> arrayOfMethodsToAdd = new ArrayList<>();

        if (removable.hasActiveBody()) {
            try {

                System.out.println("****************************smoCheckMethod************" + removable.getSignature());
                JimpleBody body = (JimpleBody) removable.retrieveActiveBody();


                Stmt stmt = null;
                Unit[] c = null;
                int ind = 0;
                int d = body.getUnits().size();
                c = new Unit[d];

                for (Unit u : body.getUnits()) {
                    c[ind] = u;
                    ind++;

                }

                for (int i = 0; i < c.length; i++) {
                    stmt = (Stmt) c[i];
                    System.out.println(stmt);

                    if (getId(stmt)) {
                        System.out.println("-*/" + getLeftOP(c[i + 1]));
                        mapRegisterToID.put(getLeftOP(c[i + 1]).toString(), Integer.parseInt(qOfRegisters.remove()));
                    }

                    if (stmt.toString().contains("(r0")) {

                        System.out.println("***********************Contans R0");
                        String strStmt = stmt.toString();
                        System.out.println(strStmt.substring(strStmt.indexOf("<") + 1, strStmt.indexOf(":")));

                        Stmt temStmt = (Stmt) c[i + 1];
                        if (temStmt.toString().contains("setOnClickListener")) {

                            String[] arr = temStmt.toString().split("\\.");
                            String tem = Arrays.toString(arr).split(" ")[1];
                            System.out.println(tem.replace(",", ""));
                            System.out.println("**********above is mapRegisterToClsNum");

                            mapRegisterToClsNum.put(strStmt.substring(strStmt.indexOf("<") + 1, strStmt.indexOf(":")), tem.replace(",", ""));
                        }

                    }


                    for (String str : lookingFor) {
                        if (stmt.toString().contains(str)) {
                            System.out.println("im in check for looking!");
                            visited.put(identifier, true);
                            return true;
                        }

                    }
                    if (checkConstructorSpecialinvoke(stmt)) {
                        try {
                            SootClass circleClass = stmt.getInvokeExpr().getMethod().getDeclaringClass();
                            SootMethod mspecial = circleClass.getMethodByName(stmt.getInvokeExpr().getMethod().getName());
                            arrayOfMethodsToAdd.add(stmt);

                            if (!qOfMethods.contains(mspecial)) {
                                qOfMethods.add(mspecial);
                            }
                        } catch (Exception exception) {
                            System.out.println("Th method  is overloaded and Soot cannot retrieve it by name" + exception.toString());
                        }

                    }


                    if (checkStaticinvoke(stmt, packageName)) {
                        System.out.println("in static");
                        SootClass circleClass = stmt.getInvokeExpr().getMethod().getDeclaringClass();
                        SootMethod metod = circleClass.getMethodByName(stmt.getInvokeExpr().getMethod().getName());
                        try {
                            if (!qOfMethods.contains(metod)) {
                                qOfMethods.add(metod);
                            }
                        } catch (Exception exception) {
                            System.out.println("Th method  is overloaded and Soot cannot retrieve it by name");
                        }
                    }

                    if (checkHasService(stmt)) {
                        if (!getServiceClass(c).equals("null")) {
                            SootClass servClass = Scene.v().getSootClass(getServiceClass(c));
                            for (SootMethod sootMethod : checkServiceBody(servClass))
                                if (smo(lookingFor, identifier, sootMethod, packageName)) {
                                    return true;
                                }
                        }
                    }


                    if (stmt instanceof InvokeStmt) {
                        InvokeStmt invokeStmt = (InvokeStmt) stmt;
                        if (invokeStmt.getInvokeExpr() instanceof VirtualInvokeExpr) {
                            VirtualInvokeExpr virtualInvokeExpr = (VirtualInvokeExpr) invokeStmt.getInvokeExpr();

                            if (virtualInvokeExpr.getMethod().getDeclaringClass().getName().startsWith("java"))
                                continue;
                            if (virtualInvokeExpr.getMethod().getDeclaringClass().getName().startsWith("android"))
                                continue;
                            if (stmt.getInvokeExpr().getMethod().getName().startsWith("<init>"))
                                continue;

                            try {
                                SootClass circleClass = stmt.getInvokeExpr().getMethod().getDeclaringClass();
                                SootMethod metod = circleClass.getMethodByName(stmt.getInvokeExpr().getMethod().getName());

                                if (checkVisitedMethod(metod.getSignature())) {
                                    if (checkForAqc(metod.getSignature())) {
                                        System.out.println(metod.getSignature());
                                        System.out.println("True in InvokeStmt");
                                        return true;
                                    }
                                }

                                if (!qOfMethods.contains(metod)) {
                                    qOfMethods.add(metod);
                                }

                            } catch (Exception exception) {
                                System.out.println("Th method  is overloaded and Soot cannot retrieve it by name");
                            }


                        }

                    }

                    if (stmt.toString().contains("specialinvoke")) {
                        System.out.println("in spesinovek innnn");
                        if (!stmt.toString().contains("(android.view.Menu)")) {
                            if (!stmt.toString().contains("void onCreate(android.os.Bundle)")) {

                                if (!stmt.toString().contains("void <init>")) {

                                    if (!stmt.toString().contains("void onCreate(android.os.Bundle)")) {
                                        System.out.println("*********specialinvoke*");

                                        try {
//                                SootClass circleClass = stmt.getInvokeExpr().getMethod().getDeclaringClass();
                                            SootClass circleClass = stmt.getInvokeExpr().getMethod().getDeclaringClass();
                                            SootMethod metod = circleClass.getMethodByName(stmt.getInvokeExpr().getMethod().getName());

                                            if (checkVisitedMethod(metod.getSignature())) {
                                                if (checkForAqc(metod.getSignature())) {
                                                    System.out.println(metod.getSignature());
                                                    System.out.println("True in specialInvoke");
                                                    return true;
                                                }
                                            }

                                            if (!qOfMethods.contains(metod)) {
                                                qOfMethods.add(metod);
                                            }

                                        } catch (Exception exception) {
                                            System.out.println("Th method  is overloaded and Soot cannot retrieve it by name");
                                        }


                                    }

                                }

                            }

                        }
                    }
                }

            } catch (Exception e) {
                System.out.println("In body");
                System.out.println(e.toString());
                e.printStackTrace();
            }

        } else {
            System.out.println("does not have active body**" + identifier);

        }


        return false;
    }

    public boolean getId(Stmt stmt) {
        if (stmt.toString().contains("findViewById")) {
            InvokeExpr expr = stmt.getInvokeExpr();
            Value v = expr.getArgs().get(0);
            if (!expr.getArgs().isEmpty()) {
                qOfRegisters.add(v.toString());
                return true;
            } else {

                return false;
            }
        }

        return false;
    }

    public boolean mapRegToActOnClickListener(Stmt stmt, Unit[] c) {
        if (stmt.toString().contains("(r0)")) {
            InvokeExpr expr = stmt.getInvokeExpr();
            Value v = expr.getArgs().get(0);
            if (!expr.getArgs().isEmpty()) {
                qOfRegisters.add(v.toString());
                return true;
            } else {

                return false;
            }
        }

        return false;
    }


    public void clear() {
        qOfMethods.clear();
        qOfRegisters.clear();
        mapRegisterToID.clear();
        mapRegisterToClsNum.clear();
        mapRegisterToID.clear();


    }

    public void clearBeforeNewRound() {
        visited.clear();
        visitedRel.clear();
    }


    public boolean checkRelease(SootMethod method, List<String> lookingFor) {

        temp(method);

        int index = 50;
        String identifier = method.getSignature();
        System.out.println("My method Name is " + identifier);

        if (identifier.contains("leakcanary")) {
            return false;
        }

        if (checkVisitedMethodForReleas(method)) {
            return false;
        }

        if (smoRel(lookingFor, identifier, method)) return false;

        while (index != 0 && !qOfMethods.isEmpty()) {
            System.out.println(qOfMethods.size());
            SootMethod removable = qOfMethods.remove();
            index = index - 1;
            System.out.println("**MethodscalledinRelese:" + removable.getName());
            temp(removable);
            identifier = removable.getSignature();

            if (smoRel(lookingFor, identifier, removable)) {
                return false;
            }

        }

        return true;

    }

    private boolean checkVisitedMethodForReleas(SootMethod method) {

        for (Map.Entry<String, Boolean> entry : visitedRel.entrySet()) {
            String key = entry.getKey();
            boolean value = entry.getValue();
            if (method.getSignature().equals(key)) {
                if (value) {
                    return true;
                }
            }
        }

        return false;
    }

    public boolean smoRel(List<String> lookingFor, String identifier, SootMethod removable) {
        if (removable.hasActiveBody()) {
            System.out.println("****************************IMINCHECKMETHODREls************");
            JimpleBody body = (JimpleBody) removable.retrieveActiveBody();

            for (Unit u : body.getUnits()) {

                Stmt stmt = (Stmt) u;
                System.out.println(stmt);

                for (String str : lookingFor) {
                    if (stmt.toString().contains(str)) {
                        visitedRel.put(identifier, true);
                        System.out.println("/*********/*//******");
                        return true;
                    }
                }

                if (stmt instanceof InvokeStmt) {
                    InvokeStmt invokeStmt = (InvokeStmt) stmt;
                    if (invokeStmt.getInvokeExpr() instanceof VirtualInvokeExpr) {
                        VirtualInvokeExpr virtualInvokeExpr = (VirtualInvokeExpr) invokeStmt.getInvokeExpr();

                        if (virtualInvokeExpr.getMethod().getDeclaringClass().getName().startsWith("java"))
                            continue;
                        if (virtualInvokeExpr.getMethod().getDeclaringClass().getName().startsWith("android"))
                            continue;
                        if (stmt.getInvokeExpr().getMethod().getName().contains("<init>"))
                            continue;
                        try {
                            SootClass circleClass = stmt.getInvokeExpr().getMethod().getDeclaringClass();
                            SootMethod metod = circleClass.getMethodByName(stmt.getInvokeExpr().getMethod().getName());
                            if (metod.isConcrete()) {
                                if (checkVisitedMethodForReleas(metod))
                                    return false;
                                if (!qOfMethods.contains(metod)) {
                                    qOfMethods.add(metod);
                                }
                            }

                        } catch (Exception exception) {
                            System.out.println("Th method  is overloaded and Soot cannot retrieve it by name");
                        }


                    }

                }


            }


        } else {
            System.out.println("does not have active body**" + identifier);

        }


        return false;
    }


    public void clearRel() {
        qOfMethods.clear();

    }

    public void writeResult(String path, String content) {

        try {
            // Create new file
            File file = new File(path);

            // If file doesn't exists, then create it
            if (!file.exists()) {
                file.createNewFile();
            }

            FileWriter fw = new FileWriter(file.getAbsoluteFile());
            BufferedWriter bw = new BufferedWriter(fw);

            // Write in file
            bw.write(content);

            // Close connection
            bw.close();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public String getApkName(String apkPath) {
        String[] directories = apkPath.split(Pattern.quote(FileSystems.getDefault().getSeparator()));
        String apkName = directories[directories.length - 1];
        return apkName;
    }


    public List<Path> doFreqAnalysis(List<String> lookingFor, String packageName,
                                     String rsrcType, List<SootClass> orderedActivities, ResourceInfo resourceInfo, String resourceTestType, String apkPath, AndroidCallGraphFilter androidCallGraphFilter) {
        List<Path> paths = new ArrayList<>();
        System.out.println("*********************");
        System.out.println(rsrcType);
        boolean hasLeak = false;
        String tempActivity;
        String currActivityName = "";

        boolean start = false;
        boolean create = false;
        boolean resume = false;

        try {
            for (SootClass sootClass : orderedActivities) {

                tempActivity = currActivityName;
                currActivityName = sootClass.getName();

                //resetting things

                if (currActivityName.contains("$")) {
                    currActivityName = currActivityName.substring(0, currActivityName.indexOf("$"));
                    System.out.println("curr act" + currActivityName);
                    if (currActivityName.equals(tempActivity)) {
                        System.out.println("we are same" + tempActivity + "**" + currActivityName);
                    }
                } else {
                    System.out.println("I'm cleaning Util in check method");
                    System.out.println(sootClass.getName());
                    Util.getInstance().clear();
                }

                if (!sootClass.getName().contains("$")) {

                    for (SootMethod sootMethod : sootClass.getMethods()) {

                        if (sootMethod.getName().contains("onStart")) {
                            System.out.println("***********Starting investigating onStart! Method**********");
                            hasLeak = Util.getInstance().checkMethod(sootMethod, lookingFor, packageName);
                            if (hasLeak) {
                                start = true;
                                Path path = new Path();
                                path.setActivityName(currActivityName);
                                path.setPackageName(packageName);
                                path.setResourceType(rsrcType);
                                path.setId("-1");
                                path.setHasLeack(true);
                                paths.add(path);
                                System.out.println("Leak///**at onStart");

                            }

                        }


                        if (sootMethod.getName().contains("onCreate")) {
                            System.out.println("***********Starting investigating onCreat! Method**********");
                            hasLeak = Util.getInstance().checkMethod(sootMethod, lookingFor, packageName);
                            if (hasLeak) {
                                create = true;
                                Path path = new Path();
                                path.setActivityName(currActivityName);
                                path.setPackageName(packageName);
                                path.setResourceType(rsrcType);
                                path.setId("-1");
                                path.setHasLeack(true);
                                paths.add(path);
                                System.out.println("Leak///** onCreate");

                            }

                        }

                        if (sootMethod.getName().contains("onResume")) {
                            System.out.println("***********Starting investigating onResume! Method**********");
                            hasLeak = Util.getInstance().checkMethod(sootMethod, lookingFor, packageName);
                            if (hasLeak) {
                                resume = true;
                                System.out.println("Leak///** onResume");


                            }

                        }

                    }
                }

            }

            if (start || create) {

                if (!resume) {
                    Util.getInstance().mapID(paths, resourceTestType, apkPath, androidCallGraphFilter);
                }

            }

        } catch (FileNotFoundException fileNotFoundException) {
            fileNotFoundException.printStackTrace();
        }


        return paths;
    }

    public List<Path> doAnalysis(List<String> lookingFor,
                                 String packageName, String rsrcType,
                                 List<SootClass> orderedActivities,
                                 ResourceInfo resourceInfo) throws FileNotFoundException {


        System.out.println("*********************");
        System.out.println(rsrcType);
        System.out.println(resourceInfo.getAcquireMethod());
        System.out.println(resourceInfo.getReleaseMethod());
        boolean leakInBody = false;
        boolean hasLeak = false;
        String tempActivity = "";
        String currActivityName = "";
        List<Path> paths = new ArrayList<>();
        paths.clear();

        for (SootClass sootClass : orderedActivities) {

            tempActivity = currActivityName;
            currActivityName = sootClass.getName();

            leakInBody = false;
            //resetting things

            if (currActivityName.contains("$")) {
                currActivityName = currActivityName.substring(0, currActivityName.indexOf("$"));
                System.out.println("curr act" + currActivityName);
                if (currActivityName.equals(tempActivity)) {
                    System.out.println("we are same" + tempActivity + "**" + currActivityName);
                }
            } else {
                System.out.println("I'm cleaning Util in check method");
                System.out.println(sootClass.getName());
                Util.getInstance().clear();
            }


            if (!sootClass.getName().contains("$")) {

                for (SootMethod sootMethod : sootClass.getMethods()) {

                    if (sootMethod.getName().contains("onStart")) {
                        System.out.println("***********Starting investigating onStart! Method**********");
                        hasLeak = Util.getInstance().checkMethod(sootMethod, lookingFor, packageName);
                        if (hasLeak) {

                            if (!leakInBody) {

                                Path path = new Path();
                                path.setActivityName(currActivityName);
                                path.setPackageName(packageName);
                                path.setResourceType(rsrcType);
                                path.setId("-1");
                                paths.add(path);
                                leakInBody = true;
                                System.out.println("Leak///**at onStart");
                            }

                        }


                    }


                    if (sootMethod.getName().contains("onCreate")) {
                        System.out.println("***********Starting investigating onCreat! Method**********");
                        hasLeak = Util.getInstance().checkMethod(sootMethod, lookingFor, packageName);
                        if (hasLeak) {
                            System.out.printf("******Leak: %sn", currActivityName);
                            if (!leakInBody) {

                                Path path = new Path();
                                path.setActivityName(currActivityName);
                                path.setPackageName(packageName);
                                path.setResourceType(rsrcType);
                                path.setId("-1");
                                paths.add(path);
                                leakInBody = true;
                                System.out.println("Leak///** onCreate");
                            }

                        }

                    }

                    if (sootMethod.getName().contains("onResume")) {
                        System.out.println("***********Starting investigating onResume! Method**********");
                        hasLeak = Util.getInstance().checkMethod(sootMethod, lookingFor, packageName);
                        if (hasLeak) {
                            if (!leakInBody) {

                                Path path = new Path();
                                path.setActivityName(currActivityName);
                                path.setPackageName(packageName);
                                path.setResourceType(rsrcType);
                                path.setId("-1");
                                paths.add(path);
                                leakInBody = true;
                                System.out.println("Leak///** onResume");
                            }

                        }

                    }


                }
            } else {
                System.out.println("I'm investigating clicks!!!!" + sootClass.getName());


                for (SootMethod sootMethod : sootClass.getMethods()) {

                    hasLeak = Util.getInstance().checkMethod(sootMethod, lookingFor, packageName);
                    if (hasLeak) {
                        System.out.println("/*/*/*/found Leek at click:" + currActivityName);
                        Path path = new Path();
                        path.setActivityName(currActivityName);
                        path.setPackageName(packageName);
                        path.setResourceType(rsrcType);
                        path.setId("0");


                        HashMap<String, String> mapRegisterToClsNum;
                        for (Map.Entry<String, String> entry : Util.getInstance().getMapRegisterToClsNum().entrySet()) {
                            String key = entry.getKey();
                            String value = entry.getValue();
                            System.out.println("***********************");
                            System.out.println("cuActivity: " + currActivityName);
                            System.out.println("key: " + key + "**value:" + value);
                            System.out.println(sootClass.getName());
                            if (sootClass.getName().equals(key)) {
                                System.out.println("key: " + key + "**value:" + value);
//                                HashMap<String, Integer> mapRegisterToID ;
                                for (Map.Entry<String, Integer> entry1 : Util.getInstance().getMapRegisterToID().entrySet()) {
                                    String key1 = entry1.getKey();
                                    int value1 = entry1.getValue();

                                    if (key1.equals(value)) {
                                        System.out.println("key: " + key1 + "***value:" + value1);
                                        path.setId(String.valueOf(value1));
                                        paths.add(path);
                                    }
                                }

                            }

                        }

                    }

                }


            }


        }

        {
            boolean pause;
            boolean stop;
            boolean destroy;
            System.out.println("**********Check For Release**********");
            Util.getInstance().clear();

            String pmethod;
            SootMethod pauseMethod;

            for (SootClass sootClass : orderedActivities) {
                Util.getInstance().clearRel();
                pause = false;
                stop = false;
                destroy = false;
                if (!sootClass.getName().contains("$")) {
                    for (int i = 0; i < paths.size(); i++) {

                        if (paths.get(i).getActivityName().equals(sootClass.getName())) {
                            System.out.println("Found candid Leak for activity:" + sootClass.getName()
                                    + "For resourceType:" + resourceInfo.getResourceType());


                            pmethod = "<" + sootClass.getName() + ": " + "void onPause()>";

                            try {
                                pauseMethod = Scene.v().getMethod(pmethod);

                                if (Util.getInstance().checkRelease(pauseMethod, resourceInfo.getReleaseMethod())) {

                                    pause = true;
                                    System.out.println("*TLeak found in ActivityName:" + sootClass.getName() + "at onPauseMethod()");
                                }


                            } catch (RuntimeException e) {
                                System.out.println("Activity " + sootClass.getName() + "does not have Pause Method!");
                                pause = true;
                            }


                            pmethod = "<" + sootClass.getName() + ": " + "void onStop()>";

                            try {
                                pauseMethod = Scene.v().getMethod(pmethod);

                                if (Util.getInstance().checkRelease(pauseMethod, resourceInfo.getReleaseMethod())) {

                                    stop = true;
                                    System.out.println("*TLeak found in ActivityName:" + sootClass.getName() + "in Stop");
                                }


                            } catch (RuntimeException e) {
                                System.out.println("Activity " + sootClass.getName() + "does not have Stop Method!");
                                stop = true;
                            }


                            pmethod = "<" + sootClass.getName() + ": " + "void onDestroy()>";

                            try {
                                pauseMethod = Scene.v().getMethod(pmethod);

                                if (Util.getInstance().checkRelease(pauseMethod, resourceInfo.getReleaseMethod())) {

                                    destroy = true;
                                    System.out.println("*TLeak found in ActivityName:" + sootClass.getName() + "in Destroy");
                                }


                            } catch (RuntimeException e) {
                                System.out.println("Activity " + sootClass.getName() + "does not have Destroy Method!");
                                destroy = true;
                            }


                            pmethod = "<" + sootClass.getName() + ": " + "void onBackPressed()>";

                            try {
                                pauseMethod = Scene.v().getMethod(pmethod);

                                if (!Util.getInstance().checkRelease(pauseMethod, resourceInfo.getReleaseMethod())) {

                                    stop = false;
                                    destroy = false;

                                }


                            } catch (RuntimeException e) {
                                System.out.println("Activity " + sootClass.getName() + "does not have onBackPressed Method!");

                            }

                            if (pause && stop) {
                                if (destroy) {
                                    paths.get(i).setHasLeack(true);
                                    paths.get(i).setTestType("both");
                                } else {
                                    paths.get(i).setHasLeack(true);
                                    paths.get(i).setTestType("home");
                                }
                            }


//                            } if close
                        }
                    }

                }
            }
        }

        return paths;


    }


    public void deleteTestFiles(String folderName) {

        try {
            String path = System.getProperty("user.dir") + "\\" + folderName + "\\";
//            System.out.println(path);
            Arrays.stream(new File(path).listFiles()).forEach(File::delete);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void mapID(List<Path> paths, String resourceTestType, String apkPath, AndroidCallGraphFilter androidCallGraphFilter) {
        System.out.println("*/*/*/*/*I'm in mapID");
        int ind = 0;
        for (Path path : paths) {
            if (path.getHasLeack()) {
                System.out.println("*/*/*/*/*I'm in hasLEak");
                ind = ind + +1;
                System.out.println("*/*//*/*/*/*/*/*/" + path.getActivityName() + path.getResourceType() + " */*" + path.getTestType());

                if (!path.getId().equals("-1")) {

                    System.out.println("ID valu is for avtName: " + path.getActivityName());
                    System.out.println("ID valu is for avtName: " + path.getId());
//                    System.out.println(apktoolUtil.getID(path.getId()));
                    if (apktoolUtil.getID(path.getId()).matches(".*\\d.*")) {

                        System.out.println("Couldn't find ID value");
                    } else {
                        path.setId(apktoolUtil.getID(path.getId()));
                        System.out.println("ID is: " + path.getId());
                    }
                } else {
                    System.out.println("No need to ID");
                }

                // Write Results:
                // change extended activitiesName to correct one
                Map<String, String> extendedActivities = new HashMap<>();
                extendedActivities = androidCallGraphFilter.getExtendedActivities(AndroidUtil.getPackageName(apkPath));


                if (!path.getId().equals("0")) {
                    for (Map.Entry<String, String> entry : extendedActivities.entrySet()) {
                        String key = entry.getKey();
                        String value = entry.getValue();
//                    System.out.println(key);
//                    System.out.println(value);
                        if (value.equals(path.activityName)) {

                            System.out.println("mana***" + key);
                            System.out.println("actName" + path.activityName);

                            path.setActivityName(key);


                        }
                    }

                    try {
                        String cont = path.toString();
                        String fileName = resourceTestType.substring(0, resourceTestType.lastIndexOf("R")) + ind + ".txt";
                        String pth = System.getProperty("user.dir") + "\\" + resourceTestType + "\\" + fileName;
                        Util.getInstance().writeResult(pth, cont);
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                        System.out.println("error in write");
                    }
                    ind = ind + 1;

                } else {
                    System.out.println("this test cannot be done due to ID");
                }


            } else {
                System.out.println("OPS! something wrong");
            }
        }
    }

}


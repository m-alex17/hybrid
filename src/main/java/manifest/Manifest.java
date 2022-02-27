package manifest;


import org.xmlpull.v1.XmlPullParserException;
import soot.jimple.infoflow.android.axml.AXmlAttribute;
import soot.jimple.infoflow.android.axml.AXmlHandler;
import soot.jimple.infoflow.android.axml.AXmlNode;
import soot.jimple.infoflow.android.manifest.ProcessManifest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Manifest {

    public static List<String> launcherActivities = new ArrayList<>();


    public List<String> activities = new ArrayList<>();
    public List<String> permissions = new ArrayList<>();


    public static String getPackageName(String apkPath) {
        String packageName = "";
        try {
            ProcessManifest manifest = new ProcessManifest(apkPath);
            packageName = manifest.getPackageName();

        } catch (IOException | XmlPullParserException e) {
            e.printStackTrace();
        }
        return packageName;
    }

    public List<String> getMainActivityName(String apkFileLocation) {
        List<String> mainActivityName = new ArrayList<>();
        try {
            ProcessManifest pm = new ProcessManifest(apkFileLocation);
            AXmlHandler axmlh = pm.getAXml();
            List<AXmlNode> anodes = axmlh.getNodesWithTag("activity");
            for (AXmlNode an : anodes) {
                boolean hasMain = false;
                boolean hasLauncher = false;
                AXmlNode filter = null;
                AXmlAttribute aname = an.getAttribute("name");
                String aval = (String) aname.getValue();

                List<AXmlNode> fnodes = an.getChildrenWithTag("intent-filter");
                for (AXmlNode fn : fnodes) {
                    hasMain = false;
                    hasLauncher = false;
                    // check action
                    List<AXmlNode> acnodes = fn.getChildrenWithTag("action");
                    for (AXmlNode acn : acnodes) {
                        AXmlAttribute acname = acn.getAttribute("name");
                        String acval = (String) acname.getValue();
                        //System.out.println("action: " + acval);
                        if (acval.equals("android.intent.action.MAIN")) {
                            hasMain = true;
                        }
                    }
                    // check category
                    List<AXmlNode> catnodes = fn.getChildrenWithTag("category");
                    for (AXmlNode catn : catnodes) {
                        AXmlAttribute catname = catn.getAttribute("name");
                        String catval = (String) catname.getValue();
                        if (catval.equals("android.intent.category.LAUNCHER")) {
                            hasLauncher = true;
                            filter = fn;
                        }
                    }

                    if (hasLauncher && hasMain) {
                        launcherActivities.add(aval);
                    }
                    /*if (hasLauncher) {
                        break;
                    }*/
                }
                mainActivityName.add(aval);
                /*if (hasLauncher) {
                    filter.exclude();
                    //mainActivityName = aval;
                    mainActivityName.add(aval);
                    //break;
                }*/
            }
        } catch (XmlPullParserException | IOException e) {
            e.printStackTrace();
        }

        return mainActivityName;
    }

    public List<String> getListedPermission(String apkFileLocation) {

        List<String> permissionList = new ArrayList<>();
        try {
            ProcessManifest pm = new ProcessManifest(apkFileLocation);
            AXmlHandler axmlh = pm.getAXml();
            List<AXmlNode> anodes = axmlh.getNodesWithTag("uses-permission");
            for (AXmlNode an : anodes) {
                permissionList.add(String.valueOf(an));
            }
        } catch (XmlPullParserException | IOException e) {
            e.printStackTrace();
        }
        return permissionList;

    }
}

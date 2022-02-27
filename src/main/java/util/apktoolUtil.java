package util;

import XMLUtil.XmlUtil;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.file.FileSystems;
import java.util.regex.Pattern;

public class apktoolUtil {

    public static String apkPath = "";
    public static String apkName = "";

    public static void main(String[] args) throws IOException, InterruptedException {

        String pyPath = System.getProperty("user.dir") + "\\main.py";
        apkPath = args[0];
        String destDir = "apkOutput";

        String[] directories = apkPath.split(Pattern.quote(FileSystems.getDefault().getSeparator()));

        apkName = directories[directories.length - 1];

        ProcessBuilder processBuilder = new ProcessBuilder("python", pyPath, apkPath, apkName, destDir);
        processBuilder.redirectErrorStream(true);

        Process process = processBuilder.start();
        Reader reader = new InputStreamReader(process.getInputStream());
        BufferedReader error = new BufferedReader(new InputStreamReader(process.getErrorStream()));
        BufferedReader bf = new BufferedReader(reader);
        String s;
        while ((s = bf.readLine()) != null) {
            System.out.println(s);
        }


    }

    public static String getID(String decimalId) {
        int decimalNum;
        try {
            decimalNum = Integer.parseInt(decimalId);
        } catch (Exception e) {
            //e.printStackTrace();
            decimalNum = -1;
        }
        if (decimalNum == -1)
            return decimalId;

        //System.out.println(decimalNum);
        String hexString = Integer.toHexString(decimalNum);
        //System.out.println(hexString);
        //int PRETTY_PRINT_INDENT_FACTOR = 4;
        try {

            String xmlString = XmlUtil.getXmlString(System.getProperty("user.dir") + "\\apkOutput\\" + apkName + "\\res\\values\\public.xml");
            JSONObject xmlJSONObj = XML.toJSONObject(xmlString);
            //System.out.println(xmlJSONObj);
            JSONObject arr = (JSONObject) xmlJSONObj.get("resources");
            for (Object j : arr.getJSONArray("public")) {
                if (j instanceof JSONObject)
                    if (((JSONObject) j).getString("id").equals("0x" + hexString)) {
                        //System.out.println(((JSONObject) j).getString("name"));
                        return ((JSONObject) j).getString("name");
                    }

            }
            return decimalId;
        } catch (JSONException je) {
            System.out.println(je.toString());
        }
        return decimalId;
    }


}

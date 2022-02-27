package path;

import java.util.Arrays;

public class TestPath {
    public String packageName;
    public String activity;
    public String[] id;
    public String resourceType;
    public String leakType;

    public TestPath(String packageName, String activity, String[] id, String resourceType, String leakType) {
        this.packageName = packageName;
        this.activity = activity;
        this.id = id;
        this.resourceType = resourceType;
        this.leakType = leakType;
    }

    @Override
    public String toString() {
        return "TestPath{" +
                "packageName='" + packageName + '\'' +
                ", activity='" + activity + '\'' +
                ", id=" + Arrays.toString(id) +
                ", resourceType='" + resourceType + '\'' +
                ", leakType='" + leakType + '\'' +
                '}';
    }
}

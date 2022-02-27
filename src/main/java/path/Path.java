package path;

public class Path {

    public String packageName;
    public String activityName;
    public String id;
    public String resourceType;
    public Boolean hasLeack;
    public String testType;

    public String getTestType() {
        return testType;
    }

    public void setTestType(String testType) {
        this.testType = testType;
    }

    public Path() {
        hasLeack = false;
    }

    public Path(String packageName, String activity, String id, String resourceType, Boolean hasLeack) {
        this.packageName = packageName;
        this.activityName = activity;
        this.id = id;
        this.resourceType = resourceType;
        this.hasLeack = hasLeack;
    }


    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getResourceType() {
        return resourceType;
    }

    public void setResourceType(String resourceType) {
        this.resourceType = resourceType;
    }

    public Boolean getHasLeack() {
        return hasLeack;
    }

    public void setHasLeack(Boolean hasLeack) {
        this.hasLeack = hasLeack;
    }

    @Override
    public String toString() {
        return
                packageName + '\n' +
                        activityName + '\n' +
                        id + '\n' +
                        testType + '\n'

                ;
    }
}

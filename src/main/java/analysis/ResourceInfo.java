package analysis;

import java.util.ArrayList;
import java.util.List;

public class ResourceInfo {

    private List<String> acquireMethod;
    private List<String> releaseMethod;
    private String resourceType;

    public ResourceInfo(String acquireMethod, String releaseMethod) {
        this.acquireMethod.add(acquireMethod);
        this.releaseMethod.add(releaseMethod);
    }

    public ResourceInfo() {
        acquireMethod = new ArrayList<>();
        releaseMethod = new ArrayList<>();
    }

    public List<String> getAcquireMethod() {
        return acquireMethod;
    }

    public void setAcquireMethod(String acquireMethod) {
        this.acquireMethod.add(acquireMethod);
    }

    public List<String> getReleaseMethod() {
        return releaseMethod;
    }

    public void setReleaseMethod(String releaseMethod) {
        this.releaseMethod.add(releaseMethod);
    }

    public String getResourceType() {
        return resourceType;
    }

    public void setResourceType(String resourceType) {
        this.resourceType = resourceType;
    }

    public void clear() {
        acquireMethod.clear();
        releaseMethod.clear();
    }
}

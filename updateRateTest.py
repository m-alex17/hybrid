import subprocess
import uiautomator2 as u2
import os
import time
root_dir = "F:\\javaP\\freqResult"

dir_set = []
lines = []
for root, dirs, files in os.walk(root_dir):
    if root in "results":
        continue

    dir_set.append(root)

packageName=""
activityName=""
id=""
testType=""

list_activiyNames_has_LeaK = []

for d in dir_set:

    filess = os.listdir(d)
    for file in filess:

        with open(d + "\\" + file) as f:
            lines.append(f.readlines())


for f in lines:
    x_loop_must_break = False
    if (f[2].strip().isnumeric()):
        continue

    packageName = f[0].strip()
    activityName=f[1].strip()
    id=f[2].strip()
    testType=f[3].strip()
    apkName = sys.argv[1]

    for act in list_activiyNames_has_LeaK:
        if activityName in act:
            x_loop_must_break = True
            break
    if x_loop_must_break:
        break

    import subprocess
    import sys
    import time
    import uiautomator2 as u2

    def idClick(appPackageName, id):
        d(resourceId=appPackageName + ":id/" + id).click()

    def runCommand(adbCommand):
        return subprocess.getoutput(adbCommand)


    def findResult(start, output):
        return (output[output.find(start) + len(start):])


    def substring(start, end, output):
        return (output[output.find(start) + 1 + len(start):output.rfind(end)])

    def startActivity(activityName):
        adbCommand = "adb shell am start -n "+packageName+"/"+activityName
        return subprocess.getoutput(adbCommand)

    def clickId(id):
        print("I'm in ID")
        if id:
            idClick(packageName, id)
            # time.sleep(2)
        else:
            # time.sleep(3)  # Sleep for 3 second
            print()

    # # *---*******************************--------------------*******************************--------------------------
    d = u2.connect()  # connect to device
    print(d.info)
    d.screen_on()
    adbSensorCommand = "adb shell " + '"dumpsys sensorservice"'
    target = 'Previous Registrations:'
    ratePackageName = "com.example.updaterate"

    res = runCommand(adbSensorCommand)
    shortRes = findResult(target, res)
    lines = shortRes.splitlines()


    def check_updateRate(packageName):
        for l in lines:
            if packageName in l:
                return substring("samplingRate", "us ", l)

    res = runCommand("adb install -r -g "+apkName)
    runCommand(res)

    print(startActivity(activityName))
    time.sleep(.4)
    before = check_updateRate(packageName)
    d.press("home")
    d.app_start(ratePackageName)
    time.sleep(.4)
    d.press("home")

    after = check_updateRate(packageName)

    diff = int(before) - int(after)
    if (diff > 0):
        print("Confirmed Rate update change")


# ************************************************************************

















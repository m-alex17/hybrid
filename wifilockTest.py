import subprocess
import uiautomator2 as u2
import os
import time


def findResult(start, end, output):
    return (output[output.find(start) + len(start):output.rfind(end)])

def runCommand(adbCommand):
    return subprocess.getoutput(adbCommand)

def idClick(appPackageName, id):
        d(resourceId=appPackageName + ":id/" + id).click()

def clickId(id):
    print("I'm in ID")
    if id:
        idClick(packageName, id)
    else:
        print()


def startActivity(activityName):
    adbCommand = "adb shell am start -n " + packageName + "/" + activityName
    return subprocess.getoutput(adbCommand)

def test():
        res = runCommand(adbWifiLockCommand)
        if res:
            return ("Confirmed Leak")
        else:
            return ("No Leak")

root_dir = "F:\\javaP\\wifilockResult"
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
# ************************************************************************
adbWifiLockCommand = "adb shell " + '"dumpsys wifi | grep WifiLock"'

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
    # activityName="com.example.sensroleak.MainActivity2"
    id=f[2].strip()
    testType=f[3].strip()
    apkName = sys.argv[1]

    for act in list_activiyNames_has_LeaK:
        if activityName in act:
            x_loop_must_break = True
            break
    if x_loop_must_break:
        break

    d = u2.connect()  # connect to device
    print(d.info)
    d.screen_on()

     print(runCommand("adb install -r -g "+apkName))

    if testType in "both":
        d.app_start(packageName)
        time.sleep(5)
    if testType in "back":
        d.app_start(packageName)
        time.sleep(5)

    print(startActivity(activityName))

    if id not in "-1":
        clickId(id)
    print(testType)

    if testType in "both":
        d.press("home")
        # time.sleep(.5)
        print(test())
        d.press("recent")
        d.click(1000, 1000)
        if id not in "-1":
            clickId(id)
        # time.sleep(1)
        # time.sleep(.5)
        d.press("back")
        # time.sleep(1)
        print(test())
        if ("Confirmed" in test()):
            list_activiyNames_has_LeaK.append(activityName)

    elif testType in "home":
        d.press("home")
        # time.sleep(.4)
        print(test())
        if ("Confirmed" in test()):
            list_activiyNames_has_LeaK.append(activityName)
    else:

        d.press("back")
        d.press("back")

        print(test())
        if ("Confirmed" in test()):
            list_activiyNames_has_LeaK.append(activityName)


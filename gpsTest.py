import os
import subprocess
import sys

import uiautomator2 as u2
# **************************************************************************
root_dir = "F:\\javaP\\gpsResult"

dir_set = []
lines = []
for root, dirs, files in os.walk(root_dir):
    if root in "results":
        continue
    # print("root:", root)
    # print("dirs:", dirs, end=" ")
    # print("files:", files, end=" ")
    # print()
    dir_set.append(root)

packageName=""
activityName=""
id=""
testType=""

list_activiyNames_has_LeaK = []

for d in dir_set:

    filess = os.listdir(d)
    for file in filess:
        # print(d + "\\" + file)
        with open(d + "\\" + file) as f:
            # for line in f:
            #     # print(line.strip())
            #     lines.append(line.strip())
            lines.append(f.readlines())
print(len(lines))
# print(lines)
def idClick(appPackageName, id):
    d(resourceId=appPackageName + ":id/" + id).click()


def runCommand(adbCommand):
    return subprocess.getoutput(adbCommand)


def startActivity(activityName):
    adbCommand = "adb shell am start -n " + packageName + "/" + activityName
    return subprocess.getoutput(adbCommand)


def clickId(id):
    print("I'm in ID")
    if id:
        idClick(packageName, id)
        # time.sleep(2)
    else:
        # time.sleep(3)  # Sleep for 3 second
        print()

def testResult(packageName, result):
    if packageName in result:
        last_char_index = result.rfind(":")
        new_string = result[last_char_index + 2:]
        # print(new_string.strip())
        # print(new_string)
        # print(result)
        if new_string.strip() in "Currently active":
            # print(result)
            return "Confirmed Leak"
        else:
            return "No Leak"
    else:
        return "No Leak"

def test():
    res = runCommand(adbGpsCommand)
    if res:
        # print("inres")
        return (testResult(packageName, res))
    else:
        return ("No Leak")

adbGpsCommand = "adb shell " + '"dumpsys location|grep active|grep gps"'
startGps = 'gps:'
endGps = '    passive:'



for f in lines:
    x_loop_must_break = False
    if (f[2].strip().isnumeric()):
        continue
    # print(f[0].strip())
    # print(f[1].strip())
    # print(f[2].strip())
    # print(f[3].strip())
    # print()

    packageName = f[0].strip()
    activityName=f[1].strip()
    # activityName="com.example.sensroleak.MainActivity2"
    id=f[2].strip()
    # id="buttons"
    testType=f[3].strip()
    apkName = sys.argv[1]

    for act in list_activiyNames_has_LeaK:
        if activityName in act:
            x_loop_must_break = True
            break
    if x_loop_must_break:
        break

    # # *---*******************************--------------------*******************************--------------------------
    d = u2.connect()  # connect to device
    print(d.info)
    d.screen_on()

    print(runCommand("adb install -r -g "+apkName))


    print(startActivity(activityName))

    if id not in "-1":
        clickId(id)
    # time.sleep(1)
    import time
    print(testType)
    if testType in "both":
        time.sleep(.4)
        d.press("recent")
        print(test())
        d.press("recent")
        time.sleep(.4)
        # d.click(1000, 580)
        d.press("recent")
        if id not in "-1":
            clickId(id)
        time.sleep(1)
        d.press("back")
        d.press("back")
        print(test())
        if ("Confirmed" in test()):
            list_activiyNames_has_LeaK.append(activityName)

    elif testType in "home":
#         time.sleep(.4)
        d.press("home")
        print(test())
        if ("Confirmed" in test()):
            list_activiyNames_has_LeaK.append(activityName)
    else:
        d.press("back")
        # time.sleep(.4)
        print(test())
        if ("Confirmed" in test()):
            list_activiyNames_has_LeaK.append(activityName)
#             todo write result to text

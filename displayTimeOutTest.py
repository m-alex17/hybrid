import os

# **************************************************************************
root_dir = "F:\\javaP\\displayTimeOutResult"

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
        # print(d + "\\" + file)
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

    def findResult(start, end, output):
        return (output[output.find(start) + len(start):output.rfind(end)])

    startSensor = 'Active sensors:'
    endSensor = 'Previous Registrations:'
    adbCommand = "adb shell settings get system screen_off_timeout"
    def test():
        after_run = runCommand(adbCommand)
        diff = int(after_run) - int(beforeTest_displayTime)

        if (diff > 0):
            return ("Confirmed Leak")
        else:
            return ("No Leak")


    def testResult(packageName, result):
        if packageName in result:
            return "Confirmed Leak"
        return "No Leak"
    #
    # # *---*******************************--------------------*******************************--------------------------
    d = u2.connect()  # connect to device
    print(d.info)
    d.screen_on()


    res = runCommand("adb install -r -g "+apkName)
    runCommand(res)

    if testType in "both":
        d.app_start(packageName)
    if testType in "back":
        d.app_start(packageName)

    import time
    # time.sleep(2) # Sleep for 3 seconds
    setCommand = "adb shell settings put system screen_off_timeout 15000"
    runCommand(setCommand)
    beforeTest_displayTime = runCommand(adbCommand)
    print(startActivity(activityName))
    if id not in "-1":
        clickId(id)

    print(testType)
    if testType in "both":
            d.press("home")
            # time.sleep(.5)
            print(test())
            d.press("recent")
            d.press("recent")
            if id not in "-1":
                clickId(id)
            # time.sleep(1)
            # time.sleep(.5)
            d.press("back")
            # time.sleep(1)
            diff = int(after_run) - int(beforeTest_displayTime)
                    print(diff, after_run)
                    if (diff > 0):
                        print("Confirmed Leak")
                        list_activiyNames_has_LeaK.append(activityName)
                    else:
                        print("No Leak")

    elif testType in "home":
        d.press("home")
        # time.sleep(1)
        after_run = runCommand(adbCommand)
        print("res ", after_run)
        # print(res)
        diff = int(after_run) - int(beforeTest_displayTime)
        print(diff, after_run)
        if (diff > 0):
            print("Confirmed Leak")
            list_activiyNames_has_LeaK.append(activityName)
        else:
            print("No Leak")

    else:
        d.press("back")
        d.press("back")
        # time.sleep(.4)
       after_run = runCommand(adbCommand)
       diff = int(after_run) - int(beforeTest_displayTime)
        print(diff, after_run)
                if (diff > 0):
                    print("Confirmed Leak")
                    list_activiyNames_has_LeaK.append(activityName)
                else:
                    print("No Leak")

    d.app_stop_all()

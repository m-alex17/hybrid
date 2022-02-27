import os
import sys
# **************************************************************************
root_dir = "F:\\javaP\\sensorResult"

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
# print(len(lines))
# print(lines)

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
    adbSensorCommand = "adb shell dumpsys sensorservice"
    def test():
        res = runCommand(adbSensorCommand)
        # print(res)
        shortRes = findResult(startSensor, endSensor, res)
        # print(shortRes)
        return (testResult(packageName, shortRes))

    def testResult(packageName, result):
        if packageName in result:
            return "Confirmed Leak"
        return "No Leak"
    #
    # # *---*******************************--------------------*******************************--------------------------
    d = u2.connect()  # connect to device
    print(d.info)
    d.screen_on()


    # res = runCommand("adb install -r -g "+apkName)
#     res = runCommand("adb install -r -g "+"F:sensroLeak.apk")
    res = runCommand("adb install -r -g "+apkName)
    runCommand(res)
    # time.sleep(.3)

    if testType in "both":
        d.app_start(packageName)
    if testType in "back":
        d.app_start(packageName)

    import time
    # time.sleep(2) # Sleep for 3 seconds


    print(startActivity(activityName))
    if id not in "-1":
        clickId(id)
    # time.sleep(1)


    # print(test())
    # if ("Confirmed" in test()):
    #     print("imkmdasmdslkajdlkl")
    #     list_activiyNames_has_LeaK.append(activityName)
    print(testType)
    if testType in "both":
            d.press("home")
            # time.sleep(.5)
            print(test())
            d.press("recent")
            d.click(1000, 1000)
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
        # time.sleep(.4)
        print(test())
        if("Confirmed" in test()):
            list_activiyNames_has_LeaK.append(activityName)
#             todo write result to text

    d.app_stop(packageName)




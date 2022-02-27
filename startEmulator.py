import subprocess
import sys


def runEmulator():
    filepath = "D:/startE.bat"
    p = subprocess.Popen(filepath, shell=True, stdout=subprocess.PIPE)
    # p.communicate()
    # return subprocess.getoutput(adbCommand)



def closEmulator():
    subprocess.call("adb emu kill")


def runCommand(adbCommand):
    return subprocess.getoutput(adbCommand)
# **********************************************************************************
apkName = sys.argv[1]
# apkName = "sensorLeak.apk"
print(apkName)

runEmulator()

import time
time.sleep(6) # Sleep for 3 seconds

res = runCommand("adb install -r -g "+apkName)
print(res)






















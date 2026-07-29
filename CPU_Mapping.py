import psutil
from mss import MSS
import time

mem_usage = psutil.virtual_memory().percent
cpu_usage = psutil.cpu_percent()



x = 0

while x < 1:
    time.sleep(5)
    print("Memory Usage: " + str(mem_usage) + "%")
    print("CPU Usage: " + str(cpu_usage) + "%")
    
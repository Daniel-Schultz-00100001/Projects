import psutil
from mss import MSS
import time
import requests

mem_usage = psutil.virtual_memory().percent
cpu_usage = psutil.cpu_percent()

def send_alert(user_key, api_token, message, title):
    payload = {
        "token": api_token,
        "user": user_key,
        "message": message,
        "title": title
    }
    response = requests.post("https://api.pushover.net/1/messages.json", data=payload)
    return response

    if response.status_code == 200:
        print("Alert sent successfully!")
    else:
        print("Failed to send alert. Status code:", response.status_code)
x = 0
USER_KEY = "####"
API_TOKEN = "####"

while x < 1:
    time.sleep(5)
    print("Memory Usage: " + str(mem_usage) + "%")
    print("CPU Usage: " + str(cpu_usage) + "%")
    
    if mem_usage >= 90:
        send_alert(USER_KEY, API_TOKEN, "Memory usage is at 90% or above.", "High Memory Usage")
    
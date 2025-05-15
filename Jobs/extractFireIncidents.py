
# importing all necessary libraries
import requests
from datetime import datetime
import os



# --- Generate the date string ---
today_str = datetime.today().strftime('%Y%m%d')

# --- Define URL components ---
dataset_id = "wr8u-xric"
cache_bust = "1746351254"  # You can randomize this if needed. So far we assume it's static.
url = f"https://data.sfgov.org/api/views/{dataset_id}/rows.csv?fourfour={dataset_id}&cacheBust={cache_bust}&date={today_str}&accessType=DOWNLOAD"

print("Creating variables for URL")
print(f"dataset_id: {dataset_id} \ncache_bust:{cache_bust} \ntoday_str: {today_str}")
print(f"\nURL: {url}")



# --- Define local filename and save path ---
filename = f"Fire_Incidents_{today_str}.csv"
save_path = r"C:\Users\migoc\OneDrive\05 GITHUB\sf-fire\Data"
full_path = os.path.join(save_path, filename)



# --- Download and save the file ---
response = requests.get(url)

if response.status_code == 200:
    with open(full_path, 'wb') as f:
        f.write(response.content)
    print(f"✅ File saved to: {full_path}")
else:
    print(f"❌ Failed to download file. Status code: {response.status_code}")




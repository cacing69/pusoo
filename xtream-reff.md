How to retrieve and use IPTV live stream URLs

Assuming the following details:

URL: server.iptv
PORT: 8080
USERNAME: YOURUSERNAME
PASSWORD: YOURPASSWORD
1. Get all live channels
You can retrieve all live channels by making a request to the following URL:

http://server.iptv:8080/player_api.php?username=YOURUSERNAME&password=YOURPASSWORD&action=get_live_streams
2. JSON Response
The above request will return a JSON array similar to this:

[
  {
    "num": 1,
    "name": "CSPAN",
    "stream_type": "live",
    "stream_id": 135754,
    "stream_icon": "http://channel_icon/icon.png",
    "epg_channel_id": "cspan1.us",
    "added": "1593343679",
    "custom_sid": "",
    "tv_archive": 0,
    "direct_source": "",
    "tv_archive_duration": 0,
    "category_id": "3",
    "category_ids": [3],
    "thumbnail": ""
  },
  ...
]
3. Generate live stream URL
Once you have the stream_id from the response, you can construct the live stream URL as follows:

http://server.iptv:8080/live/YOURUSERNAME/YOURPASSWORD/STREAM_ID.ts
For example, using stream_id = 135754, the URL would be:

http://server.iptv:8080/live/YOURUSERNAME/YOURPASSWORD/135754.ts
Replace YOURUSERNAME and YOURPASSWORD with your actual credentials, and enjoy streaming!

Here a link to a documentation online: https://github.com/engenex/xtream-codes-api-v2/blob/main/%5BHow-To%5D%20Player%20API%20v2%20-%20Tutorials%20-%20Xtream%20Codes.pdf

https://github.com/engenex/xtream-codes-api-v2/blob/main/%5BHow-To%5D%20Player%20API%20v2%20-%20Tutorials%20-%20Xtream%20Codes.pdf

---

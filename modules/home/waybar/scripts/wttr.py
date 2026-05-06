#!/usr/bin/env python3
import json
import os
import time
import urllib.error
import urllib.request

# ── Config ────────────────────────────────────────────────────────────
LOCATION = "Kathmandu"
TIMEOUT = 15
RETRIES = 3
RETRY_DELAY = 2  # seconds between retries
CACHE_FILE = os.path.expanduser("~/.cache/waybar-weather.json")
CACHE_TTL = 1800  # seconds — reuse cache if fresh enough


# ── Weather code → icon ───────────────────────────────────────────────
def weather_icon(code: int) -> str:
    if code == 113:
        return "󰖙"
    if code == 116:
        return "󰖕"
    if code in (119, 122):
        return "󰖔"
    if code in (143, 248, 260):
        return "󰖑"
    if code in (176, 263, 266, 293, 296):
        return "󰖗"
    if code in (299, 302, 305, 308):
        return "󰖖"
    if code in (281, 284, 311, 314, 317, 320):
        return "󰖒"
    if code in (179, 323, 326, 329, 332, 335, 338):
        return "󰖘"
    if code in (200, 386, 389):
        return "󰖓"
    if code in (392, 395):
        return "󰙿"
    return "󰖙"


# ── Cache helpers ─────────────────────────────────────────────────────
def load_cache():
    try:
        with open(CACHE_FILE) as f:
            cached = json.load(f)
        if time.time() - cached.get("ts", 0) < CACHE_TTL:
            return cached.get("output")
    except Exception:
        pass
    return None


def save_cache(output: dict):
    try:
        os.makedirs(os.path.dirname(CACHE_FILE), exist_ok=True)
        with open(CACHE_FILE, "w") as f:
            json.dump({"ts": time.time(), "output": output}, f)
    except Exception:
        pass


# ── Fetch with retries ────────────────────────────────────────────────
def fetch_weather() -> dict:
    url = f"https://wttr.in/{LOCATION}?format=j1"
    req = urllib.request.Request(url, headers={"User-Agent": "waybar-wttr/1.0"})

    last_err = ""
    for attempt in range(RETRIES):
        try:
            with urllib.request.urlopen(req, timeout=TIMEOUT) as r:
                return json.loads(r.read().decode())
        except Exception as e:
            last_err = str(e)
            if attempt < RETRIES - 1:
                time.sleep(RETRY_DELAY)

    raise RuntimeError(last_err)


# ── Build output dict ─────────────────────────────────────────────────
def build_output(data: dict) -> dict:
    cur = data["current_condition"][0]
    temp_c = cur["temp_C"]
    feels_like = cur["FeelsLikeC"]
    humidity = cur["humidity"]
    wind_kmph = cur["windspeedKmph"]
    wind_dir = cur["winddir16Point"]
    desc = cur["weatherDesc"][0]["value"]
    icon = weather_icon(int(cur["weatherCode"]))

    today = data["weather"][0]
    tomorrow = data["weather"][1]
    tom_desc = tomorrow["hourly"][4]["weatherDesc"][0]["value"]
    tom_icon = weather_icon(int(tomorrow["hourly"][4]["weatherCode"]))

    text = f"{icon}  {temp_c}°C"
    tooltip = (
        f"{desc}  •  {LOCATION}\n"
        f"󰔏  Feels like {feels_like}°C\n"
        f"  Humidity {humidity}%\n"
        f"󰕊  Wind {wind_kmph} km/h {wind_dir}\n"
        f"\n"
        f"Today     {icon}  {today['mintempC']}° – {today['maxtempC']}°\n"
        f"Tomorrow  {tom_icon}  {tomorrow['mintempC']}° – {tomorrow['maxtempC']}°  {tom_desc}"
    )
    return {"text": text, "tooltip": tooltip, "class": "weather"}


# ── Main ──────────────────────────────────────────────────────────────
def main():
    # 1. try live fetch
    try:
        data = fetch_weather()
        output = build_output(data)
        save_cache(output)
        print(json.dumps(output))
        return
    except Exception as e:
        live_err = str(e)

    # 2. fall back to cache (stale is better than nothing)
    cached = load_cache()
    if cached:
        cached["text"] += "  󰦕"  # small indicator that data is stale
        print(json.dumps(cached))
        return

    # 3. nothing available
    print(json.dumps({"text": "󰖑  --", "tooltip": live_err, "class": "weather-error"}))


if __name__ == "__main__":
    main()

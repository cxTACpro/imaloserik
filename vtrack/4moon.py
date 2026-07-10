import random
import requests
import sys

# Determine boss type, player range, and optionally use command‑line arguments.
def _determine_parameters():
    """Return ``(boss_type, min_players, max_players)``.

    The function first checks ``sys.argv`` for values:
        ``sys.argv[1]`` – boss type (default ``NearMoon``)
        ``sys.argv[2]`` – minimum players (optional)
        ``sys.argv[3]`` – maximum players (optional)
    If any argument is missing, the user is prompted interactively.
    """
    default_type = "NearMoon"
    # Helper to safely convert a string to int or return ``None``.
    def _to_int(val: str | None) -> int | None:
        if val is None:
            return None
        try:
            return int(val)
        except ValueError:
            return None

    # Boss type
    if len(sys.argv) > 1 and sys.argv[1]:
        boss_type = sys.argv[1]
    else:
        try:
            boss_type = input(f"Enter boss type (NearMoon, FullMoon, Mirage) or press Enter for default [{default_type}]: ").strip() or default_type
        except Exception:
            boss_type = default_type

    # Minimum players
    if len(sys.argv) > 2:
        min_players = _to_int(sys.argv[2])
    else:
        try:
            raw_min = input("Enter minimum Players (or leave blank for no minimum): ").strip()
            min_players = int(raw_min) if raw_min else None
        except Exception:
            min_players = None

    # Maximum players
    if len(sys.argv) > 3:
        max_players = _to_int(sys.argv[3])
    else:
        try:
            raw_max = input("Enter maximum Players (or leave blank for no maximum): ").strip()
            max_players = int(raw_max) if raw_max else None
        except Exception:
            max_players = None

    return boss_type, min_players, max_players

boss_type, min_players, max_players = _determine_parameters()
url = f"http://163.223.9.144/boss/{boss_type}"

headers = {
    "Accept": "*/*",
    "Content-Type": "application/json",
    "Roblox-Game-Id": "",
    "Roblox-Session-Id": '{"GameId":""}',
    "User-Agent": "Vega X Android",
    "Vega-Fingerprint": "fc8c149a991eea0d"
}

payload = {
    "data": [
        {
            "Players": 6777,
            "Type": boss_type,
            "Original JobId": "",
            "JobId": "",
            "PlaceId": 100117331123089,
            "Sea": "Sea3"
        }
    ]
}

response = requests.post(url, headers=headers, json=payload)
response.raise_for_status()

data = response.json()

# Find the list of servers regardless of the key name.
# Find the list of servers regardless of the key name.
servers = None
for value in data.values():
    if isinstance(value, list):
        servers = value
        break

if not servers:
    print("No servers found.")
    exit()

# Build a list of (Players, JobId) tuples for each server entry that contains a JobId.
# ``Players`` may be missing or not an integer; we coerce to ``int`` when possible.
server_info = []
for server in servers:
    if isinstance(server, dict) and "JobId" in server:
        raw_players = server.get("Players")
        try:
            players = int(raw_players) if raw_players is not None else None
        except Exception:
            # If conversion fails, treat as unknown (None)
            players = None
        job_id = server["JobId"]
        server_info.append((players, job_id))

if not server_info:
    print("No JobIds found.")
    exit()

# Ask the user for a player count range to filter the servers.
def _prompt_int(prompt_msg: str, default: int | None = None) -> int | None:
    """Prompt for an integer, returning ``default`` if the input is empty.

    Returns ``None`` when the user provides no input and ``default`` is ``None``.
    """
    try:
        raw = input(prompt_msg).strip()
        if not raw:
            return default
        return int(raw)
    except ValueError:
        print(f"Invalid integer input: '{raw}'. Ignoring.")
        return default

# ``min_players`` and ``max_players`` are now obtained from the command‑line or
# interactive prompts via ``_determine_parameters`` above.

# Filter the server list based on the provided range.
# ``players`` may be ``None`` when the field is missing or non‑numeric.
# Include entries with ``None`` only when the user did not specify any range.
filtered_info = []
for players, jobid in server_info:
    if players is None:
        if min_players is None and max_players is None:
            filtered_info.append((players, jobid))
        continue
    if (min_players is None or players >= min_players) and (max_players is None or players <= max_players):
        filtered_info.append((players, jobid))

if not filtered_info:
    print("No servers match the specified player range.")
    exit()

count = min(10, len(filtered_info))

print(f"Random {count} servers (Players before JobId):\n")
for players, jobid in random.sample(filtered_info, count):
    print(f"Players: {players} | JobId: {jobid}\n")
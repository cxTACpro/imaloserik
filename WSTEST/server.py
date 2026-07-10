import asyncio, mimetypes
from pathlib import Path
from websockets import serve, Response
from websockets.http import Headers

PORT = 2004
clients = set()

async def broadcast(sender, message):
    for ws in clients.copy():
        if ws != sender:
            try: await ws.send(message)
            except: clients.discard(ws)

async def ws_handler(ws):
    clients.add(ws)
    print(f"[WS] + ({len(clients)} total)")
    try:
        async for msg in ws:
            print(f"[text] {msg[:120]}{'...' if len(msg)>120 else ''}")
            await broadcast(ws, msg)
    except:
        pass
    finally:
        clients.discard(ws)
        print(f"[WS] - ({len(clients)} total)")

async def http_handler(connection, request):
    if request.headers.get("Upgrade", "").lower() == "websocket":
        return None
    path = request.path
    if path == "/":
        path = "/script.html"
    filepath = Path(".") / path.lstrip("/")
    if ".." in str(filepath) or not filepath.is_file():
        return connection.respond(404, "Not Found")
    body = filepath.read_bytes()
    ctype, _ = mimetypes.guess_type(str(filepath))
    headers = Headers({"Content-Type": ctype or "application/octet-stream"})
    return Response(200, "OK", headers, body)

async def main():
    ws_server = await serve(ws_handler, "0.0.0.0", PORT,
                            process_request=http_handler)
    print(f"Serving http://localhost:{PORT}/  (ws://localhost:{PORT}/)")
    print(f"Open http://localhost:{PORT}/ in your browser")
    print("Press Ctrl+C to stop\n")
    try:
        await asyncio.Future()
    except (asyncio.CancelledError, KeyboardInterrupt):
        pass
    finally:
        ws_server.close()
        await ws_server.wait_closed()

if __name__ == "__main__":
    asyncio.run(main())

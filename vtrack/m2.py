import os
from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

scripts = {}
next_id = 1

@app.route("/")
def index():
    p = os.path.join(os.path.dirname(__file__), "script.html")
    return open(p, encoding="utf-8").read()

@app.route("/execute", methods=["POST"])
def execute():
    global next_id
    data = request.get_json(silent=True) or {}
    content = data.get("script", "")
    sid = next_id
    scripts[sid] = {"content": content, "checked": False}
    next_id += 1
    return jsonify({"success": True, "id": sid})

@app.route("/dpoint")
def dpoint():
    i = request.args.get("i")
    if i == "last":
        return jsonify({"last_id": next_id - 1 if next_id > 1 else 0})
    try:
        sid = int(i)
    except (ValueError, TypeError):
        return jsonify({"error": "invalid id"}), 400
    if sid in scripts:
        scripts[sid]["checked"] = True
        return f"--{{${sid}}}\n{scripts[sid]['content']}"
    return jsonify({"error": "not found"}), 404

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=2006, debug=True)

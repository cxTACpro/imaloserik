from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Allows connections from external tools like KRNL

# Global variable to store the number
stored_number = None

@app.route("/number", methods=["POST"])
def post_number():
    global stored_number
    
    # Print headers and raw body to the terminal for debugging
    print("Headers:", dict(request.headers))
    print("Raw Body:", request.data.decode("utf-8"))

    # Parse JSON body safely
    data = request.get_json(silent=True) or {}
    stored_number = data.get("number")

    return jsonify({
        "success": True,
        "received": stored_number
    })

@app.route("/number", methods=["GET"])
def get_number():
    global stored_number
    
    # Get the 's' parameter from the query string
    s_value = request.args.get("s")
    
    if s_value is not None:
        # Store the number from query parameter
        try:
            stored_number = int(s_value) if s_value.isdigit() else s_value
        except ValueError:
            stored_number = s_value
        
        return jsonify({
            "success": True,
            "received": stored_number,
            "source": "query_param",
            "param": s_value
        })
    else:
        # If no 's' parameter, return the stored number
        return jsonify({
            "success": True,
            "stored_number": stored_number
        })

@app.route("/", methods=["GET"])
def get_home():
    global stored_number
    # Display the number or "None" if empty
    display_value = stored_number if stored_number is not None else "None"
    return f"<h1>{display_value}</h1>"


if __name__ == "__main__":
    # host="0.0.0.0" allows other devices and executors on your network to connect
    app.run(host="0.0.0.0", port=3000, debug=True)
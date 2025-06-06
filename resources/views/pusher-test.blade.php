<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pusher Test</title>
    <script src="https://js.pusher.com/7.2/pusher.min.js"></script>
    <script>
        // Enable pusher logging - don't include this in production
        Pusher.logToConsole = true;

        var pusher = new Pusher('{{ env('PUSHER_APP_KEY') }}', {
            cluster: '{{ env('PUSHER_APP_CLUSTER') }}',
            forceTLS: true
        });

        var channel = pusher.subscribe('test-channel');
        channel.bind('App\\Events\\PusherTestEvent', function(data) {
            document.getElementById('messages').innerHTML += '<p>' + data.message + '</p>';
            console.log('Received message:', data);
        });
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }
        #messages {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            min-height: 200px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Pusher Test</h1>
        <p>This page will display messages received from Pusher on the 'test-channel'.</p>
        <p>Pusher App Key: {{ env('PUSHER_APP_KEY') }}</p>
        <p>Pusher App Cluster: {{ env('PUSHER_APP_CLUSTER') }}</p>

        <button onclick="window.location.href='/test-pusher'">Trigger Test Event</button>

        <div id="messages">
            <p><strong>Messages will appear here:</strong></p>
        </div>
    </div>
</body>
</html>

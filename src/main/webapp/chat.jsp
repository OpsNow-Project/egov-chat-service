<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>WebSocket 채팅</title>
    <link rel="stylesheet" href="css/chat.css">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script>
        let wsocket;
        let serverUrl, nickname;

        function connect() {
            wsocket = new WebSocket(serverUrl);
            wsocket.onopen = () => appendSystemMessage("✅ 서버에 연결되었습니다.");
            wsocket.onmessage = onMessage;
            wsocket.onclose = () => appendSystemMessage("❌ 연결이 종료되었습니다.");
        }

        function disconnect() {
            if (wsocket) wsocket.close();
        }

        function onMessage(evt) {
            const data = evt.data;
            if (data.startsWith("msg:")) {
                const parts = data.substring(4).split(":");
                const sender = parts[0];
                const message = parts.slice(1).join(":");
                const isMine = (sender === nickname);
                appendChatMessage(sender, message, isMine);
            }
        }

        function send() {
            const msg = $("#message").val().trim();
            if (msg && wsocket && wsocket.readyState === WebSocket.OPEN) {
                wsocket.send("msg:" + nickname + ":" + msg);
                $("#message").val("");
            }
        }

        function appendChatMessage(sender, message, isMine) {
            const time = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

            const bubble =
                '<div class="chat-line ' + (isMine ? 'mine' : 'other') + '">' +
                    (isMine ? '' : '<div class="sender">' + sender + '</div>') +
                    '<div class="message-bubble">' + message + '</div>' +
                    '<div class="timestamp">' + time + '</div>' +
                '</div>';

            $('#chatMessageArea').append(bubble);
            scrollToBottom();
        }

        function appendSystemMessage(message) {
            const time = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
            $("#chatMessageArea").append(
                `<div class="system-message">${time} ${message}</div>`
            );
            scrollToBottom();
        }

        function scrollToBottom() {
            const chatArea = $("#chatArea");
            chatArea.scrollTop(chatArea[0].scrollHeight);
        }

        $(document).ready(function () {
            const params = new URLSearchParams(window.location.search);
            serverUrl = decodeURIComponent(params.get("url"));
            nickname = decodeURIComponent(params.get("nick"));

            $("#nickname").text(nickname);
            connect();

            $('#message').keypress(function (event) {
                if (event.which === 13) {
                    send();
                    event.preventDefault();
                }
            });

            $('#sendBtn').click(send);
            $('#exitBtn').click(function () {
                disconnect();
                location.href = 'index.jsp';
            });
        });
    </script>
</head>
<body>
    <div class="chat-container">
        <div class="chat-header">
            💬 채팅 <span id="nickname" class="nickname"></span>
        </div>
        <div id="chatArea">
            <div id="chatMessageArea"></div>
        </div>
        <div class="chat-input-area">
            <input type="text" id="message" placeholder="메시지를 입력하세요" autocomplete="off">
            <button id="sendBtn">전송</button>
            <button id="exitBtn" class="exit">나가기</button>
        </div>
    </div>
</body>
</html>

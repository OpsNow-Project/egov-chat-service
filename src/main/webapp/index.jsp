<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String wsHost = "ws://" + request.getServerName() + ":" + request.getServerPort() + "/chat";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>WebSocket 접속</title>
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#enterBtn').click(function() {
                const serverUrl = $('#serverUrl').val();
                const nickname = $('#nickname').val();

                console.log("serverUrl:", serverUrl);
                console.log("nickname:", nickname);

                if (!serverUrl || !nickname) {
                    alert("서버 URL과 닉네임을 모두 입력하세요.");
                    return;
                }

                const redirectUrl = "chat.jsp?url=" + encodeURIComponent(serverUrl) + "&nick=" + encodeURIComponent(nickname);
                location.href = redirectUrl;
            });
        });
    </script>
</head>
<body>
    <div class="login-container">
        <h2>🗨️ 실시간 채팅방 입장</h2>
        <form onsubmit="return false;">
            <input type="hidden" id="serverUrl" value="<%= wsHost %>">
            
            <label for="nickname">닉네임</label>
            <input type="text" id="nickname" placeholder="닉네임을 입력하세요" autocomplete="off">
            
            <button id="enterBtn">입장하기</button>
        </form>
    </div>
</body>
</html>

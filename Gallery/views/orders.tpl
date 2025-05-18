<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>���������� �������</title>
</head>
<body>
    <h1>����������� ������</h1>
    <ul>
        % for order in orders:
            <li><strong>{{order['name']}}</strong>: {{order['description']}} � {{order['phone']}}</li>
        % end
    </ul>

    <h2>���������� ����� �����</h2>
    % if error:
        <p style="color: red">{{error}}</p>
    % end
    <form action="/orders" method="post">
        <label>��� / ����� ������: <input type="text" name="name"></label><br>
        <label>��������: <input type="text" name="description"></label><br>
        <label>�������: <input type="text" name="phone" placeholder="+7(999)123-45-67"></label><br>
        <button type="submit">����������</button>
    </form>
</body>
</html>

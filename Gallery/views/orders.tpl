<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Оформление заказов</title>
</head>
<body>
    <h1>Оформленные заказы</h1>
    <ul>
        % for order in orders:
            <li><strong>{{order['name']}}</strong>: {{order['description']}} — {{order['phone']}}</li>
        % end
    </ul>

    <h2>Разместить новый заказ</h2>
    % if error:
        <p style="color: red">{{error}}</p>
    % end
    <form action="/orders" method="post">
        <label>Имя / Номер заказа: <input type="text" name="name"></label><br>
        <label>Описание: <input type="text" name="description"></label><br>
        <label>Телефон: <input type="text" name="phone" placeholder="+7(999)123-45-67"></label><br>
        <button type="submit">Разместить</button>
    </form>
</body>
</html>

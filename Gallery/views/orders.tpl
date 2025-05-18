<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Placement</title>
</head>
<body>
    <h1>Placed Orders</h1>
    <ul>
        % for order in orders:
            <li><strong>{{order['name']}}</strong>: {{order['description']}} — {{order['phone']}}</li>
        % end
    </ul>

    <h2>Place a New Order</h2>
    % if error:
        <p style="color: red">{{error}}</p>
    % end
    <form action="/orders" method="post">
        <label>Name / Order Number: <input type="text" name="name"></label><br>
        <label>Description: <input type="text" name="description"></label><br>
        <label>Phone: <input type="text" name="phone" placeholder="+7(999)123-45-67"></label><br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>

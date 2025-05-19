<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Размещение заказов</title>
    <link rel="stylesheet" href="/static/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        .back-button {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            background-color: #ff9800;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        }

        .back-button:hover {
            background-color: #e67e00;
            transform: scale(1.05);
            color: #fff;
        }

        .orders-list li {
            animation: fadeInUp 0.6s ease forwards;
            opacity: 0;
            margin-bottom: 1em;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            .back-button {
                font-size: 13px;
                padding: 8px 16px;
            }

            header h1 {
                font-size: 2rem;
            }

            h2 {
                font-size: 1.6rem;
            }

            .order-form {
                padding: 25px;
            }
        }
    </style>
</head>
<body>

<header>
    <a href="/" class="back-button">← Назад в меню</a>
    <h1>Размещённые заказы</h1>
</header>

<main>
    <section class="orders-list">
        <ul>
            % for i, order in enumerate(orders, 1):
                <li>
                    <strong>👤 Имя: {{ order['name'] }}</strong><br>
                    <span>🔢 № заказа: {{ i }}</span><br>
                    <span>📝 Описание: {{ order['description'] }}</span><br>
                    <em>📞 Телефон: {{ order['phone'] }}</em>
                </li>
            % end
        </ul>
    </section>

    <section class="order-form-section">
        <h2>📋 Создать новый заказ</h2>

        % if error:
            <p class="error-message">⚠️ {{ error }}</p>
        % end

        <form action="/orders" method="post" class="order-form">
            <div class="form-group">
                <label for="name">Имя:</label>
                <input type="text" id="name" name="name" required
                       pattern="[A-Za-z]{2,50}"
                       title="Только латинские буквы, от 2 до 50 символов, без пробелов и цифр">
            </div>

            <div class="form-group">
                <label for="description">Описание:</label>
                <input type="text" id="description" name="description" required
                       pattern=".{8,100}"
                       title="От 8 до 100 символов">
            </div>

            <div class="form-group">
                <label for="phone">Телефон:</label>
                <input type="text" id="phone" name="phone" placeholder="+7(999)123-45-67" required
                       pattern="\+7\(\d{3}\)\d{3}-\d{2}-\d{2}"
                       title="Введите номер в формате +7(999)123-45-67">
            </div>

            <button type="submit">📨 Отправить заказ</button>
        </form>
    </section>
</main>

<footer>
    <p>&copy; 2025 Размещение заказов. Все права защищены.</p>
    <p>📬 Связь: <a href="mailto:support@example.com" style="color:#ff9800;">support@example.com</a></p>
</footer>

</body>
</html>

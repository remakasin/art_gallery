<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Размещение заказов</title>
    <link rel="stylesheet" href="/static/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Кнопка "Назад в меню" (в виде настоящей кнопки, справа) */
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

        /* Анимация появления карточек заказов */
        .orders-list li {
            animation: fadeInUp 0.6s ease forwards;
            opacity: 0;
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

        /* Дополнительно для мобильной адаптивности */
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
            % for order in orders:
                <li>
                    <strong>📦 Заказ: {{ order['name'] }}</strong>
                    <span>📝 {{ order['description'] }}</span>
                    <em>📞 {{ order['phone'] }}</em>
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
                <label for="name">Имя / Номер заказа:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="description">Описание:</label>
                <input type="text" id="description" name="description" required>
            </div>

            <div class="form-group">
                <label for="phone">Телефон:</label>
                <input type="text" id="phone" name="phone" placeholder="+7(999)123-45-67" required>
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

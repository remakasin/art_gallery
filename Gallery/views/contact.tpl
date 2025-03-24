<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/styles.css">
</head>
<body>
    <header>
        <div class="container">
            <h1>Art-Visual Gallery</h1>
            <nav>
                <a href="/">Home</a>
                <a href="/collection">Collection</a>
                <a href="/contact">Contact</a>
            </nav>
        </div>
    </header>
    <main>
        <div class="container">
            <h2>Contact Us</h2>
            <p>Address: 123 Art Street, Artist City</p>
            <p>Phone: +123-456-7890</p>
            <p>Email: info@artvisualgallery.com</p>
            <form action="/submit_contact" method="POST">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required><br><br>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required><br><br>
                
                <label for="message">Message:</label>
                <textarea id="message" name="message" required></textarea><br><br>
                
                <button type="submit">Submit</button>
            </form>
        </div>
    </main>
</body>
</html>

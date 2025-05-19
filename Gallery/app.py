from bottle import Bottle, route, run, template, static_file, request

from orders import orders

# Create an instance of the application
app = Bottle()

orders = [
    {
        'name': '#1001',
        'description': 'Website development',
        'phone': '+1(555)123-4567'
    },
    {
        'name': '#1002',
        'description': 'Mobile app design',
        'phone': '+1(555)987-6543'
    },
    {
        'name': '#1003',
        'description': 'SEO optimization',
        'phone': '+1(555)456-7890'
    },
    {
        'name': '#1004',
        'description': 'E-commerce platform',
        'phone': '+1(555)789-0123'
    },
    {
        'name': '#1005',
        'description': 'Content marketing',
        'phone': '+1(555)234-5678'
    }
]

# Route for the homepage
@app.route('/')
def index():
    return template('views/index.tpl')

# Route for the collection page
@app.route('/collection')
def collection():
    return template('views/collection.tpl')

# Route for the contact page
@app.route('/contact')
def contact():
    return template('views/contact.tpl')

@app.route('/orders')
def show_orders():
    error = request.query.get('error', '')
    return template('views/orders.tpl', orders=orders, error=error)

@app.post('/orders')
def place_order():
    name = request.forms.get('name')
    description = request.forms.get('description')
    phone = request.forms.get('phone')

    if not name or not phone:
        return template('views/orders.tpl', orders=orders, error="Имя и телефон обязательны!")

    # Добавляем новый заказ
    new_order = {
        'name': name,
        'description': description,
        'phone': phone
    }
    orders.append(new_order)

    # Перенаправляем обратно на страницу заказов
    return template('views/orders.tpl', orders=orders, error=None)


# Route for handling contact form submission
@app.route('/submit_contact', method='POST')
def submit_contact():
    name = request.forms.get('name')
    email = request.forms.get('email')
    message = request.forms.get('message')
    # Here you can add logic to save the data (e.g., to a database)
    return f"Thank you, {name}, your message has been received!"

# Route for static files (images)
@app.route('/static/<filename:path>')
def serve_static(filename):
    return static_file(filename, root='static/')

# Run the application
if __name__ == '__main__':
    run(app, host='localhost', port=8080, debug=True)

from bottle import Bottle, run, template, request, redirect
import json
import os
import re

app = Bottle()
DATA_FILE = 'orders.json'

def load_orders():
    if not os.path.exists(DATA_FILE):
        return []
    with open(DATA_FILE, 'r', encoding='utf-8') as f:
        return json.load(f)

def save_orders(orders):
    with open(DATA_FILE, 'w', encoding='utf-8') as f:
        json.dump(orders, f, ensure_ascii=False, indent=4)

def is_valid_phone(phone):
    return re.match(r'^\+7\(\d{3}\)\d{3}-\d{2}-\d{2}$', phone)

@app.route('/orders', method=['GET', 'POST'])
def orders():
    if request.method == 'POST':
        name = request.forms.get('name').strip()
        description = request.forms.get('description').strip()
        phone = request.forms.get('phone').strip()

        if not name or not description or not is_valid_phone(phone):
            return template('orders', orders=load_orders(), error="Все поля обязательны. Телефон должен быть в формате +7(999)123-45-67")
        
        orders = load_orders()
        orders.append({
            'name': name,
            'description': description,
            'phone': phone
        })
        save_orders(orders)
        return redirect('/orders')

    return template('orders', orders=load_orders(), error=None)

if __name__ == '__main__':
    run(app, host='localhost', port=8080, debug=True)

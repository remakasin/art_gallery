from bottle import Bottle, route, run, template, static_file, request # type: ignore

# Create an instance of the application
app = Bottle()

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

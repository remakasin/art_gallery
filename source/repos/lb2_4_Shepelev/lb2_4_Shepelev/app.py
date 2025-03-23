"""
This script runs the application using a development server.
It contains the definition of routes and views for the application.
"""

import os
import sys
from bottle import default_app, redirect, route, template

# Включение режима отладки
if '--debug' in sys.argv[1:] or 'SERVER_DEBUG' in os.environ:
    # Debug mode will enable more verbose output in the console window.
    # It must be set at the beginning of the script.
    import bottle
    bottle.debug(True)

@route('/')
def hello():
    """Перенаправляет на /hello/world."""
    redirect('/hello/world')

@route('/hello/<name>')
def example(name):
    """Отображает страницу с именем, указанным в URL."""
    return template('<b>Hello {{name}}</b>!', name=name)

@route('/hello/world')
def hello_world():
    """Отображает приветственную страницу для /hello/world."""
    return "<h1>Hello, World!</h1>"

def wsgi_app():
    """Returns the application to make available through wfastcgi. This is used
    when the site is published to Microsoft Azure."""
    return default_app()

if __name__ == '__main__':
    # Запуск локального тестового сервера
    HOST = os.environ.get('SERVER_HOST', 'localhost')
    try:
        PORT = int(os.environ.get('SERVER_PORT', '5555'))
    except ValueError:
        PORT = 8080
    import bottle
    bottle.run(server='wsgiref', host=HOST, port=PORT)
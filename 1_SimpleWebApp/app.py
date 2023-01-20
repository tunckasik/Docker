import os
from flask import Flask
app = Flask(__name__)
mysql = MySQL()
mysql_database_host = 'MYSQL_DATABASE_HOST' in os.environ and os.environ['MYSQL_DATABASE_HOST'] or  'localhost'
# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'shop'
app.config['MYSQL_DATABASE_HOST'] = mysql_database_host
mysql.init_app(app)
conn = mysql.connect()
cursor = conn.cursor()
@app.route("/")
def main():
    return "Welcome!"

@app.route('/bronze')
def hello():
    return 'Welcome to Bronze Clouds'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)

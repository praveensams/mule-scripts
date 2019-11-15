from flask import Flask
from subprocess import *
from re import *
app = Flask(__name__)

@app.route("/")
def hello():
        s=Popen('host -i mule-worker-internal-prod-payment-processing-v1.uk-e1.cloudhub.io',stdout=PIPE,shell=True).communicate()
        k=findall(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}',str(s))
        return "{0}".format(k)

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=7070)

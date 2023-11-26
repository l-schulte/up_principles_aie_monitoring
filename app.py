from random import randint
from flask import Flask

from prometheus_client import Summary, Counter
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from prometheus_client import make_wsgi_app


app = Flask(__name__)

app.wsgi_app = DispatcherMiddleware(app.wsgi_app, {
    '/metrics': make_wsgi_app()
})

REQUEST_TIME = Summary('request_processing_seconds',
                       'Time spent processing request')
ROLL_COUNTER = Counter(
    'roll_count', 'Number of tosses per value', ['value'])


@app.route("/rolldice")
@REQUEST_TIME.time()
def roll_dice():
    return roll()


def roll():
    res = str(randint(1, 6))
    ROLL_COUNTER.labels(res).inc()
    return res

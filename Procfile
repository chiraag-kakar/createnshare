release: python manage.py migrate

web: gunicorn createnshare.wsgi --log-file -

worker: python manage.py rqworker default
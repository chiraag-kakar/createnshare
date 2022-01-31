FROM python:3-slim-buster
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt /app
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . /app
RUN python manage.py collectstatic --noinput --clear
# Run as non-root user
RUN chown -R django:django /app
USER django

# Run application
CMD gunicorn django_heroku.wsgi:application
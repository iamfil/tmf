FROM python:3

ENV PYTHONUNBUFFERED 1

RUN mkdir /code

WORKDIR /code

ADD requirements.txt /code/

RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt

ADD . /code/

EXPOSE 80
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]

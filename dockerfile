FROM python:3.12-slim


# Doesn't Create __pycache__
ENV PYTHONDONTWRITEBYTECODE=1
# For Instant Logs
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y curl build-essential


# Install poetry --> Note By Abhishek -> This is used for better package management 
RUN curl -sSL https://install.python-poetry.org | python3 - && \
    ln -s /root/.local/bin/poetry /usr/local/bin/poetry 


WORKDIR /app
# Caching Dependencies
COPY pyproject.toml poetry.lock /app/

RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi --no-root


COPY . /app
EXPOSE 8000


CMD ["uvicorn" , "src.main:app" , "--host" , "0.0.0.0" , "--port" , "8000"]

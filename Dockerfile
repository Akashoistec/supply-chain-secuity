FROM python: 3.11-slim

WORKDIR /app

#Prevent python from writing .pyc files
ENV PYRHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

#Install only runtime deps (none for now)
# RUN apt-get update && apt-get install -y --no-install-recommends \
# ca-certificates \
# && rm -rf /var/lib/apt/lists/*

COPY . .

# Create non-root user

RUN useradd -m appuser

USER appuser

CMD ["python", "-c", "print('container started')"]

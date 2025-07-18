FROM python:3.11-slim-bullseye
WORKDIR /app
RUN apt-get update && apt-get install -y git

# Clone the repository
RUN git clone https://github.com/donpatatakiller/UnHided .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 7860
CMD ["uvicorn", "run:main_app", "--host", "0.0.0.0", "--port", "7860", "--workers", "4"]
FROM python:3.7.3-stretch

## Step 1:
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . app.py /app/

RUN apt update 
RUN apt install g++ 
RUN apt install build-essential

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]
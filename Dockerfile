# Pull Python base image
FROM python:3.10

# Copy application files
ADD /src_api /src_api/

# Copy the .whl file from dist to /src_api/
COPY dist/ /src_api/dist/

# Specify working directory
WORKDIR /src_api

# Update pip
RUN pip install --upgrade pip

# Install dependencies (including the .whl file)
RUN pip install -r requirements.txt

# Expose port for application
EXPOSE 8001

# Start FastAPI application
CMD ["python", "app/main.py"]

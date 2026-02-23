# Platform Services API

A FastAPI-based REST API service.

## Prerequisites

- Python 3.14+ (currently using Python 3.14.2)
- pip (Python package installer)

## Setup

### 1. Create a Virtual Environment

It's recommended to use a virtual environment to isolate project dependencies:

```bash
python3 -m venv venv
```

### 2. Activate the Virtual Environment

**On macOS/Linux:**

```bash
source venv/bin/activate
```

**On Windows:**

```bash
venv\Scripts\activate
```

### 3. Install Dependencies

If you have a `requirements.txt` file:

```bash
pip install -r requirements.txt
```

If you're setting up for the first time, install the core dependencies:

```bash
pip install fastapi uvicorn[standard]
```

## Managing Packages

### Adding a New Package

1. **Install the package:**

   ```bash
   pip install <package-name>
   ```

   Example:

   ```bash
   pip install requests
   ```

2. **Update requirements.txt:**

   ```bash
   pip freeze > requirements.txt
   ```

   Or manually add the package to `requirements.txt`:

   ```
   <package-name>==<version>
   ```

### Changing/Updating Packages

1. **Update a specific package:**

   ```bash
   pip install --upgrade <package-name>
   ```

2. **Update all packages:**

   ```bash
   pip install --upgrade -r requirements.txt
   ```

3. **Update requirements.txt after changes:**
   ```bash
   pip freeze > requirements.txt
   ```

### Removing a Package

1. **Uninstall the package:**

   ```bash
   pip uninstall <package-name>
   ```

2. **Update requirements.txt:**
   ```bash
   pip freeze > requirements.txt
   ```

### Best Practices

- Always update `requirements.txt` after adding, updating, or removing packages
- Pin specific versions in `requirements.txt` for reproducible builds
- Review `requirements.txt` before committing changes
- Use `pip freeze` to capture exact versions, or manually specify version ranges (e.g., `package>=1.0,<2.0`)

## Running Locally

### Development Server

Run the FastAPI application using uvicorn:

```bash
uvicorn main:app --reload
```

The `--reload` flag enables auto-reload on code changes, which is useful during development.

### Access the API

Once the server is running, you can access:

- **API**: http://localhost:8000
- **Interactive API Documentation (Swagger UI)**: http://localhost:8000/docs
- **Alternative API Documentation (ReDoc)**: http://localhost:8000/redoc

### Custom Port and Host

To run on a different port or host:

```bash
uvicorn main:app --host 0.0.0.0 --port 8080 --reload
```

test

### Production Mode

For production, run without the `--reload` flag:

```bash
uvicorn main:app --host 0.0.0.0 --port 8000
```

## Project Structure

```
platform-services-api/
├── main.py              # FastAPI application entry point
├── requirements.txt     # Python dependencies (create if needed)
├── venv/               # Virtual environment (gitignored)
└── README.md           # This file
```

## Example API Endpoints

- `GET /` - Returns a greeting message
- `GET /items/{item_id}` - Returns item details with optional query parameter

## Troubleshooting

### Port Already in Use

If port 8000 is already in use, specify a different port:

```bash
uvicorn main:app --port 8001 --reload
```

### Virtual Environment Issues

If you encounter import errors, make sure:

1. Your virtual environment is activated
2. Dependencies are installed: `pip install -r requirements.txt`
3. You're using the correct Python interpreter

### Package Installation Issues

If package installation fails:

- Ensure you have the latest pip: `pip install --upgrade pip`
- Check your internet connection
- Verify the package name is correct
- Some packages may require system dependencies (e.g., `gcc` on Linux)

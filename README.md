# DevOps Project: Flask Web Application

This project demonstrates a simple Flask web application with automated deployment using various DevOps tools and practices.

## Project Structure

```
devops-project/
│
├── app.py                 # Main Flask application
├── requirements.txt       # Python dependencies
├── Dockerfile             # Instructions for building Docker image
├── docker-compose.yml     # Docker Compose configuration
├── deploy.sh              # Deployment script
├── playbook_macos.yml     # Ansible playbook for MacOS
├── inventory_local.ini    # Ansible inventory file
├── .github/
│   └── workflows/
│       └── ci-cd.yml      # GitHub Actions workflow
└── tests/
    └── test_app.py        # Unit tests for the Flask app
```

## Setup

1. Clone the repository:
   ```
   git clone https://github.com/your-username/devops-project.git
   cd devops-project
   ```

2. Install dependencies:
   ```
   pip install -r requirements.txt
   ```

3. Set up Ansible (for MacOS):
   ```
   brew install ansible
   ```

## Running the Application

You can use the `deploy.sh` script to manage the application:

- To start the application:
  ```
  ./deploy.sh start
  ```

- To stop the application:
  ```
  ./deploy.sh stop
  ```

- To run tests:
  ```
  ./deploy.sh test
  ```

Alternatively, you can use Docker Compose directly:

```
docker-compose up --build
```

The application will be available at `http://localhost:5001`.

## Running Tests

To run the tests manually:

```
python -m pytest tests/
```

## CI/CD

This project uses GitHub Actions for CI/CD. The workflow is defined in `.github/workflows/ci-cd.yml`. It performs the following steps on each push to the main branch:

1. Sets up the Python environment
2. Installs dependencies
3. Runs tests
4. Builds a Docker image
5. (Placeholder for future deployment steps)

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
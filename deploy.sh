#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Define variables
REPO_DIR="$HOME/devops-project"
ANSIBLE_PLAYBOOK="playbook_macos.yml"
INVENTORY_FILE="inventory_local.ini"

# Function to run Ansible playbook
run_ansible() {
    echo "Running Ansible playbook..."
    ansible-playbook -i $INVENTORY_FILE $ANSIBLE_PLAYBOOK
}

# Function to build and run Docker containers
deploy_docker() {
    echo "Deploying with Docker..."
    cd $REPO_DIR
    docker-compose up --build -d
}

# Function to stop Docker containers
stop_docker() {
    echo "Stopping Docker containers..."
    cd $REPO_DIR
    docker-compose down
}

# Function to run tests
run_tests() {
    echo "Running tests..."
    pytest tests/
}

# Function to display usage information
usage() {
    echo "Usage: $0 [start|stop|test]"
    echo "  start: Start the application (default)"
    echo "  stop: Stop the application"
    echo "  test: Run tests"
}

# Main deployment process
main() {
    local action=${1:-start}

    case $action in
        start)
            echo "Starting deployment process..."
            cd $REPO_DIR
            run_ansible
            run_tests
            deploy_docker
            echo "Deployment completed successfully!"
            ;;
        stop)
            echo "Stopping the application..."
            stop_docker
            echo "Application stopped successfully!"
            ;;
        test)
            echo "Running tests..."
            run_tests
            echo "Tests completed!"
            ;;
        *)
            usage
            exit 1
            ;;
    esac
}

# Run the main function with command line argument
main "$@"
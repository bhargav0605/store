# Adding a new microservice

This document outlines the steps required to add a new microservice to the Online Boutique application.

## 1. Create a new directory

Create a new directory for your microservice within the `src/` directory. The directory name should be the name of your microservice.

## 2. Add source code

Place your microservice's source code inside the newly created directory. The structure of this directory should follow the conventions of the existing microservices. For example, a Python-based service would include at minimum the following files:

- `README.md`: The service's description and documentation.
- `main.py`: The application's entry point.
- `requirements.in`: A list of Python dependencies.

Take a look at existing microservices for inspiration.

## 3. Update the documentation

Finally, update the project's documentation to reflect the addition of your new microservice. This may include:

- Adding a section to the main `README.md` if the service introduces significant new functionality.
- Updating the architecture diagrams in the `docs/img` directory.
- Adding a new document in the `docs` directory if the service requires detailed explanation.

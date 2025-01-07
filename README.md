# Booking Application

Welcome to the Booking Application! This application is designed to help users manage events and book tickets seamlessly. Below you'll find all the necessary information to get started with the application.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [Testing](#testing)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

## Requirements

- **Ruby version**: 3.3.4
- **Rails version**: 8.0.1
- **Database**: PostgreSQL
- **Web Server**: Puma
- **JavaScript**: Importmap, Turbo, Stimulus

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/booking.git
   cd booking
   ```

2. Install the required gems:
   ```bash
   bundle install
   ```

3. Install JavaScript dependencies:
   ```bash
   bin/importmap
   ```

## Configuration

- Copy the example environment file and edit as needed:
  ```bash
  cp .env.example .env
  ```

- Ensure you have the correct database credentials in `config/database.yml`.

## Database Setup

1. Create and setup the database:
   ```bash
   bin/rails db:create db:migrate db:seed
   ```

## Running the Application

- Start the Rails server:
  ```bash
  bin/dev
  ```

- Visit `http://localhost:3000` in your browser to access the application.

## Testing

- Run the test suite:
  ```bash
  bin/rails test
  ```

- For system tests, ensure you have a browser driver installed (e.g., ChromeDriver for Selenium).

## Deployment

- This application is Docker-ready. Build and run the Docker container:
  ```bash
  docker build -t booking .
  docker run -d -p 80:80 -e RAILS_MASTER_KEY=<your-master-key> --name booking booking
  ```

- For production deployments, consider using Kamal for streamlined deployment processes.

## Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

Thank you for using the Booking Application! If you have any questions or need further assistance, feel free to reach out.

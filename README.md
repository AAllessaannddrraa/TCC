
# ApoiAR System

A complete system for managing caregiving services, including user registration, caregiver-patient connections, and payment processing.

## Features

- User authentication and roles (Admin, Client, Caregiver).
- Request creation and management.
- Payment processing with multiple methods (Credit Card, Boleto, Pix).
- Real-time notifications.
- Administrative dashboard with key metrics and reports.

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd apoiar_system
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rails db:create db:migrate db:seed
   ```

4. Run the server:
   ```bash
   rails server
   ```

5. Access the application at `http://localhost:3000`.

## Testing

Run the test suite with:
```bash
rspec --format documentation
```

## Deployment

1. Set up a hosting platform like Heroku or Render.
2. Configure the environment variables for the database and API keys.
3. Push the repository to the hosting platform.

## Contributing

Feel free to fork and contribute!

## License

This project is licensed under the MIT License.

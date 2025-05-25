# NMS Backend - Login & Signup System

A complete authentication system built with Spring Boot backend and modern HTML/CSS/JavaScript frontend.

## Features

### Backend (Spring Boot)
- **User Registration & Login** with JWT authentication
- **Password Encryption** using BCrypt
- **Input Validation** with Bean Validation
- **Database Integration** with JPA/Hibernate (H2 or MySQL)
- **RESTful API** endpoints
- **CORS Configuration** for frontend integration
- **Security Configuration** with Spring Security

### Frontend (HTML/CSS/JavaScript)
- **Modern, Responsive Design** with gradient backgrounds and animations
- **Real-time Form Validation** with error messages
- **Loading States** with spinners during API calls
- **JWT Token Management** with localStorage
- **Dashboard** with user information display
- **Dark Mode Support** based on system preferences
- **Mobile-Friendly** responsive design

## Tech Stack

- **Backend**: Spring Boot 3.5.0, Spring Security, Spring Data JPA
- **Database**: H2 (in-memory) or MySQL
- **Authentication**: JWT (JSON Web Tokens)
- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Build Tool**: Maven

## Prerequisites

- Java 17 or higher
- Maven 3.6 or higher
- (Optional) MySQL 8.0 or higher

## Quick Start

### Option 1: Run with H2 Database (Recommended for Development)

This is the easiest option - no database installation required!

**Windows:**
```bash
run-with-h2.bat
```

**Linux/macOS:**
```bash
chmod +x run-with-h2.sh
./run-with-h2.sh
```

**Or manually:**
```bash
mvn spring-boot:run -Dspring-boot.run.profiles=h2
```

With H2, you can access:
- **Application**: `http://localhost:8080`
- **Database Console**: `http://localhost:8080/h2-console`
  - JDBC URL: `jdbc:h2:mem:nms_db`
  - Username: `sa`
  - Password: (leave empty)

### Option 2: Run with MySQL Database

If you prefer MySQL, see `MYSQL_SETUP.md` for detailed setup instructions.

1. Install and setup MySQL
2. Create database: `CREATE DATABASE nms_db;`
3. Run: `mvn spring-boot:run`

## Setup Instructions

### 1. Database Setup

You have two options for the database:

#### Option A: H2 In-Memory Database (Recommended for Development)
- ✅ No installation required
- ✅ Automatic setup
- ✅ Perfect for development and testing
- ✅ Data resets on restart (good for testing)

#### Option B: MySQL Database
- ✅ Production-ready
- ✅ Persistent data storage
- ❌ Requires MySQL installation
- See `MYSQL_SETUP.md` for setup instructions

### 2. Backend Setup

1. Clone the repository and navigate to the project directory
2. Install dependencies:
```bash
mvn clean install
```

3. Run the application:

**With H2 (Recommended):**
```bash
mvn spring-boot:run -Dspring-boot.run.profiles=h2
```

**With MySQL:**
```bash
mvn spring-boot:run
```

The backend will start on `http://localhost:8080`

### 3. Frontend Access

Once the backend is running, you can access:

- **Login Page**: `http://localhost:8080/login.html`
- **Signup Page**: `http://localhost:8080/signup.html`
- **Dashboard**: `http://localhost:8080/dashboard.html` (after login)

## API Endpoints

### Authentication Endpoints

#### POST /api/auth/signup
Register a new user.

**Request Body:**
```json
{
    "username": "john_doe",
    "email": "john@example.com",
    "password": "password123"
}
```

**Response:**
```json
{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "type": "Bearer",
    "username": "john_doe",
    "email": "john@example.com",
    "message": "User registered successfully"
}
```

#### POST /api/auth/login
Authenticate an existing user.

**Request Body:**
```json
{
    "username": "john_doe",
    "password": "password123"
}
```

**Response:**
```json
{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "type": "Bearer",
    "username": "john_doe",
    "email": "john@example.com",
    "message": "Login successful"
}
```

## Project Structure

```
src/
├── main/
│   ├── java/com/example/nms_backend/
│   │   ├── config/
│   │   │   ├── JwtAuthenticationFilter.java
│   │   │   └── SecurityConfig.java
│   │   ├── controller/
│   │   │   ├── AuthController.java
│   │   │   └── WebController.java
│   │   ├── dto/
│   │   │   ├── AuthResponse.java
│   │   │   ├── LoginRequest.java
│   │   │   └── SignupRequest.java
│   │   ├── entity/
│   │   │   └── User.java
│   │   ├── repository/
│   │   │   └── UserRepository.java
│   │   ├── service/
│   │   │   └── UserService.java
│   │   ├── util/
│   │   │   └── JwtUtil.java
│   │   └── NmsBackendApplication.java
│   └── resources/
│       ├── static/
│       │   ├── css/
│       │   │   ├── auth.css
│       │   │   └── dashboard.css
│       │   ├── js/
│       │   │   ├── auth.js
│       │   │   └── dashboard.js
│       │   ├── dashboard.html
│       │   ├── login.html
│       │   └── signup.html
│       ├── application.properties (MySQL config)
│       └── application-h2.properties (H2 config)
```

## Usage

1. **Start the application** using one of the run commands above
2. **Navigate to** `http://localhost:8080` (redirects to login)
3. **Create an account** by clicking "Sign up here"
4. **Fill in the registration form** with valid data
5. **Login** with your credentials
6. **Access the dashboard** after successful authentication

## Troubleshooting

### MySQL Connection Issues
If you get MySQL connection errors:
1. Make sure MySQL is running
2. Check username/password in `application.properties`
3. Verify database `nms_db` exists
4. **Alternative**: Use H2 database instead (see Quick Start)

### Port Already in Use
If port 8080 is busy:
```bash
# Find process using port 8080
netstat -ano | findstr :8080  # Windows
lsof -i :8080                 # Linux/macOS

# Kill the process or change port in application.properties
server.port=8081
```

## Development Notes

- **H2 Database**: Data is stored in memory and resets on restart
- **MySQL Database**: Data persists between restarts
- **CORS is enabled** for all origins (should be restricted in production)
- **JWT secret** should be externalized and secured in production
- **Database credentials** should be externalized using environment variables

## Future Enhancements

- Email verification for new accounts
- Password reset functionality
- Role-based access control (RBAC)
- OAuth2 integration (Google, GitHub, etc.)
- Account lockout after failed attempts
- Password strength requirements
- Session management
- Audit logging

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License. 
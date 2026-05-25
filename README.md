# Airline Reservation System

A web-based Airline Reservation System developed using Java, JSP/Servlets, MySQL, and Apache Tomcat.

## Features

- User flight booking
- Passenger registration
- Flight reservation management
- Booking database integration
- JSP-based frontend
- MySQL backend support

## Technologies Used

- Java
- JSP 
- MySQL
- Apache Tomcat
- Eclipse IDE

## Project Structure

AirlineReservation/
├── src/
├── images/
├── build/
└── ...
Database file:

javatest.sql
## How to Run

### 1. Clone the Repository

git clone https://github.com/lwinmon/AirlineReservation.git
### 2. Import into Eclipse

- Open Eclipse
- File → Import → Existing Projects into Workspace
- Select the cloned project folder

### 3. Setup MySQL Database

Open MySQL and run:

CREATE DATABASE javatest;
Then import the javatest.sql file into MySQL.

### 4. Configure Database Connection

Update your database username and password in the project configuration if needed.

Example:

String url = "jdbc:mysql://localhost:3306/javatest";
String username = "root";
String password = "yourpassword";
### 5. Run on Apache Tomcat

- Add the project to Tomcat Server
- Start the server
- Open in browser:

http://localhost:8080/AirlineReservation/

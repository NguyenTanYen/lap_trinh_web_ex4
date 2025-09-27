# Database Setup Instructions

## Prerequisites
1. MySQL Server must be running on your system
2. Default MySQL port should be 3306
3. You should have root access to MySQL

## Database Setup Steps

### 1. Connect to MySQL
```bash
mysql -u root -p
```

### 2. Create Database and User
```sql
CREATE DATABASE aisolution_db;
USE aisolution_db;
```

### 3. Run the Schema Script
Execute the `DB.sql` file in MySQL:
```bash
mysql -u root -p < DB.sql
```

### 4. Verify Database Creation
```sql
SHOW TABLES;
SELECT * FROM users LIMIT 5;
```

## Alternative: Use MySQL Workbench
1. Open MySQL Workbench
2. Connect to your MySQL server
3. Open and execute the `DB.sql` file
4. Verify the database and tables are created

## Troubleshooting

### If you get "Access denied" error:
- Make sure MySQL is running
- Check your root password
- Verify the connection details in `application.properties`

### If you get "Database doesn't exist" error:
- Make sure you've created the `aisolution_db` database
- Check the database name in `application.properties`

### If you get "Table doesn't exist" error:
- Make sure you've run the `DB.sql` script
- Verify all tables are created properly

## Database Configuration
The application is configured to connect to:
- Host: localhost
- Port: 3306
- Database: aisolution_db
- Username: root
- Password: password (update in application.properties if different)

## Sample Data
The database will be populated with sample users and other test data after running the schema script.

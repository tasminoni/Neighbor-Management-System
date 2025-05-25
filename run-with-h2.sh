#!/bin/bash
echo "Starting NMS Backend with H2 Database..."
echo ""
echo "H2 Console will be available at: http://localhost:8080/h2-console"
echo "JDBC URL: jdbc:h2:mem:nms_db"
echo "Username: sa"
echo "Password: (leave empty)"
echo ""
mvn spring-boot:run -Dspring-boot.run.profiles=h2 
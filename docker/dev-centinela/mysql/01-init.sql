-- Crear un usuario administrador distinto del root
CREATE DATABASE IF NOT EXISTS centinelamima_fc;
CREATE DATABASE IF NOT EXISTS centinelamima_sistema;

-- Otorgar privilegios administrativos al usuario admin

-- -- Deshabilitar el acceso remoto para el usuario root
-- UPDATE mysql.user SET Host='localhost' WHERE User='root' AND Host='%';

-- Crear usuario de aplicación

GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
CREATE USER 'centinelamima'@'%' IDENTIFIED BY 'ziZK5WtSpwu#7&';

-- Crear bases de datos

-- Otorgar permisos al usuario de aplicación
GRANT ALL PRIVILEGES ON centinelamima_fc.* TO 'centinelamima'@'%';
GRANT ALL PRIVILEGES ON centinelamima_sistema.* TO 'centinelamima'@'%';

-- Aplicar cambios
FLUSH PRIVILEGES;

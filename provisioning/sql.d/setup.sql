CREATE USER 'todo_sample'@'%' IDENTIFIED BY 'todo_sample_pw';
GRANT ALL PRIVILEGES ON todo_sample_development.* TO 'todo_sample'@'%';
GRANT ALL PRIVILEGES ON todo_sample_test.* TO 'todo_sample'@'%';
FLUSH PRIVILEGES;

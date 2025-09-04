START TRANSACTION;

DROP TABLE IF EXISTS comments, posts, users;


CREATE TABLE users (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL,
  email VARCHAR(100),
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE posts (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  title VARCHAR(100) NOT NULL,
  content LONGTEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE comments (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  post_id INT NOT NULL,
  comment_text LONGTEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (post_id) REFERENCES posts(id)
);

INSERT INTO users (username, email, password) VALUES
('Alice', 'alice@test.com', 'password123'),
('Bob', 'bob@test.com', 'password456'),
('Charlie', 'charlie@test.com', 'password789');


INSERT INTO posts (user_id, title, content) VALUES
(1, 'Alice Post', 'Content of Alice post'),
(2, 'Bob Post', 'Content of Bob post'),
(3, 'Charlie Post', 'Content of Charlie post');


INSERT INTO comments (post_id, comment_text) VALUES
(1, 'Nice post Alice!'),
(2, 'Great job Bob!'),
(3, 'Interesting post Charlie!');

COMMIT;
USE my_first_database;
SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM comments;



CREATE TABLE lms.user_history (
  user_id INT NOT NULL,
  num_books_taken INT NOT NULL DEFAULT 0,
  num_books_due INT NOT NULL DEFAULT 0,
  num_books_overdue INT NOT NULL DEFAULT 0,
  fines DECIMAL(10,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (user_id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

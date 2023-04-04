DROP TABLE IF EXISTS lms.borrow;

CREATE TABLE lms.borrow (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bookID INT NOT NULL,
    userId INT NOT NULL,
    start_date DATE NOT NULL,
    due_date DATE NOT NULL,
    returned_date DATE DEFAULT NULL,
    FOREIGN KEY (bookID) REFERENCES books (id),
    FOREIGN KEY (userId) REFERENCES users (id)
);

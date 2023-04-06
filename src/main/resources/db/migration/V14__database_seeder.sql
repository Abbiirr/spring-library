# use database lms;

INSERT INTO lms.users (email, password, username, role)
VALUES
('john.doe@example.com', 'password123', 'johndoe', 'user'),
('jane.doe@example.com', 'password123', 'janedoe', 'user'),
('admin@example.com', 'admin123', 'admin', 'admin');


INSERT INTO lms.borrow (bookID, userId, start_date, due_date)
VALUES (1, 1, '2022-12-01', '2022-12-08');

INSERT INTO lms.borrow (bookID, userId, start_date, due_date)
VALUES (2, 5, '2022-11-15', '2022-11-22');

INSERT INTO lms.borrow (bookID, userId, start_date, due_date)
VALUES (1, 1, '2023-03-30', '2023-04-06');

INSERT INTO lms.borrow (bookID, userId, start_date, due_date)
VALUES (2, 4, '2023-03-30', '2023-04-06');

INSERT INTO lms.borrow (bookID, userId, start_date, due_date)
VALUES (3, 5, '2023-03-30', '2023-04-06');

INSERT INTO lms.borrow (bookID, userId, start_date, due_date)
VALUES (4, 6, '2023-03-30', '2023-04-06');

INSERT INTO lms.users (`email`, `password`, `username`, `role`, `created_at`, `updated_at`)
VALUES
('student1@example.com', 'password', 'student1', 'Student', NOW(), NOW()),
('student2@example.com', 'password', 'student2', 'Student', NOW(), NOW()),
('faculty1@example.com', 'password', 'faculty1', 'Faculty', NOW(), NOW()),
('faculty2@example.com', 'password', 'faculty2', 'Faculty', NOW(), NOW()),
('librarian1@example.com', 'password', 'librarian1', 'Librarian', NOW(), NOW()),
('librarian2@example.com', 'password', 'librarian2', 'Librarian', NOW(), NOW());

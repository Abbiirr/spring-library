USE lms;

-- Delete existing data
DELETE FROM lms.borrow;
DELETE FROM lms.users;

-- Insert users
INSERT INTO lms.users (email, password, username, role, created_at, updated_at)
VALUES
    ('john.doe@example.com', 'password123', 'johndoe', 'user', NOW(), NOW()),
    ('jane.doe@example.com', 'password123', 'janedoe', 'user', NOW(), NOW()),
    ('admin@example.com', 'admin123', 'admin', 'admin', NOW(), NOW()),
    ('student1@example.com', 'password', 'student1', 'Student', NOW(), NOW()),
    ('student2@example.com', 'password', 'student2', 'Student', NOW(), NOW()),
    ('faculty1@example.com', 'password', 'faculty1', 'Faculty', NOW(), NOW()),
    ('faculty2@example.com', 'password', 'faculty2', 'Faculty', NOW(), NOW()),
    ('librarian1@example.com', 'password', 'librarian1', 'Librarian', NOW(), NOW()),
    ('librarian2@example.com', 'password', 'librarian2', 'Librarian', NOW(), NOW());

-- Insert books
INSERT INTO books (name, author, short_description, genre) VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', 'A tale of love, wealth, and betrayal in the Roaring Twenties', 'Classic');

INSERT INTO books (name, author, short_description, genre) VALUES ('The Catcher in the Rye', 'J.D. Salinger', 'A coming-of-age novel about a teenager who is expelled from his prep school', 'Literary Fiction');

INSERT INTO books (name, author, short_description, genre) VALUES ('To the Lighthouse', 'Virginia Woolf', 'A stream-of-consciousness novel that explores the inner lives of characters', 'Modernist Fiction');

INSERT INTO books (name, author, short_description, genre) VALUES ('One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 'A multigenerational family saga set in a magical realist world', 'Magical Realism');

INSERT INTO books (name, author, short_description, genre) VALUES ('The Hitchhiker\'s Guide to the Galaxy', 'Douglas Adams', 'A comedic science fiction novel that follows the misadventures of an unwitting human and his alien friend', 'Science Fiction');

INSERT INTO books (name, author, short_description, genre) VALUES ('Beloved', 'Toni Morrison', 'A novel about the legacy of slavery and the search for identity and belonging', 'Literary Fiction');

INSERT INTO books (name, author, short_description, genre) VALUES ('The Bell Jar', 'Sylvia Plath', 'A semi-autobiographical novel that explores the experience of depression and the limitations placed on women in the 1950s', 'Literary Fiction');

INSERT INTO books (name, author, short_description, genre) VALUES ('The Color Purple', 'Alice Walker', 'A novel about the life of an African-American woman in the Deep South in the early 20th century', 'Historical Fiction');

INSERT INTO books (name, author, short_description, genre) VALUES ('The Road', 'Cormac McCarthy', 'A post-apocalyptic novel that follows a father and son as they travel through a desolate landscape', 'Dystopian Fiction');


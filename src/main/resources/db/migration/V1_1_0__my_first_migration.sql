CREATE TABLE IF NOT EXISTS people (
     id INT2,
     name TEXT NOT NULL,
     role TEXT NOT NULL,
     PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS comments (
    id INT4,
    comment TEXT NOT NULL,
    author TEXT NOT NULL,
    PRIMARY KEY (id)
);

-- INSERT DATA
INSERT INTO people (id, name, role)
VALUES
    (1, 'Person 1', 'Technical Writer'),
    (2, 'Person 2', 'Editor'),
    (3, 'Person 3', 'Reviewer'),
    (4, 'Person 4', 'Reader');
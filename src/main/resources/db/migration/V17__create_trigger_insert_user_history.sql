USE lms;

DELIMITER $$
DROP TRIGGER IF EXISTS insert_user_history_row $$
CREATE TRIGGER insert_user_history_row
AFTER INSERT ON users
FOR EACH ROW
BEGIN
  INSERT INTO user_history (user_id, num_books_taken, num_books_due, num_books_overdue, fines)
  VALUES (NEW.id, 0, 0, 0, 0);
END $$
DELIMITER ;

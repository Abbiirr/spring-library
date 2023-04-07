USE lms;

DELIMITER $$
DROP TRIGGER IF EXISTS update_user_history_on_borrow $$
CREATE TRIGGER update_user_history_on_borrow
AFTER INSERT ON borrow
FOR EACH ROW
BEGIN
    UPDATE user_history
    SET num_books_taken = num_books_taken + 1,
        num_books_due = num_books_due + 1
    WHERE user_id = NEW.userId;
END $$
DELIMITER ;

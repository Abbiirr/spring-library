USE lms;

DELIMITER $$
DROP TRIGGER IF EXISTS update_user_history_on_return $$
CREATE TRIGGER update_user_history_on_return
AFTER UPDATE ON borrow
FOR EACH ROW
BEGIN
    DECLARE user_id INT;
    DECLARE due_count INT;
    DECLARE overdue_count INT;

    SELECT userId INTO user_id FROM borrow WHERE id = NEW.id;

    IF OLD.due_date <= CURDATE() THEN
        SET due_count = -1;
        SET overdue_count = 0;
    ELSEIF OLD.due_date > CURDATE() THEN
        SET due_count = -1;
        SET overdue_count = -1;
    ELSE
        SET due_count = 0;
        SET overdue_count = 0;
    END IF;

    UPDATE user_history
    SET
        num_books_taken = (SELECT COUNT(*) FROM borrow WHERE user_id = NEW.userId),
        num_books_due = num_books_due + due_count - IF(OLD.due_date <= CURDATE(), 1, 0),
        num_books_overdue = num_books_overdue + overdue_count
    WHERE
        user_id = NEW.userId;
END $$
DELIMITER ;

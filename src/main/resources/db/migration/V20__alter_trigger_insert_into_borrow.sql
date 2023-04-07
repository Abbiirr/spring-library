USE lms;

DELIMITER $$
DROP TRIGGER IF EXISTS update_user_history_on_borrow $$
CREATE TRIGGER update_user_history_on_borrow
AFTER INSERT ON borrow
FOR EACH ROW
BEGIN
    DECLARE user_history_count INT;
    SELECT COUNT(*) INTO user_history_count FROM user_history WHERE user_id = NEW.userId;
    IF user_history_count = 0 THEN
        INSERT INTO user_history (user_id, num_books_taken, num_books_due) VALUES (NEW.userId, 1, 1);
    ELSE
        UPDATE user_history
        SET num_books_taken = num_books_taken + 1,
            num_books_due = num_books_due + 1
        WHERE user_id = NEW.userId;
    END IF;
END $$
DELIMITER ;

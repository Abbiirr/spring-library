use lms;
drop table if exists payment;
CREATE TABLE payment (
  userId INT NOT NULL,
  paymentType VARCHAR(50) NOT NULL,
  paymentAmount DECIMAL(10, 2) NOT NULL,
  paymentDate DATE NOT NULL,
  PRIMARY KEY (userId, paymentType, paymentDate)
);

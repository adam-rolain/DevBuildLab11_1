CREATE DATABASE stackoverflow;

USE stackoverflow;

CREATE TABLE question (
	id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    title VARCHAR(50) NOT NULL,
    detail VARCHAR(10000) NOT NULL,
    posted DATETIME NOT NULL,
    category VARCHAR(30) NOT NULL,
    tags VARCHAR(50),
    status INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE answer (
	id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    detail VARCHAR(10000) NOT NULL,
    questionId int NOT NULL,
    posted DATETIME NOT NULL,
    upvotes int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (questionId) REFERENCES question(id)
);

INSERT INTO question (username, title, detail, posted, category, tags, status) VALUES ('TEST1', 'TEST1', 'TEST1', '2021-01-01 12:00:00', 'TEST1', 'TEST1', 1);
INSERT INTO question (username, title, detail, posted, category, tags, status) VALUES ('TEST2', 'TEST2', 'TEST2', '2021-01-01 12:00:00', 'TEST2', 'TEST2', 1);
INSERT INTO question (username, title, detail, posted, category, tags, status) VALUES ('TEST3', 'TEST3', 'TEST3', '2021-01-01 12:00:00', 'TEST3', 'TEST3', 1);
INSERT INTO question (username, title, detail, posted, category, tags, status) VALUES ('TEST3', 'TEST4', 'TEST4', '2021-01-01 12:00:00', 'TEST4', 'TEST4', 0);

INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST1', 'TEST1', 1, '2021-01-01 12:00:00', 0);
INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST2', 'TEST2', 1, '2021-01-01 12:00:00', 0);
INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST3', 'TEST3', 1, '2021-01-01 12:00:00', 0);
INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST1', 'TEST1', 2, '2021-01-01 12:00:00', 0);
INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST2', 'TEST2', 2, '2021-01-01 12:00:00', 0);
INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST3', 'TEST3', 2, '2021-01-01 12:00:00', 0);
INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST1', 'TEST1', 3, '2021-01-01 12:00:00', 0);
INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST2', 'TEST2', 3, '2021-01-01 12:00:00', 0);
INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST3', 'TEST3', 3, '2021-01-01 12:00:00', 0);
INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST1', 'TEST1', 4, '2021-01-01 12:00:00', 0);
INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST2', 'TEST2', 4, '2021-01-01 12:00:00', 0);
INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST3', 'TEST3', 4, '2021-01-01 12:00:00', 0);
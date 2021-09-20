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

INSERT INTO question (username, title, detail, posted, category, tags, status) VALUES ('TEST', 'TEST', 'TEST', '2021-01-01 12:00:00', 'TEST', 'TEST', 1);
INSERT INTO answer (username, detail, questionId, posted, upvotes) VALUES ('TEST', 'TEST', 1, '2021-01-01 12:00:00', 0);
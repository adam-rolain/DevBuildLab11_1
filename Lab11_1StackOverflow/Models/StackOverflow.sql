CREATE DATABASE stackoverflow;

USE stackoverflow;

CREATE TABLE user (
	id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE question (
	id INT NOT NULL AUTO_INCREMENT,
    userId INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    detail VARCHAR(10000) NOT NULL,
    posted DATETIME NOT NULL,
    category VARCHAR(30) NOT NULL,
    tags VARCHAR(50),
    status INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (userId) REFERENCES user(id)
);

CREATE TABLE answer (
	id INT NOT NULL AUTO_INCREMENT,
    userId INT NOT NULL,
    detail VARCHAR(10000) NOT NULL,
    questionId int NOT NULL,
    posted DATETIME NOT NULL,
    upvotes int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (questionId) REFERENCES question(id),
    FOREIGN KEY (userId) REFERENCES user(id)
);

INSERT INTO user (username, password, firstName, lastName, email) VALUES ('USER1', 'abc123', 'Riley', 'Shirk', 'RileyShirk@RockCentrailDetroit.com');
INSERT INTO user (username, password, firstName, lastName, email) VALUES ('USER2', 'abc123', 'Tiia', 'Kansa', 'TiiaKansa@RockCentrailDetroit.com');
INSERT INTO user (username, password, firstName, lastName, email) VALUES ('USER3', 'abc123', 'Hemory', 'Phifer', 'HemoryPhifer@RockCentrailDetroit.com');
INSERT INTO user (username, password, firstName, lastName, email) VALUES ('USER4', 'abc123', 'Jeff', 'Cogswell', 'JeffCogswell@GrandCircus.com');

INSERT INTO question (userId, title, detail, posted, category, tags, status) VALUES (1, 'QUESTION1', 'QUESTIONDETAILS1', '2021-01-01 12:00:00', 'CATEGORY1', 'TAG1', 1);
INSERT INTO question (userId, title, detail, posted, category, tags, status) VALUES (2, 'QUESTION2', 'QUESTIONDETAILS2', '2021-01-01 12:00:00', 'CATEGORY2', 'TAG2', 1);
INSERT INTO question (userId, title, detail, posted, category, tags, status) VALUES (3, 'QUESTION3', 'QUESTIONDETAILS3', '2021-01-01 12:00:00', 'CATEGORY3', 'TAG3', 1);
INSERT INTO question (userId, title, detail, posted, category, tags, status) VALUES (4, 'QUESTION4', 'QUESTIONDETAILS4', '2021-01-01 12:00:00', 'CATEGORY4', 'TAG4', 0);

INSERT INTO answer (userId, detail, questionId, posted, upvotes) VALUES (2, 'ANSWER1', 1, '2021-01-01 12:00:00', 0);
INSERT INTO answer (userId, detail, questionId, posted, upvotes) VALUES (3, 'ANSWER2', 1, '2021-01-01 12:00:00', 0);
INSERT INTO answer (userId, detail, questionId, posted, upvotes) VALUES (4, 'ANSWER3', 1, '2021-01-01 12:00:00', 0);
INSERT INTO answer (userId, detail, questionId, posted, upvotes) VALUES (1, 'ANSWER1', 2, '2021-01-01 12:00:00', 0);
INSERT INTO answer (userId, detail, questionId, posted, upvotes) VALUES (3, 'ANSWER2', 2, '2021-01-01 12:00:00', 0);
INSERT INTO answer (userId, detail, questionId, posted, upvotes) VALUES (4, 'ANSWER3', 2, '2021-01-01 12:00:00', 0);
INSERT INTO answer (userId, detail, questionId, posted, upvotes) VALUES (1, 'ANSWER1', 3, '2021-01-01 12:00:00', 0);
INSERT INTO answer (userId, detail, questionId, posted, upvotes) VALUES (2, 'ANSWER2', 3, '2021-01-01 12:00:00', 0);
INSERT INTO answer (userId, detail, questionId, posted, upvotes) VALUES (4, 'ANSWER3', 3, '2021-01-01 12:00:00', 0);
INSERT INTO answer (userId, detail, questionId, posted, upvotes) VALUES (1, 'ANSWER1', 4, '2021-01-01 12:00:00', 0);
INSERT INTO answer (userId, detail, questionId, posted, upvotes) VALUES (2, 'ANSWER2', 4, '2021-01-01 12:00:00', 0);
INSERT INTO answer (userId, detail, questionId, posted, upvotes) VALUES (3, 'ANSWER3', 4, '2021-01-01 12:00:00', 0);
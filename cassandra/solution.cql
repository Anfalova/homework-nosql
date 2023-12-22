CREATE KEYSPACE my_ks WITH replication = {'class':'SimpleStrategy', 'replication_factor':1};

USE my_ks;

CREATE TABLE user_posts
(
    user_id int,
    username text,
    email text,
    post_id int,
    topic_id int,
    content text,
    created_at timestamp,
    PRIMARY KEY (user_id, created_at)
) WITH CLUSTERING ORDER BY (created_at desc);

--Test data

INSERT INTO user_posts (user_id, username, email, post_id, topic_id, content, created_at)
VALUES (1, 'user1', 'user1@somemail.com', 1, 1, 'content1', '2023-12-21 10:10:10');

INSERT INTO user_posts (user_id, username, email, post_id, topic_id, content, created_at)
VALUES (4, 'user4', 'user4@somemail.com', 4, 1, 'content4', '2023-12-23 11:11:11');

INSERT INTO user_posts (user_id, username, email, post_id, topic_id, content, created_at)
VALUES (3, 'user3', 'user3@somemail.com', 3, 2, 'content', '2023-12-20 12:11:10');

INSERT INTO user_posts (user_id, username, email, post_id, topic_id, content, created_at)
VALUES (2, 'user2', 'user2@somemail.com', 2, 2, 'content2', '2023-12-25 12:12:12');

INSERT INTO user_posts (user_id, username, email, post_id, topic_id, content, created_at)
VALUES (2, 'user2', 'user2@somemail.com', 1, 2, 'content3', '2023-12-21 13:12:12');

INSERT INTO user_posts (user_id, username, email, post_id, topic_id, content, created_at)
VALUES (2, 'user2', 'user2@somemail.com', 1, 4, 'content3', '2023-12-25 10:10:10');

--Task 1.
--Get the posts of user number 2

SELECT post_id, content, created_at
FROM user_posts
WHERE user_id = 2;

--Task 2
--Get the newest post of user number 2

SELECT post_id, content, created_at, username
FROM user_posts
WHERE user_id = 2
LIMIT 1;

--Task 3
--Get the posts of user number 2 after 23.12.23

SELECT post_id, content, created_at
FROM user_posts
WHERE user_id = 2 and created_at > '2023-12-23';

--Table for task 4

CREATE TABLE user_topics
(
    user_id      int,
    username     text,
    email        text,
    post_id      int,
    topic_id     int,
    content text,
    created_at timestamp,
    created_date date,
    PRIMARY KEY ((topic_id, created_date), created_at)
) WITH CLUSTERING ORDER BY (created_at DESC);

--Test data

INSERT INTO user_topics (user_id, username, email, post_id, topic_id, content, created_at, created_date)
VALUES (1, 'user1', 'user1@somemail.com', 1, 1, 'content1','2023-12-21 10:10:10', '2023-12-21');

INSERT INTO user_topics (user_id, username, email, post_id, topic_id, content, created_at, created_date)
VALUES (4, 'user4', 'user4@somemail.com', 4, 1, 'content4', '2023-12-23 11:11:11', '2023-12-23');

INSERT INTO user_topics (user_id, username, email, post_id, topic_id, content, created_at, created_date)
VALUES (3, 'user3', 'user3@somemail.com', 3, 2, 'content', '2023-12-20 12:11:10', '2023-12-20');

INSERT INTO user_topics (user_id, username, email, post_id, topic_id, content, created_at, created_date)
VALUES (2, 'user2', 'user2@somemail.com', 2, 2, 'content2', '2023-12-25 12:12:12', '2023-12-25');

INSERT INTO user_topics (user_id, username, email, post_id, topic_id, content, created_at, created_date)
VALUES (2, 'user2', 'user2@somemail.com', 1, 2, 'content3', '2023-12-21 13:12:12', '2023-12-21');

INSERT INTO user_topics (user_id, username, email, post_id, topic_id, content, created_at, created_date)
VALUES (2, 'user2', 'user2@somemail.com', 1, 4, 'content3', '2023-12-25 10:10:10', '2023-12-25');

--Task 4

SELECT user_id, username, post_id, created_at
FROM user_topics
WHERE created_date = '2023-12-25' AND topic_id = 4;

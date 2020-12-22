CREATE DATABASE pern;

CREATE TABLE todo(
    todo_id SERIAL PRIMARY KEY,
    descriptions VARCHAR(255)

);

INSERT INTO posts (post_content, user_id) values("what is String builder?" , 92);

insert into "Groups"(name, owner, courseid) values('EEx5563', 1, 6);
SELECT * FROM "Groups";


SELECT "Groups".name FROM "Groups" INNER JOIN user_course on "Groups".courseid = user_course.cid where user_course.uid = 90;

SELECT "Groups".name FROM (("Groups" INNER JOIN 
user_course ON "Groups".courseid = user_course.cid) INNER JOIN 
"UserProfile" ON user_course.uid = "UserProfile".id) where "UserProfile".id = 90;

--not used--
CREATE TABLE group_post(
    post_id SERIAL PRIMARY KEY,
    post_content VARCHAR(500),
    user_id INT NOT NULL,
    course_id INT NOT NULL,
	  group_id INT NOT NULL,
    FOREIGN KEY (user_id)
      REFERENCES "UserProfile"(id),
    FOREIGN KEY (course_id)
      REFERENCES "Course"(id),
	  FOREIGN KEY (group_id)
      REFERENCES "Groups"(id)
);

INSERT INTO group_post(post_content,user_id,course_id,group_id)values('this is post', 90, 5,11);

alter table posts add column course_id int;
alter table posts add column group_id int;

alter table posts add FOREIGN KEY (course_id)
      REFERENCES "Course"(id);

alter table posts add FOREIGN KEY (group_id)
      REFERENCES "Groups"(id);

--Chat table--
CREATE TABLE chat(
    chat_id SERIAL PRIMARY KEY,
    chat_name VARCHAR(50) unique,
    course_id INT NOT NULL,
    FOREIGN KEY (course_id)
      REFERENCES "Course"(id)
);

INSERT INTO chat (chat_name, course_id) VALUES('Java', 1);


CREATE TABLE chatmessage(
    chat_message_id SERIAL PRIMARY KEY,
    c_message VARCHAR(200),
    room_name VARCHAR(20) NOT NULL,
	user_id INT NOT NULL,
    FOREIGN KEY (room_name)
      REFERENCES "chat"(chat_name),
	FOREIGN KEY (user_id)
      REFERENCES "UserProfile"(id)
);

insert into chatmessage (c_message, room_name, user_id) values('hello', 'Java' , 1);

SELECT * FROM chatmessage WHERE room_name = 'Java'
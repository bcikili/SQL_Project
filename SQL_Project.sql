#part1
create table viewer_info(
viewer_id integer primary key auto_increment,
first_name char(50) not null,
last_name char(50) not null,
email varchar(255) not null
)
insert into viewer_info (first_name, last_name, email)
values ("Kenneth", "Davis", "kenneth.davis@gmail.com"),
       ("David", "Shirley", "david.shirley@gmail.com"),
       ("Gaby", "Garcia", "gaby.garcia@gmail.com"),
	    ("Donna", "Bumbleton", "donna.bumbleton@gmail.com");
        
        select * from viewer_info
#Part2
 create table sakila.StreamingServiceQueue(
    queue_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    genre NVARCHAR(50) NOT NULL,
    filmTitle NVARCHAR(50) NOT NULL,
    streamAvailable BOOLEAN CHECK(streamAvailable IN (true, false))
    )
               
        
  -- query 1
INSERT INTO sakila.StreamingServiceQueue (genre, filmTitle, streamAvailable)
VALUES ("Movies based on books","The Breadwinner", true)

-- query 2
INSERT INTO sakila.StreamingServiceQueue (genre, filmTitle, streamAvailable)
VALUES ("Emotional","Roma", false)

-- query 3
INSERT INTO sakila.StreamingServiceQueue (genre, filmTitle, streamAvailable)
VALUES ("Campy","To Wong Foo, Thanks for Everything Julie Newmar", true)

-- query 4
INSERT INTO sakila.StreamingServiceQueue (genre, filmTitle, streamAvailable)
VALUES ("Critically Acclaimed","A Single Man", true)

select * from StreamingServiceQueue

#part3
CREATE TABLE sakila.WatchedList(
    watch_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    queue_id INTEGER NOT NULL,
    viewer_id INTEGER NOT NULL,
    FOREIGN KEY(viewer_id) REFERENCES sakila.viewer_info(viewer_id),
    FOREIGN KEY(queue_id) REFERENCES sakila.StreamingServiceQueue(queue_id)
)

-- query 1
INSERT INTO sakila.WatchedList (viewer_id, queue_id)
VALUES (1, 2)

-- query 2
INSERT INTO sakila.WatchedList (viewer_id, queue_id)
VALUES (2, 1)

-- query 3
INSERT INTO sakila.WatchedList (viewer_id, queue_id)
VALUES (3, 2)

-- query 4
INSERT INTO sakila.WatchedList (viewer_id, queue_id)
VALUES (4, 1)

select * from sakila.watchedlist

select first_name, last_name, email, genre, filmtitle, watch_id 
from sakila.viewer_info
join sakila.watchedlist 
using (viewer_id)
join sakila.streamingservicequeue
using (queue_id)
order by last_name
Create table User_Info(
Name varchar(25) not null,
Email varchar(25) primary key,
Password varchar(25) not null,
Address varchar(25) not null,
DoB date not null
);
Create table Friends (
Person_Email varchar(25) not null,
Friend_Email varchar(25) not null,
FOREIGN KEY (Person_email) references User_Info(email),
PRIMARY KEY (Person_email, Friend_email)
);
Create table Songs (
Artist varchar(25) not null,
Song_Title varchar(25) not null,
Album varchar(25) not null,
Year numeric(4) not null,
PRIMARY KEY(Song_Title, Year)
);
Create table Favourites(
Email varchar(25) not null,
Song_Title varchar(25) not null,
Year numeric(4) not null,
FOREIGN KEY (Email) references User_Info(Email),
FOREIGN KEY (Song_Title,Year) references Songs(Song_Title,Year),
PRIMARY KEY (Email, Song_Title, Year)
);
Create table Fan_Groups (
Group_Name varchar(25) not null,
Artist varchar(25) not null,
Description varchar(25) not null,
PRIMARY KEY (Group_Name)
);
Create table Fans(
Email varchar(25) not null,
Creator_Email varchar(25) not null,
Group_name varchar(25) not null,
PRIMARY KEY(Email, Creator_Email, Group_name),
FOREIGN KEY (Email) REFERENCES User_Info(Email),
FOREIGN KEY (Creator_Email) REFERENCES User_Info(Email)
);
Create table Friend_message (
Message_id char(10) primary key,
Fromm varchar(25),
Too varchar(25),
Datee date,
Subject varchar(25),
Bodyy varchar(25),
FOREIGN KEY (Too,Fromm) REFERENCES Friends(friend_Email,Person_email)
);
Create table Group_message (
Message_id char(10) primary key,
Fromm varchar(25) not null,
Too varchar(25) not null,
Datee date,
Subject varchar(25),
Bodyy varchar(25),
FOREIGN KEY (Too) REFERENCES User_Info(Email),
FOREIGN KEY (Fromm) REFERENCES User_Info(Email)
);

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';
Insert into User_Info values ('Anikesh Pal', 'anix00011@gmail.com', 'abcd', 'Nagpur', '10-03-1999');
Insert into User_Info values('Kumar Saurav', 'ks@gmail.com', 'oxdfgujuj', 'Darbhanga', '04-09-1998');
Insert into User_Info values('Ayush Raghuvanshi', 'ar@gmail.com', 'hdrgyrg', 'Lahore', '30-10-1890');
Insert into User_Info values('Shreyash Turkar', 'shturkar90@gmail.com', 'ifghiht', 'Vadodara','01-11-1990');
Insert into User_Info values('Sourabh J', 'jmc@gmail.com', 'rtgyuhk', 'Naksal', '09-08-1947');
Insert into User_Info values('Yash', 'eryash@gmail.com', 'iududhk', 'Mumbai', '17-08-1957');
Insert into User_Info values('Natesh', 'wxde@gmail.com', 'iududhk', 'Mumbai', '17-03-1999');
Insert into User_Info values('Kartik', 'wxfe@gmail.com', 'iududhk', 'Mumbai', '20-09-1927');
Insert into User_Info values('Tanmay', 'wue@gmail.com', 'iududhk', 'Mumbai', '15-04-1999');
Insert into User_Info values('Tarun', 'wpe@gmail.com', 'iududhk', 'Mumbai', '14-07-1995');

Insert into Friends values('anix00011@gmail.com', 'eryash@gmail.com');
Insert into Friends values('ks@gmail.com', 'wxde@gmail.com');
Insert into Friends values('ar@gmail.com', 'wxfe@gmail.com');
Insert into Friends values('shturkar90@gmail.com', 'wue@gmail.com');
Insert into Friends values('jmc@gmail.com', 'wpe@gmail.com');

Insert into Songs values('Anix', 'War', 'NewWar', 2019);
Insert into Songs values('LL', 'Lassan', 'Page', 2000);
Insert into Songs values('Hrithik', 'Bang', 'BangBang', 2016);
Insert into Songs values('LL', 'Love', 'LoveP', 2004);
Insert into Songs values('Jaiswal', 'Ketchup', 'Heinz', 2010);

Insert into Favourites values('anix00011@gmail.com', 'War', 2019);
Insert into Favourites values('ar@gmail.com', 'Lassan', 2000);
Insert into Favourites values('ks@gmail.com', 'Bang', 2016);
Insert into Favourites values('jmc@gmail.com', 'Ketchup', 2010);
Insert into Favourites values('shturkar90@gmail.com', 'War', 2019);

Insert into Fan_Groups values('Anix Fan group', 'Anix', 'God');
Insert into Fan_Groups values('Hrithik Fan Group', 'Hrithik', 'Greek');
Insert into Fan_Groups values('Jaiswal Fan Group', 'Jaiswal', 'JanwarK');
Insert into Fan_Groups values('Guetta Fan Group', 'David', 'Composer');
Insert into Fan_Groups values('LL Fan Group', 'Lassan', 'Beat Boxer');

Insert into Fans values('anix00011@gmail.com', 'jmc@gmail.com', 'Anix Fan group');
Insert into Fans values('jmc@gmail.com', 'anix00011@gmail.com','Anix Fan group');
Insert into Fans values('jmc@gmail.com', 'ks@gmail.com', 'LL Fan Group');
Insert into Fans values('ks@gmail.com', 'anix00011@gmail.com', 'Guetta Fan Group');
Insert into Fans values('anix00011@gmail.com', 'ks@gmail.com', 'Guetta Fan Group');
Insert into Fans values('eryash@gmail.com', 'jmc@gmail.com', 'Anix Fan group');

Insert into Friend_Message values('MF001','anix00011@gmail.com', 'eryash@gmail.com', '26-10-2015', 'hello', 'Hello World');
Insert into Friend_Message values('MF002','ks@gmail.com', 'wxde@gmail.com', '20-05-2014','hello abe', 'hello');
Insert into Friend_Message values('MF003','ar@gmail.com', 'wxfe@gmail.com', '26-05-2014','Congrats', 'Congrats on win');
Insert into Friend_Message values('MF004','shturkar90@gmail.com', 'wue@gmail.com', '26-06-1999', 'Congrats', 'Congrats Abe');
Insert into Friend_Message values('MF005','jmc@gmail.com', 'wpe@gmail.com', '05-10-2017','support', 'support us');

Insert into Group_Message values('GF001','anix00011@gmail.com', 'ar@gmail.com', '15-06-2014', 'what’s up fam?', 'Hello');
Insert into Group_Message values('GF002','ks@gmail.com', 'jmc@gmail.com', '21-09-2019','hello abe', 'i am coming');
Insert into Group_Message values('GF003','shturkar90@gmail.com', 'ar@gmail.com', '08-08-1997', 'i am alive', 'i am alive yash.');
Insert into Group_Message values('GF004','jmc@gmail.com', 'ks@gmail.com', '26-06-2015','hi abe', 'hello abe');
Insert into Group_Message values('GF005','ar@gmail.com', 'jmc@gmail.com', '29-08-2019', 'thanks', 'thanks for supporting');

Indexes:

CREATE INDEX idx_uEmail
ON user_info (Name, Email);

CREATE INDEX idx_fMessage
ON Friend_Message (too,fromm);

CREATE INDEX idx_gMessage
ON Group_Message (too,fromm);

CREATE INDEX idx_sSongs
ON Songs (song_title);

View 1: Find pairs of users that have at least five favorite songs in common.

Create view V1 as
Select L1.Email, L2.Email, L1.song_title,L1.year
From Favourites L1, Favourites L2
where L1.Email != L2.Email
and L1.year = L2.year
and L1.song_title = L2.song_title
group by L1.Email, L2.Email
having (count(*)>=1);


View 2 : Get the list of users that have sent more than 3 messages to other users.
Create view V2 as
Select u.E-mail, u.name
from ( Select u.E-mail, u.name,count(*) as group_count
from user_info u, Group_Message
group by from ) as f1,
( Select u.E-mail, u.name,count(*) as frd_count
from user_info u, friend_message
group by from) as f2
where f2.frd_count + f1.group_count >=3 and f1.u.E-mail == f2.u.E-mail ;

View 3 : Finding the average number of friends per user.

Create view V3 as
Select u.name, u.Email, avg(count(*))
from user_info u, Friends f
where u.Email=f.person_Email
group by u.Email;

View 4 : Finding fans of LL or Anix.

Create view V4 as
Select f.Email
from Fans f, Fan_Groups a
where f.Group_name = a.Group_name
and (a.Artist = 'Lassan' or a.Artist = 'Anix');


View 5 : Finding names of songs which were released between 2005 and 2010 and which are
favourite of Anikesh Pal.

Create view V5 as
Select fs.song_title
from Songs fs, Favourites l
where fs.year between 2018 and 2020
and l.Email='anix00011@gmail.com'
and fs.Song_Title=l.Song_Title;


View 6 : Finding names of users who have friends in the same fan groups that they are in.

Create view V6 as
Select u.name
from fans f1, fans f2, friends f,user_info u
where f1.group_name = f2.group_name
and f1.Email !=Person_Email
and f2.Email = f.friend_Email
and u.email=f1.Email;

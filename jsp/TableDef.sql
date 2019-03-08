create table User (
	Username	VARCHAR(25),
	Email	VARCHAR(40),
	Birthday	DATE,
	isVerified	ENUM('T', 'F'),
	Photo	VARCHAR(255),
	Type		ENUM('A', 'G')		NOT NULL,
	Password	BINARY(64)			NOT NULL,
	primary key (Username)
)

create table Post (
	ID 	INT NOT NULL AUTO_INCREMENT,
	Username	VARCHAR(25)	NOT NULL,
	Is_Post_Reported	ENUM('T', 'F'),
	TimeStamp		DATE,
	primary key (ID),
	foreign key (Username) references User(Username)
		
	on delete CASCADE
	on update CASCADE
)

create table Recipe (
	PostID	INT,
	Instructions	VARCHAR(255)	NOT NULL,
	Title	VARCHAR(50),
	Ingredients	VARCHAR(255)	NOT NULL,
	Description	VARCHAR(255),
	Cooking_time	INT,
	primary key(PostID),
	foreign key (PostID) references Post(ID)
	on delete CASCADE 
	on update CASCADE
)

create table Comments(
	PostID	INT,
	RepliesToID	INT	NOT NULL,
	Content	VARCHAR(255)	NOT NULL,
	primary key (PostID),
	foreign key (RepliesToID) references Post(ID)
	on delete cascade 
	on update cascade,
	foreign key (PostID) references Post(ID)
	on delete cascade
	on update cascade
)

create table Tags (
	TagInfo VARCHAR(255),
	PostID INT,
	primary key (PostID, TagInfo),
	foreign key (PostID) references Post(ID)
	on update cascade
	on delete cascade
)


create table Votes_on (
	PostID	int,
	Username	varchar(255),
	primary key (PostID, Username),
	foreign key (PostID) references Post(ID)
	on delete cascade
	on update cascade,
	foreign key (Username) references User(Username)
	on delete cascade
	on update cascade
)

create table Faves(
	PostID	int,
	Username	VARCHAR(25),
	primary key (PostID, Username),
	foreign key (PostID) references Post(ID)
	on delete cascade
	on update cascade,
	foreign key (Username) references User(Username)
	on delete cascade 
	on update cascade
)
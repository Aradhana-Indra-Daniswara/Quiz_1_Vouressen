CREATE DATABASE Quiz_1_Vouressen

USE Quiz_1_Vouressen


CREATE TABLE PostLikes(
	PostID CHAR(5),
	UserID CHAR(5)

	CONSTRAINT PostLikes_PK PRIMARY KEY (UserID,PostID)
)



CREATE TABLE Photos(
	PostID CHAR(5),
	PhotoID CHAR(5),
	ImageContent VARCHAR(255)

	CONSTRAINT Photos_PK PRIMARY KEY (PostID)
)



CREATE TABLE Shares(
	PostID CHAR(5),
	UserID CHAR(5)

	CONSTRAINT Shares_PK PRIMARY KEY (UserID,PostID)
)

CREATE TABLE CommentLikes(
	CommentID CHAR(5),
	UserID CHAR(5)

	CONSTRAINT CommentLikes_PK PRIMARY KEY (UserID,CommentID)
)

CREATE TABLE Comments(
	PostID CHAR(5),
	UserID CHAR(5),
	CommentID CHAR(5),
	CommentDate CHAR(10),
	CommentContent VARCHAR(255),

	CONSTRAINT Comments_PK PRIMARY KEY (UserID, PostID),
	CONSTRAINT Comments_FK FOREIGN KEY (UserID, CommentID) REFERENCES CommentLikes(UserID,CommentID)


	ON UPDATE CASCADE 
	ON DELETE CASCADE
)
CREATE TABLE Friends(
	UserID CHAR(5),
	FriendID CHAR(5)

	CONSTRAINT Friends_PK PRIMARY KEY (UserID)
)

CREATE TABLE Pages(
	PageID CHAR(5),
	PageName VARCHAR(255),
	PageContent VARCHAR(255)

	CONSTRAINT Pages_PK PRIMARY KEY (PageID),
)

CREATE TABLE PageLikes(
	UserID CHAR(5),
	PageID CHAR(5)

	CONSTRAINT PageLikes_PK PRIMARY KEY (UserID),
	CONSTRAINT PageLikes_FK FOREIGN KEY (PageID) REFERENCES Pages(PageID)

	ON UPDATE CASCADE
	ON DELETE SET NULL
)


CREATE TABLE Users(
	UserID CHAR(5),
	FirstName VARCHAR(255),
	LastName VARCHAR(255),
	School VARCHAR(255),
	UserAddress VARCHAR(255),
	Email VARCHAR(255),
	PhoneNumber VARCHAR(100),
	UserLocation VARCHAR(255),
	DateofBirth VARCHAR(255),
	Gender CHAR

	CONSTRAINT Users_PK PRIMARY KEY (UserID),
	CONSTRAINT Users_FK1 FOREIGN KEY (UserID) REFERENCES Friends(UserID),
	CONSTRAINT Users_FK2 FOREIGN KEY (UserID) REFERENCES PageLikes(UserID),
	
)



CREATE TABLE Posts(
	UserID CHAR(5),
	PostID CHAR(5),
	PostContent VARCHAR(255),
	PostDate CHAR(10),

	CONSTRAINT Posts_PK PRIMARY KEY (UserID, PostID),
	CONSTRAINT Posts_FK1 FOREIGN KEY (UserID,PostID) 
		REFERENCES PostLikes(UserID,PostID), 
	CONSTRAINT Posts_FK2 FOREIGN KEY (PostID) 
		REFERENCES Photos(PostID),
	CONSTRAINT Posts_FK3 FOREIGN KEY (UserID,PostID) 
		REFERENCES PostLikes(UserID,PostID),
	CONSTRAINT Posts_FK4 FOREIGN KEY (UserID,PostID) 
		REFERENCES Comments(UserID,PostID),
	CONSTRAINT Posts_FKMain FOREIGN KEY (UserID) 
		REFERENCES Users(UserID)


	ON UPDATE CASCADE 
	ON DELETE CASCADE
)




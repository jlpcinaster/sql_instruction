drop database if exists prs
; 
create database prs
;		
use prs
;      

create table user (
	id 				int 			primary key auto_increment,
	Username		varchar(20) 	not null unique,
	password		varchar(10) 	not null,
    firstname		varchar(20)		not null,
	Lastname		varchar(20) 	not null,
	PhoneNumber		varchar(12)		not null,
    Email			varchar(75)		not null,
    isreviewer		tinyint			not null,
    isadmin			tinyint			not null
)
;


create table Vendor(
id 			int				primary key auto_increment,
Code		VARCHAR(10)		not null unique,
Name		VARCHAR(255)	not null,
Address		VARCHAR(255)	not null,
City		VARCHAR(255)	not null,
State		VARCHAR(2)		not null,
Zip			VARCHAR(5)		not null,
PhoneNumber	VARCHAR(12)		not null,
Email		VARCHAR(100)	not null

)

;
create table request (
ID					INT				primary key auto_increment,
UserID				INT				not null,
Description			VARCHAR(100)	not null,
Justification		VARCHAR(255)	not null,
DateNeeded			DATE			not null,
DeliveryMode		VARCHAR(25)		not null,
Status				VARCHAR(20)		not null,
Total				DECIMAL(10,2)	not null,
SubmittedDate		DATETIME		not null,
ReasonForRejection	VARCHAR(100)	


)
;
alter table request
ADD Foreign key (userid) references user(ID) 
;

create table product (
ID			INT				primary key auto_increment,
VendorID	INT				not null,
PartNumber	VARCHAR(50)		not null,
Name		VARCHAR(150)	not null,
Price		DECIMAL(10,2)	not null,
Unit		VARCHAR(255)	,
PhotoPath	VARCHAR(255) 	,
Unique (vendorid, partnumber)
)
;
alter table product
ADD Foreign key (VendorID) references vendor(ID) 
;

create table lineitem (
ID			INT		primary key auto_increment,
RequestID	INT		not null,
ProductID	INT		not null,
Quantity	INT		not null

)
;
alter table lineitem
ADD Foreign key (requestid) references request(ID)
;
alter table lineitem
ADD Foreign key (productid) references product(ID) 
 ;
 

    Insert into user (username, password, firstname, lastname, phonenumber, email, isreviewer, isadmin)
	values ('megaman1209', 'qwertQWERT', 'John', 'Buyer', '5132456756', 'buyjo346@gmail.com','0', '0' )
    
;

Insert into user (username, password, firstname, lastname, phonenumber, email, isreviewer, isadmin)
	values ('raazerman', 'raazD1', 'Grigori', 'Rasputin', '8083245890', 'razguy02@gmail.com','0', '0' )

;

Insert into vendor (code, name, address, city, state, zip, phonenumber, email)
	values ('CC-301', 'Corsair Computer Products', '109 Entriway', 'Las Angles', 'CA', '90210','6195426767', 'corsaircomputerproducts@ccp.ru' )
;

insert into product (vendorid, partnumber, name, price)
	values ('1', '1AFG5T768I', 'Corsair K-18 silent keyboard', '99.99')
    
;

insert into product (vendorid, partnumber, name, price)
	values ('1', '1AFG709T4T', 'Corsair comfy Mouse', '59.99')
    
;    
select * from user
;

select * from vendor
;

select * from product
;
select * from lineitem
;
select * from request

    ;

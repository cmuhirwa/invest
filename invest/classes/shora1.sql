/*drop database if exists uplus;*/
/*create database uplus;*/
use uplus;

drop table if exists accounts;
drop table if exists account_user;
drop table if exists action_agreement;
drop table if exists banks_telecoms;
drop table if exists financial_inst;
drop table if exists savings;
drop table if exists transactions;
drop table if exists tryjoin;
drop table if exists users;
drop view if exists joined_ua;
drop view if exists joinOrDisjoin;


create table accounts(
	id int(11) AUTO_INCREMENT PRIMARY KEY,
	accName varchar(50),
	adminName varchar(50),
	adminPhone varchar(50),
	bankaccount varchar(50),
	contribution varchar(50),
	currentAmount varchar(50),
	groupDesc varchar(255),
	groupType varchar(50),
	subGroupType varchar(50),
	opening date,
	periodes int(11),
	saving varchar(50),
	facebook varchar(50),
	twitter varchar(50),
	shareword varchar(50),
	createdDate date,
	transactionDate date,
	custommessage varchar(255),
	replymessage varchar(255)
	);

create table account_user(
	id int(11) AUTO_INCREMENT PRIMARY KEY,
	acceptance enum('no','yes') not null,
	accountID int(11),
	bank_account_id int(11),
	bankId int(11),
	listing int(11),
	commitment int(11),
	bankAccount varchar(50),
	commitedDate int(11),
	type int(11),
	userId int(11),
	invitedbyId int(11)
	);

create table action_agreement(
	id int(11) AUTO_INCREMENT PRIMARY KEY,
	accountCode int(11),
	actionQuery varchar(50),
	actionTitle int(11),
	fromCode int(11),
	status varchar(11),
	voteNo int(11),
	voteYes int(11),
	voteTotal int(11)
	);

create table banks_telecoms(
	id int(11) AUTO_INCREMENT PRIMARY KEY,
	acc_id int(11),
	acc_number varchar(50),
	balance varchar(50),
	bank_account_id int(11),
	phone varchar(11),
	holder_name varchar(50)
	);

create table financial_inst(
	id int(11) AUTO_INCREMENT PRIMARY KEY,
	name varchar(50),
	type varchar(50)
	);
	
create table savings(
	id int(11) AUTO_INCREMENT PRIMARY KEY,
	amountIn varchar(50),
	amountOut varchar(50),
	donedate date,
	userId int(11)
	);
	
create table transactions(
	id int(11) AUTO_INCREMENT PRIMARY KEY,
	accountowner varchar(50),
	action varchar(50),
	amount varchar(50),
	donedate date,
	frombank int(11),
	groupid int(11),
	points int(11)
	);
	
create table tryjoin(
	id int(11) AUTO_INCREMENT PRIMARY KEY,
	accountID int (11),
	acc_number int(11),
	name varchar(50),
	userId int(11)
	);
	
create table users(
	id int(11) AUTO_INCREMENT PRIMARY KEY,
	phone varchar(50) unique,
	active varchar(50),
	code int(11),
	joinedDate date,
	last_visit date,
	name varchar(50),
	password varchar(50),
	userType varchar(50),
	visits int(11)
	);
	
create view joined_ua as
SELECT u.name userName, u.id userId, u.phone userPhone,
a.accName groupName, a.adminPhone, a.adminName, a.id groupId, a.groupType,a.transactionDate, a.opening, a.periodes, a.saving, a.currentAmount, a.contribution, a.groupBank, a.bankaccount, a.groupDesc,
au.id joinid, au.acceptance, au.listing, au.bankId userBank, au.bankAccount userAccount, au.commitment userComitment, au.commitedDate userEveryDate
FROM accounts a 
INNER JOIN account_user au ON a.id=au.accountID
INNER JOIN users u ON u.id=au.userID
		
;
-- Fill the F Institutions 
	
INSERT INTO `financial_inst` (`name`, `type`) 
VALUES
('MTN Rwanda', 'Telecom'),
('TIGO Rwanda', 'Telecom'),
('AIRTEL Rwanda', 'Telecom'),
('MOBICASH', 'Telecom'),
('BANK OF KIGALI (BK)', 'bank'),
('Bank Populaire du Rwanda (BPR)', 'bank'),
('URWEGO OPPORTUNITY BANK', 'bank'),
('ZIGAMA CREDIT AND SAVING SOCIETY', 'bank'),
('COGEBANQUE', 'bank'),
('GTBANK', 'bank'),
('DEVELOPMENT BANK OF RWANDA (BRD)', 'bank'),
('KCB', 'bank'),
('ECOBANK', 'bank'),
('EQUITY', 'bank'),
('I&M BANK', 'bank'),
('AB BANK', 'bank'),
('AGASEKE BANK', 'bank'),
('UNGUKA', 'bank'),
('ACCESS BANK RWANDA LTD', 'bank'),
('CRANE BANK', 'bank');



-- Join and disjoin
create view joinOrDisjoin as
SELECT au.id, au.accountID groupID,au.userId, au.acceptance, bb.number, a.accName groupName, au.bank_account_id, bb.name bankName
FROM account_user au
inner join accounts a
on a.id = au.accountID
inner JOIN users u 
on u.id = au.accountID
inner join (SELECT b.id bankid, b.acc_id, b.acc_number number, f.name
from banks_telecoms b
inner join financial_inst f
on b.acc_id = f.id) bb on au.bank_account_id = bb.bankid
and au.acceptance = 'yes'



SELECT banks.bankName, banks.holder_name, u.name uplusUserName,
t.amount, t.donedate, t.points, t.action
FROM transactions t
INNER JOIN users u
ON u.id = t.accountowner
INNER JOIN 
	(SELECT b.id, f.name bankName, b.acc_number, b.holder_name
		FROM financial_inst f
		INNER JOIN banks_telecoms b
		ON b.acc_id = f.id
		) banks
ON t.frombank = banks.id;


-- Balance view
select bc.accountNumber accountNumber,
(ifnull(
(select sum(t.amount)
	from transactions t
	where ((t.operation = 'credit') and (t.account_id = bc.id))),0) 
			- ifnull((select sum(t.amount) from transactions t where ((t.operation = 'debit') and (t.account_id = bc.id))),0)) AS Balance 
	from bank_client bc

	
	
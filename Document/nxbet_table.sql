create table Account 
(
accountid int(11) unsigned not null auto_increment,
emailid varchar(32) not null,
username varchar(32) not null,
regdate datetime not null,
primary key (accountid)
)
;

create table Account_Assets
(
accountid int(11) unsigned not null,
assets int(11) unsigned not null default '0',
constraint fk_id foreign key (accountid) references Account (accountid) on delete cascade
) 
;

create table CompetitionList
(
sn int(11) not null auto_increment,
hometeam varchar(50) not null,
awayteam varchar(50) not null,
starttime datetime not null,
homeside float(3,2) not null,
awayside float(3,2) not null,
drawside float(3,2) not null,
state tinyint(1),
primary key (sn)
)
;
create table bettable
(
sn int(11) not null auto_increment,
competitionSN int(11) not null,
accountid int(11) unsigned not null,
betside tinyint(1) not null,
betmoney int(11) not null,
regdate datetime not null,
primary key (sn),
constraint fk_competitionSN1 foreign key ( competitionSN ) references CompetitionList ( sn ) on delete cascade
)
;

create table CompetitionResult
(
competitionSN int(11) not null,
result tinyint(1) not null,
score_sum tinyint(1) not null,
constraint fk_competitionSN2 foreign key ( competitionSN ) references CompetitionList ( sn ) on delete cascade
)
;
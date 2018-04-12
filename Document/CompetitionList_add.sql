delimiter //
create procedure CompetitionList_add
(in 
hometeam varchar(50), #홈팀이름
awayteam varchar(50), #원정팀이름
starttime datetime, #경기시작시간 : 경기시작시간이 되면 경기진행중으로 변경해야함
homeside float(3,2), #홈배당
awayside float(3,2), #원정배당
drawside float(3,2), #무승부배당
state tinyint(1) #state - 1:경기전 , 2: 경기진행중 , 3:경기완료
)
begin 
	insert into CompetitionList (hometeam,awayteam,starttime,homeside,awayside,drawside,state)
	values (hometeam, awayteam, starttime, homeside, awayside, drawside, state);
end
//
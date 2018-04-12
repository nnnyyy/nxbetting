delimiter //
create procedure CompetitionList_state_update
(in 
competitionSN int(11), #경기sn
state tinyint(1) #state - 1:경기전 , 2: 경기진행중 , 3:경기완료
)
begin 
	update CompetitionList
	set state = state
	where sn = competitionSN;
end
//
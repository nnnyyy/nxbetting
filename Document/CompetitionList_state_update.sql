delimiter //
create procedure CompetitionList_state_update
(in 
competitionSN int(11), #���sn
state tinyint(1) #state - 1:����� , 2: ��������� , 3:���Ϸ�
)
begin 
	update CompetitionList
	set state = state
	where sn = competitionSN;
end
//
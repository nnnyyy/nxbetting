
delimiter //
create procedure CompetitionList_load
()
begin 
	select * from CompetitionList where starttime >= now();
end
//

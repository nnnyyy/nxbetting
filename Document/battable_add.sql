delimiter //
create procedure bettable_add
(in 
accountid int(11),
competitionSN int(11) , #���sn
betside tinyint(1), #�������� 1:Ȩ��, 2:���º�, 3:������
betmoney int(11) #���ñݾ�
)
begin 
	declare A int(11);
	declare State tinyint(1);
	
	select State into State from CompetitionList where sn = competitionSN;
	select assets into A from Account_Assets where accountid = accountid;
if	state = 1 then #������϶�true

	if A >= betmoney then #���øӴϰ� �����ӴϺ��� �۰ų�������true
		update Account_Assets
		set assets = assets-betmoney
		where accountid = accountid;
	insert into bettable (competitionSN,accountid,betside,betmoney,regdate)
	values (competitionSN,accountid,betside, betmoney, now());
	else select 1;
	end if;
else select 0;
end if;

end
//
delimiter //
create procedure bettable_add
(in 
accountid int(11),
competitionSN int(11) , #경기sn
betside tinyint(1), #유저선택 1:홈승, 2:무승부, 3:원정승
betmoney int(11) #배팅금액
)
begin 
	declare A int(11);
	declare State tinyint(1);
	
	select State into State from CompetitionList where sn = competitionSN;
	select assets into A from Account_Assets where accountid = accountid;
if	state = 1 then #경기전일때true

	if A >= betmoney then #베팅머니가 보유머니보다 작거나같을때true
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
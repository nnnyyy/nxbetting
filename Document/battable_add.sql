
#유저 배팅관련
delimiter //
create procedure bettable_add
(in 
accountid_in int(11),
competitionSN_in int(11) , #경기sn
betside_in tinyint(1), #유저선택 1:홈승, 2:무승부, 3:원정승
betmoney_in int(11) #배팅금액
)
begin 

	select @State_out := State from CompetitionList where sn = competitionSN_in;
	select @assets_out := Assets from Account_Assets where accountid = accountid_in;
    
if	@State_out = 1 and @assets_out >= betmoney_in then #경기전일때true #베팅머니가 보유머니보다 작거나같을때true
		update Account_Assets
		set assets = assets - betmoney_in
		where accountid = accountid_in;
	insert into bettable (competitionSN,accountid,betside,betmoney,regdate)
	values (competitionSN_in,accountid_in,betside_in, betmoney_in, now());
else select 0;
end if;

end
//
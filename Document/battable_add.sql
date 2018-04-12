
#���� ���ð���
delimiter //
create procedure bettable_add
(in 
accountid_in int(11),
competitionSN_in int(11) , #���sn
betside_in tinyint(1), #�������� 1:Ȩ��, 2:���º�, 3:������
betmoney_in int(11) #���ñݾ�
)
begin 

	select @State_out := State from CompetitionList where sn = competitionSN_in;
	select @assets_out := Assets from Account_Assets where accountid = accountid_in;
    
if	@State_out = 1 and @assets_out >= betmoney_in then #������϶�true #���øӴϰ� �����ӴϺ��� �۰ų�������true
		update Account_Assets
		set assets = assets - betmoney_in
		where accountid = accountid_in;
	insert into bettable (competitionSN,accountid,betside,betmoney,regdate)
	values (competitionSN_in,accountid_in,betside_in, betmoney_in, now());
else select 0;
end if;

end
//
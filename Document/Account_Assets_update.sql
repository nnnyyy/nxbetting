delimiter //
create procedure Account_Assets_update
(
accountid_in int(11),
assets_in int(11) #�����ݾ�
)
begin 
	update Account_Assets
	set assets = assets+assets_in
	where accountid = accountid_in;
end
//


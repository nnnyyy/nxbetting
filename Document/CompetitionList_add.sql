delimiter //
create procedure CompetitionList_add
(in 
hometeam varchar(50), #Ȩ���̸�
awayteam varchar(50), #�������̸�
starttime datetime, #�����۽ð� : �����۽ð��� �Ǹ� ������������� �����ؾ���
homeside float(3,2), #Ȩ���
awayside float(3,2), #�������
drawside float(3,2), #���ºι��
state tinyint(1) #state - 1:����� , 2: ��������� , 3:���Ϸ�
)
begin 
	insert into CompetitionList (hometeam,awayteam,starttime,homeside,awayside,drawside,state)
	values (hometeam, awayteam, starttime, homeside, awayside, drawside, state);
end
//
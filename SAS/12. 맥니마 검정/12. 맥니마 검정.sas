/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\11. [��ݵ� �ʱ���] Mcnemar test ����.csv"
	out= work.data dbms = csv replace;
run;


/* �ƴϸ� ���� */
proc freq data = data;
	table before * after ;
	exact mcnem;
run;

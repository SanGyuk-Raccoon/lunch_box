/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\12. [��ݵ� �ʱ���] exact Mcnemar test ����.csv"
	out= work.data dbms = csv replace;
run;


/* ��Ȯ �ƴϸ� ���� */
proc freq data = data;
	table before * after ;
	exact mcnem;
run;

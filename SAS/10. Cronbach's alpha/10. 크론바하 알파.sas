/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\08. [��ݵ� �ʱ���] Cronbach's Alpha ����.csv"
	out= work.data dbms = csv replace;
run;

/* A�� ���� ũ�й��� ���� */
proc corr data = data alpha ;
	var a1-a5;
run;

/* B�� ���� ũ�й��� ���� */
proc corr data = data alpha ;
	var b1-b5;
run;

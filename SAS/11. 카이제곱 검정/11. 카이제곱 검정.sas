/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\09. [��ݵ� �ʱ���] Chi Square ����.csv"
	out= work.data dbms = csv replace;
run;

/* ī������ ���� */
proc freq data = data;
	table country * movie / chisq expected;
run;

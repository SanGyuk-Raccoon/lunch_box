/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\10. [��ݵ� �ʱ���] Fisher exact ����.csv"
	out= work.data dbms = csv replace;
run;

/* �Ǽ��� ��Ȯ ���� */
proc freq data = data;
	table country * movie / fisher expected;
run;

/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\02. [��ݵ� �ʱ���] ����ǥ�� T ���� ����.csv"
	out= work.data dbms = csv replace;
run;


/* ���Լ� �����ϱ� */
proc univariate data = data normal ;
	var height;
	class group;
run;

/* ����ǥ�� t-test �ϱ� */
proc ttest data = data ;
	var height;
	class group;
run;

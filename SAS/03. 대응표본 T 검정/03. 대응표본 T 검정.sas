/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\03. [��ݵ� �ʱ���] ����ǥ�� T ���� ����.csv"
	out= work.data dbms = csv replace;
run;

/* ��/�� ���� ����ϱ� */
data data_diff ;
	set data ;
	diff = after - before ;
run;

/* ���Լ� ���� */
proc univariate data = data_diff normal ;
	var diff;
run;

/* t test */
proc ttest data = data_diff ;
	paired before * after;
run;

proc ttest data = data_diff  H0 = 0 ;
	var diff ;
run;

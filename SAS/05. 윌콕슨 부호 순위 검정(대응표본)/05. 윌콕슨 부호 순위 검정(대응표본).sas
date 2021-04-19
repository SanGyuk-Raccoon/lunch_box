/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\05. [��ݵ� �ʱ���] ���۽� ��ȣ ���� ����(����ǥ��) ����.csv"
	out= work.data dbms = csv replace;
run;

/* ��/�� ���� ���ϱ� */
data data_diff;
	set data ;
	diff = after - before;
run;

/* Wilcoxon signed rank test */
proc univariate data = data_diff ;
	var diff ;
run;

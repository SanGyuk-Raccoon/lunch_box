/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\04. [��ݵ� �ʱ���] ���۽� ��ȣ ���� ����(��ǥ��) ����.csv"
	out= work.data dbms = csv replace;
run;

/* Wilcoxon signed rank test */
proc univariate data = data mu0 = 100;
	var weight;
run;

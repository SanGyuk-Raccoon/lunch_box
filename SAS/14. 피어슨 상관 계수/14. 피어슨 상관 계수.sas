/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\13. [��ݵ� �ʱ���] ��� �м� ����.csv"
	out= work.data dbms = csv replace;
run;

/* ���Լ� */
proc univariate data = data normal ;
	var var1-var3;
run;

/* �Ǿ ��� ��� */
/* + ������ */
proc corr data = data pearson plots = matrix;
	var var1-var3 ;
run;

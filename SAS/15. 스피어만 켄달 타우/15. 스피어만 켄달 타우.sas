/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\13. [��ݵ� �ʱ���] ��� �м� ����.csv"
	out= work.data dbms = csv replace;
run;


/* ���Ǿ ��� ��� */
/* + �˴� Ÿ�� ��� */
/* + ������ */
proc corr data = data spearman kendall plots = matrix;
	var var1-var3 ;
run;

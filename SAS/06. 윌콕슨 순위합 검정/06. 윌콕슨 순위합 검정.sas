/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\06. [��ݵ� �ʱ���] ���۽� ������ ���� ����.csv"
	out= work.data dbms = csv replace;
run;

/* ���۽� ������ ���� */
proc npar1way data = data wilcoxon;
	class company;
	var weight;
	exact wilcoxon;
run;

/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\07. [��ݵ� �ʱ���] ANOVA ����.csv"
	out= work.data dbms = csv replace;
run;

/* Kruskal Wallis test */
proc npar1way data = data wilcoxon;
	class group;
	var time;
run;

/* ���� ���� */
proc rank data  = data out = data_rank;
	var time;
run;

proc glm data = data_rank;
	class group;
	model time = group;
	lsmeans group / adjust = bon ;
run;

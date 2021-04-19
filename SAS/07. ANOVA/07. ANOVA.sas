/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\07. [��ݵ� �ʱ���] ANOVA ����.csv"
	out= work.data dbms = csv replace;
run;

/* ���Լ� ���� */
proc univariate data = data normal;
	var time;
	by group;
run;

/* ANOVA */
proc glm data = data;
	class group;
	model time = group;
	means group / hovtest = levene scheffe ;
run;

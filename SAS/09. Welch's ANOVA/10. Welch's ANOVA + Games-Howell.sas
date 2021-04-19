/* SAS�� ���� �����ų ���� �巡���ϰ� F8�� �����ø� �� ���常 ����˴ϴ�. */
/* ������ �б� */
proc import file = "G:\��ݵ� �ʱ���\[����]\���� ����\07. [��ݵ� �ʱ���] ANOVA ����.csv"
	out= work.data dbms = csv replace;
run;

/* Welch ANOVA*/
proc glm data = data;
	class group ;
	model time = group;
	means group / hovtest = levene welch ;
run;

/* games-howell */
proc mixed data = data;
	class group;
	model time = group / ddfm = satterth;
	repeated / group = group;
	lsmeans group / adjdfe = row adjust = tukey cl ;
run;

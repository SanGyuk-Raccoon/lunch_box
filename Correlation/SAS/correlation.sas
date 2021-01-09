/* Correlation Analysis, ����м� */
/* ������ �б� */
proc import file = "F:\��ݵ� �ʱ���\����\hn18_all.csv"
					 out = data
					 dbms = csv
					 replace; 
run;

/* ����� ���� ���� ����(�ʼ�X) */
data cor;
	set data;
	keep HE_ht HE_wt;
run;

/* ����ġ ���� */
data cor_com;
	set cor;
	if nmiss(of _NUMERIC_)=0;
run;
/* ���� ���Ǹ� ���� ����ġ�� ����������, ����ġ�� ��Ȳ�� ���� �ٷ�� ���� �ٸ��ϴ�. */
/* ������ ����� ���� ������ �ƴմϴ� !! */

/* ���Լ� ���� */
proc univariate data = cor_com normal ;
	var HE_ht HE_wt ;
run;
/* �˾ƺ� ���, */
/* SAS������ ����ġ�� 2,000���� �Ѿ�� Shapiro-Wilk Test ����� �������� �ʽ��ϴ�. */

/* ����м� + ������ �׷��� */
proc corr data = cor_com pearson spearman kendall nomiss plots(maxpoints = 15000) = scatter ;
	var HE_ht HE_wt ;
run;
/* nomiss �ɼ��� ������ ������������, ��Ϻ� �������������� �����ϴ� �ɼ��Դϴ�. */
	/* nomiss : ��Ϻ� �������� */
	/* default : ������ �������� */

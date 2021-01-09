/* Correlation Analysis, 상관분석 */
/* 데이터 읽기 */
proc import file = "F:\산격동 너구리\예제\hn18_all.csv"
					 out = data
					 dbms = csv
					 replace; 
run;

/* 사용할 변수 따로 저장(필수X) */
data cor;
	set data;
	keep HE_ht HE_wt;
run;

/* 결측치 제거 */
data cor_com;
	set cor;
	if nmiss(of _NUMERIC_)=0;
run;
/* 저는 편의를 위해 결측치를 제거했지만, 결측치는 상황에 따라 다루는 것이 다릅니다. */
/* 무조건 지우는 것이 정답은 아닙니다 !! */

/* 정규성 검정 */
proc univariate data = cor_com normal ;
	var HE_ht HE_wt ;
run;
/* 알아본 결과, */
/* SAS에서는 관측치가 2,000개가 넘어가면 Shapiro-Wilk Test 결과를 보여주지 않습니다. */

/* 상관분석 + 산점도 그래프 */
proc corr data = cor_com pearson spearman kendall nomiss plots(maxpoints = 15000) = scatter ;
	var HE_ht HE_wt ;
run;
/* nomiss 옵션은 대응별 결측제거인지, 목록별 결측제거인지를 결정하는 옵션입니다. */
	/* nomiss : 목록별 결측제거 */
	/* default : 대응별 결측제거 */

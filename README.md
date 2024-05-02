# Exemplary-Code-Chunk
## Code for formatted regression table

	modelsummary(model_final3, fmt = fmt_significant(2),                    
	gof_map = 'nobs', statistic = NULL,             
	stars = c('***' = .001, '**' = .01, '*' = 0.05),              
	title = "Estimated Effects of Key Variables on Feelings Towards Germany",             
             coef_map = c(
               'Ideology' = 'Ideology', 
               'PartyPref2' = 'Democrat',
               'PartyPref3' = 'Independent',
               'PartyPref4' = 'Other Party',
               'Trump1' = 'Trump Voter 2020',
               'Christian0' = 'Not Christian',
               'NATO1' = 'Decrease/Withdraw US NATO Support',
               '(Intercept)' = '(Intercept)'
             ))
  
  ![Regression table_Germany](https://github.com/jmichaud24/Exemplary-Code-Chunk/assets/156938374/17980d5a-af7a-4c56-9382-744cd6407a13)




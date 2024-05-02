CCSD <- X2022_Chicago_Council_Survey_Data_Set

#data transformation
CCSD1 <- 
  CCSD |>
  select(Q1010, 
         Q45_2,
         Q1015,
         Q1020,
         Q1025,
         Q1005,
         DOV_REL1,
         Q200,
         Q2020VOTE) |>
  mutate(Germany = as.numeric(Q45_2),
         PartyPref = as.factor(Q1010),
         Ideology = as.factor(Q1005),
         Christian = as.factor(DOV_REL1),
         NATO = as.factor(Q200),
         Trump = as.factor(Q2020VOTE)
  ) |>
  mutate(Christian = recode(Christian,
                            "1" = "1",
                            "2" = "1",
                            "3" = "0",
                            "4" = "0",
                            "5" = "0",
                            "6" = "0",
                            "7" = "0",
                            "8" = "0",
                            "9" = "0",
                            "10" = "0",
                            "11" = "0",
                            "12" = "0",
                            "13" = "0"),
         NATO = recode(NATO,
                       "1" = "0",
                       "2" = "0",
                       "3" = "1",
                       "4" = "1"),
         Trump = recode(Trump, 
                        "1" = "0",
                        "2" = "1",
                        "3" = "0",
                        "4" = "0",
                        "5" = "0")
  ) |>
  filter(Ideology %in% c(1:7),
         NATO %in% c(0:1),
         PartyPref %in% c(1:4),
         Trump %in% c(0:1),
         Christian %in% c(0:1),
         Germany %in% c(0:100))

#with ideology as continuous variable
CCSD2 <-
  CCSD1 |>
  mutate(Ideology = as.numeric(Ideology))

CCSD3 <- 
  CCSD2 |>
  mutate(Ideology = recode(Ideology,
                           "2" = "1",
                           "3" = "2",
                           "4" = "3",
                           "5" = "4",
                           "6" = "5",
                           "7" = "6",
                           "8" = "7")
  ) |>
  mutate(Ideology = as.numeric(Ideology))

#create regression model
model_final3 = lm(Germany ~ Ideology + PartyPref + Trump + Christian + NATO, data = CCSD3)

#create summary table
modelsummary(model_final3, fmt = fmt_significant(2),
             gof_map = 'nobs', statistic = NULL,
             stars = c('***' = .001, '**' = .01, '*' = 0.05), title = "Estimated Effects of Key Variables on Feelings Towards Germany",
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
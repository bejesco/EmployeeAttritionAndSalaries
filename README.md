#Executive Summary

Our first objectvie was use the employee data from Frito Lay to predict if certain employees will leave or not. To do
this I created a Naive Bayes model and iterated all 3 variable combinations of employee attributes. I did not train the
model on all the 870 entries. I did this because when looking at the data 730 of them actually ended up leaving the
company. So the data was very biased to the people who left. To create a model of equal people that left and didnt leave,
for every combination I ran, I randomly selcted only 140 who left, and then all the 140 people who didnt. This allowed the
model to perform better. In the end, the best 3 combo of variables turned out to be Job Involvement, Stock Option Level,
and Years With Current Manager. 

Our second objective was to predict what someomes monthly income is. To do this, I used linear regression. The method I 
I used in picking the variables was utilizing SAS. I ran through all the combos, and chose a set by looking at the R Squared's.
DistanceFromHome,JobLevel,TotalWorkingYears,YearsAtCompany turned out to have a very strong R squared. After choosing
the variables I wanted to use, I created a regression model to achieve predicted monthly incomes from the test set provided.
My RMSE was 1378.

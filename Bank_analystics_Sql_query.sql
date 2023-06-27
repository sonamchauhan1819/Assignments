/* Q.1 Year wise loan amount Stats*/
select year(issue_d) as year,
count(*) as num_year,
sum(loan_amnt) as Loan_amount from finance_1
group by year
order by year;

/* Q.2 Grade and sub grade wise revol_bal */
select f1.grade, f1.sub_grade, sum(revol_bal) as revol_balance from finance_1 f1
left join
finance2 f2 on f1.id = f2.id
group by grade, sub_grade
order by sub_grade;


/* Q.3 Total Payment for Verified Status Vs Total Payment for Non Verified Status*/
select verification_status, sum(total_pymnt) as total_payment from finance_1
left join
finance2 on finance2.id = finance_1.id
group by 1;

/* Q.4 State wise and last_credit_pull_d wise loan status*/
select f1.addr_state, year(last_credit_pull_d), f1.loan_status from finance_1 f1
left join
finance2 f2 on f2.id = f1.id
order by addr_state, loan_amnt;

/* Q.5 Home ownership Vs last payment date stats*/
select home_ownership, max(last_pymnt_d), count(*) as total_last_pymnt from finance_1
left join finance2 on finance_1.id = finance2.id
group by home_ownership;


/* loan amount vs loan status*/
select loan_status, sum(loan_amnt) from finance_1
group by loan_status;

/*revol bal is grether then 50000*/
create view revol_bal as
select * from finance2
where revol_bal >= 100000;
select * from revol_bal;

/*sum, avg, max, min loan amt*/
select sum(loan_amnt) as total_loan_amount,
	avg(loan_amnt) as avg_loan_amount,
    max(loan_amnt) as max_loan_amount,
    min(loan_amnt) as min_loan_amount from finance_1;
    
/*total loan amount where purpose for house */
select sum(loan_amnt), purpose from finance_1
where purpose = 'house'
group by purpose;


#LAB - Review SQL
#1.Write a SELECT statement that lists the customerid along with their account number, type, the city the customer lives in and their postalcode.

select c.CustomerID, c.CustomerType, c.AccountNumber,  a.city, a.PostalCode  from customer c
join customeraddress ca using(CustomerID)
join address a using(AddresssID);

#2.Write a SELECT statement that lists the 20 most recently launched products, their name and colour

select Name, ProductNumber, Color from product
order by SellStartDate DESC
limit 20;

#3.Write a SELECT statement that shows how many products are on each shelf in 2/5/98

select Shelf, count(distinct ProductID) from productinventory
where ModifiedDate = "1998-05-02 00:00:00"
group by Shelf;

#4.I am trying to track down a vendor email address… his name is Stuart and he works at G&K Bicycle Corp. Can you help?

select c.EmailAddress from contact c
join vendorcontact vc using(ContactID)
join vendor v using(VendorID)
where c.FirstName = 'Stuart' and v.Name = 'G & K Bicycle Corp.';

#5.What’s the total sales tax amount for sales to Germany? What’s the top region in Germany by sales tax?

select sp.Name as Region, sum(sh.TaxAmt) as Tax_Germany_Region from salesorderheader sh
join salesterritory st using(TerritoryID)
join address a on BillToAddressID = AddressID
join stateprovince sp using(StateProvinceID)
where st.Name = 'Germany'
group by sp.Name
order by sum(sh.TaxAmt) DESC;

#6.Summarise the distinct # transactions by month

select * from transactionhistoryarchive
group by MONTH(curdate(TransactionDate));

distinct(TransactionID), MONTH(date(TransactionDate))

#7.Which ( if any) of the sales people exceeded their sales quota this year and last year?

select SalesPersonID, SalesYTD, SalesLastYear, SalesQuota from salesperson
where SalesYTD > SalesQuota and SalesLastYear > SalesQuota;

#8.Do all products in the inventory have photos in the database and a text product description? 

select ProductID from product p
join productmodelproductdescriptionculture pm using(ProductModelID)
join productproductphoto pp using(ProductID)
where ProductPhotoID is not null and ProductDescriptionID is not null;

#9.What's the average unit price of each product name on purchase orders which were not fully, but at least partially rejected?

select p.Name, pr.PurchaseOrderID, avg(pr.UnitPrice) from purchaseorderdetail pr
join product p using(ProductID)
where pr.RejectedQty > 0;
group by p.Name ;


#10.How many engineers are on the employee list? Have they taken any sickleave?

select count(EmployeeID) as NumberEngineers, sum(SickLeaveHours) as SickLeaveHours from employee
where Title like "%engin%";

#11.How many days difference on average between the planned and actual end date of workorders in the painting stages?

select avg(wo.ScheduledEndDate - wo.ActualEndDate) as Avg.actual-plan  from workorderrouting wo
join location l using(LocationID)
where l.name like "%paint%";
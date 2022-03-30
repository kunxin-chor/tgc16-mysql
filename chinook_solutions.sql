-- Q1
select FirstName, LastName from Employee where Title LIKE "sales support agent";

-- Q2
select FirstName, LastName, HireDate from Employee where year(HireDate) >= "2002" and
  year(HireDate) <= "2003";

-- Q3
select * from Artist where Name LIKE "%metal%";

-- Q4
select * from Employee where Title LIKE "%sales%";

-- Q5
select Track.Name from Track join Genre on Track.GenreId = Genre.GenreId
where Genre.Name = "easy listening";

-- Q6
select Track.Name, Genre.Name from Track join Genre on Track.GenreId = Genre.GenreId
where AblumId is not null;

-- Q7
select avg(Total), BillingCountry from Invoice
group by BillingCountry;

-- Q8
select BillingCountry, avg(Total) from Invoice
group by BillingCountry
having avg(Total) > 5.5;

-- Q9
select Customer.CustomerId, Customer.FirstName, Customer.LastName, BillingCountry, sum(Total) from
 Invoice join Customer on Invoice.CustomerId = Customer.CustomerId
 group by Customer.CustomerId, Customer.FirstName, Customer.LastName, BillingCountry
 having BillingCountry = "Germany" and sum(Total) > 10;

 -- vs:

 select Customer.CustomerId, Customer.FirstName, Customer.LastName, BillingCountry, sum(Total) from
 Invoice join Customer on Invoice.CustomerId = Customer.CustomerId
 where BillingCountry = "Germany"
 group by Customer.CustomerId, Customer.FirstName, Customer.LastName, BillingCountry
 having  sum(Total) > 10;

-- Q10
select avg(Milliseconds), Genre.Name, Album.Title from Track join Album on Track.AlbumId = Album.AlbumId
 join Genre on Track.GenreId = Genre.GenreId
 where Genre.Name = "Jazz"
 group by Genre.Name, Album.Title;

 select avg(Milliseconds), g.Name, a.Title from Track as t join Album as a on t.AlbumId = a.AlbumId
 join Genre as g on t.GenreId = g.GenreId
 where g.Name = "Jazz"
 group by g.Name, a.Title;


SELECT * FROM db.youtube_subscribers_data;

-- What is the total number of subscribers (in millions) for all channels grouped by country?
SELECT 
    SUM(Subscribers) AS subs_million, country
FROM
    youtube_subscribers_data
GROUP BY country;

-- Which are the top 5 channels with the highest number of subscribers?
select name   ,Subscribers from youtube_subscribers_data order by Subscribers desc limit 5;

-- What is the average number of subscribers for channels in each category?
select Category,avg(Subscribers) as Subs from youtube_subscribers_data group by Category ;

-- Which channels have more than 100 million subscribers?
select Name,Subscribers from youtube_subscribers_data where Subscribers >= 100;

-- How many channels are there for each primary language?
select Count(Name) as No_of_Channels,Primary_language from youtube_subscribers_data group by Primary_language;

-- What is the channel with the highest number of subscribers in each category?

SELECT 
    Name, 
    Subscribers, 
    Category 
FROM 
    youtube_subscribers_data AS t1
WHERE 
    Subscribers = (SELECT MAX(Subscribers) FROM youtube_subscribers_data AS t2 WHERE t1.Category = t2.Category);




-- List all channels that are based in the United States and their subscriber counts.
select Name,Subscribers as Subs from youtube_subscribers_data where Country = 'United States' group by Name;
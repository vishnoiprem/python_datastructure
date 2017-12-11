
https://docs.google.com/document/d/1XsUPC6d5xvshCLjPk1GcRRTgoCJ8FhtslBXXYvJTjYk/edit



Q 1. Write a query to count the number of products across all orders received by the warehouse system today (the PostgreSQL database). 

==================
Solution:
==================

Select 
Count( distinct op.product_id) as Number_Of_Product 
from orders o
inner join order_products op on (o.order_id=op.order_id)
where lower(o.status)='received'
and  cast(o.received as date Format 'YYYY-MM-DD')=cast(CURRENT_DATE as date Format 'YYYY-MM-DD')
;

Q 2. Given an order_id, how would you find its last GPS coordinates?
==================
Solution;
==================
--IN postgresql, we would find first product id for a given order

Select product_id from order_product where op.order_id='<>'

---IN RADIS Database


find Driver_ID using product ID


based on Driver_ID, we would find last 10 GPS coordinate




#!/usr/bin/python
## SQL to Redis
# import Redis and POSTGRESQL drivers
import redis
import POSTGRESQLdb
from collections import Counter

# create class
class dataProcessor(object):

	# POSTGRESQL server data
	POSTGRESQL_IP_ADDRESS_SERVER = 'localhost'
	POSTGRESQL_USER = 'root'
	POSTGRESQL_PASSWORD = 'my_strong_password'
	POSTGRESQL_DATABASE_NAME = 'database_name'

	# Redis server data
	REDIS_SERVER = 'localhost'

	# function to get data from POSTGRESQL and to transfer it to redis
	@staticmethod
	def sql_to_redis():
		r_redis = redis.StrictRedis(dataProcessor.REDIS_SERVER)
		print ""
		print "Connected to Redis successfully!"

		database = POSTGRESQLdb.connect(dataProcessor.POSTGRESQL_IP_ADDRESS_SERVER, dataProcessor.POSTGRESQL_USER, dataProcessor.POSTGRESQL_PASSWORD, dataProcessor.POSTGRESQL_DATABASE_NAME)
		print "Connected to POSTGRESQL successfully!"
		print ""

		cursor = database.cursor()
		select = 'Select product_id from order_product where op.order_id='OD1234455' group by product_id'
		cursor.execute(select)
		data = cursor.fetchall()

		# Clean redis before run again
		# This is for test purpose
		r_redis.delete("all_records")

		# Put all data from POSTGRESQL to Redis
		for row in data:
			r_redis.rpush("all_records", row)

		# Close connection to DB and Cursor
		cursor.close()
		database.close()
	
	@staticmethod
	def get_data_from_redis():

		r2_redis = redis.StrictRedis(dataProcessor.REDIS_SERVER)

		list = []
		list = r2_redis.lrange("all_records", 0, 100)

		driver_id=[]
		dri=r2_redis.lrange("driver", 0, 100)
		
		
		
		word_list = [word for line in dri for word in line.split()]



		words_to_count = (word for word in word_list if word[0]=list)
		top_ten = Counter(words_to_count)

		print ("Top 10 Most popular words:")
		print( top_ten.most_common(10), "\n")

Q.3

What do you think is the most serious problem among these systems, and why? (We are not 
looking for a specific answer, we want to know what you think is a problem.)

==============
Solution:
==============
These System MYSQL use for  Transaction syste  Open source and Reduced Total Cost of Ownership 

POSTGRESQL for dataware house PostgreSQL generally shows it's advantages in complex data models,built-in NoSQL key-value store

and REDIS are good choise when we have less data.
I belive redis have a lot of advantage 
Exceptionally Fast,Supports Rich data types,Operations are atomic and support data structure like list, set and hash table.


But it would be serious problem 

1.It Suffers From Relatively Poor Performance Scaling
Although POSTGRESQL is equipped to handle a virtually limitless volume of data, it has a troubling tendency to come grinding to a halt if it’s forced to deal with too many operations at a given time. This relatively poor performance scaling means that anyone with high concurrency levels should probably look into an alternative.


2.POSTGRESQL does not support a very large database size as efficiently.
Transactions are not handled very efficiently.

3.POSTGRESQL is not for large sized data
POSTGRESQL works fine in most small or medium applications, but when data size grows, the performance degrade. When the data grows, only the simple and indexed query get good performance, for a complicated query, it easily get slow sometimes even unable to fulfill the request in tolerable timeout. You need to carefully design your SQL query to make it still available.



Why do you think this fictional company chose Redis for their delivery system, and is it a good choice?












I have a real example for you considering how POSTGRESQL performance would degrade when the data grows. I have this table called stat, it records every visit request to this website. It will record the IP, the user agent, request uri and browser refer and visit time. Here is the table structure



Postgres is "better SQL" -- more standardsy, with better query planning so you can follow the relational model more closely if it suits you.
Postgres offers a rich variety of data types -- JSON, UUIDs, IP addresses -- and flexible indexing thereof.
POSTGRESQL's replication solutions are well-tested and well understood, relatively speaking.
POSTGRESQL's pluggable storage engines and general tune..



https://segment.com/blog/choosing-a-database-for-analytics/


https://segment.com/docs/guides/warehouses/how-do-i-decide-between-redshift-postgres-and-bigquery/


PostgreSQL is one of the best-performing relational databases out there. It is a solid choice for most business applications where data mining and/or reporting is important. Amazon uses it for Redshift, their data warehousing platform, though theirs is somewhat modified and a version (or versions) behind.

Disadvantage…not so great as an ODM, as is true of any relational database. If you are storing data as an object/document, you should consider Mongo or something along those lines.



USE music_store;

-- drop database music_store;

-- table entries for music_store -- 
-- inserting values into the music_store table
INSERT INTO music_store (storeAddress, store_phone_number,storeZipcode)
		VALUES ("181 Boniface Avenue", 519-722-7159, "N2E3T2");
INSERT INTO music_store (storeAddress, store_phone_number,storeZipcode)
		VALUES ("250 lester street", 519-722-7158, "N2E3T1");
INSERT INTO music_store (storeAddress, store_phone_number,storeZipcode)
		VALUES ("509 Windflower Crescent", 519-722-7157, "N2E3T3");
INSERT INTO music_store (storeAddress, store_phone_number,storeZipcode)
		VALUES ("2960 kingsway Drive ", 519-722-7156, "N2E3T4");
INSERT INTO music_store (storeAddress, store_phone_number,storeZipcode)
		VALUES ("1400 Ottowa Street", 519-722-7155, "N2E3T5");
select * from music_store;
        

-- table entries for employees -- 
-- inserting values into the employees table
INSERT INTO employees (employeeName, employeeAge, employeePhoneNumber, music_store_storeId, employeeAddress )
		VALUES ("JeevanKumarGondyala", 24, "8977870086", 1, "kitchener");
INSERT INTO employees (employeeName, employeeAge, employeePhoneNumber, music_store_storeId, employeeAddress )
		VALUES ("BalaShreeNaidu", 24, "8977870085", 2, "Waterloo");
INSERT INTO employees (employeeName, employeeAge, employeePhoneNumber, music_store_storeId, employeeAddress )
		VALUES ("HarishSakamuri", 26, "8977870084", 1, "London");
INSERT INTO employees (employeeName, employeeAge, employeePhoneNumber, music_store_storeId, employeeAddress )
		VALUES ("KranthiNivedan", 26, "8977870083", 3, "Toronto");
INSERT INTO employees (employeeName, employeeAge, employeePhoneNumber, music_store_storeId, employeeAddress )
		VALUES ("PradeepReddy", 23, "8977870082", 4, "Cambridge");

select * from employees;


-- table entries for customers -- 
-- inserting values into the customers table
INSERT INTO customers (customerFname, customerLname, customerPhoneNumber, music_store_storeId, customerAge)
		VALUES ("Allu", "Arjun", "647-979-8984", 1, 22);
INSERT INTO customers (customerFname, customerLname, customerPhoneNumber, music_store_storeId, customerAge)
		VALUES ("Cable", "Raju", "647-979-8983", 4, 34);
INSERT INTO customers (customerFname, customerLname, customerPhoneNumber, music_store_storeId, customerAge)
		VALUES ("Duvvada", "Jaganatham", "647-979-8982", 1, 21);
INSERT INTO customers (customerFname, customerLname, customerPhoneNumber, music_store_storeId, customerAge)
		VALUES ("Viraj", "Anand", "647-979-8981", 2, 39);
INSERT INTO customers (customerFname, customerLname, customerPhoneNumber, music_store_storeId, customerAge)
		VALUES ("Pushpa", "Raj", "647-979-8989", 3, 26);
        
select * from customers;

-- table entries for address -- 
-- inserting values into the address table
INSERT INTO address (city, location, postal_code, music_store_storeId)
		VALUES ("Hyderabad", "Kukatpally", "509001",  4);
INSERT INTO address (city, location, postal_code, music_store_storeId)
		VALUES ("Chennai", "Siruseri", "509002",  2);
 INSERT INTO address (city, location, postal_code, music_store_storeId)
		VALUES ("Mumbai", "Marine Drive", "509003",  1);       
 INSERT INTO address (city, location, postal_code, music_store_storeId)
		VALUES ("Banglore", "MG Road", "509004",  4);       
INSERT INTO address (city, location, postal_code, music_store_storeId)
		VALUES ("Delhi", "Chandini Chowk", "509005",  3);

select * from address;
-- table entries for categories -- 
INSERT INTO categories (categoryName, categoryType)
		Values ("Audio", "Online");
INSERT INTO categories (categoryName, categoryType)
		Values ("Video", "Offline");
INSERT INTO categories (categoryName, categoryType)
		Values ("Accessories","Online");
        


-- table entries for orders -- 
INSERT INTO orders (orderDate, shipAmount, taxAmount, customers_customerId)
		Values("2021-11-03 22:49:52", "227", 9, 1);
INSERT INTO orders (orderDate, shipAmount, taxAmount, customers_customerId)
		Values("2021-03-03 11:45:13", "451", 16, 1);
INSERT INTO orders (orderDate, shipAmount, taxAmount, customers_customerId)
		Values("2021-01-14 09:59:11", "215", 7, 2);
INSERT INTO orders (orderDate, shipAmount, taxAmount, customers_customerId)
		Values("2021-04-05 01:12:43", "612", 21, 3);
INSERT INTO orders (orderDate, shipAmount, taxAmount, customers_customerId)
		Values("2021-07-07 10:51:43", "121", 4, 4);

        
        





        


-- table entries for order_items -- 
INSERT INTO order_items (itemPrice, quantity, orders_orderId)
		Values (221, 4, 1);
INSERT INTO order_items (itemPrice, quantity, orders_orderId)
		Values (441, 6, 3);
INSERT INTO order_items (itemPrice, quantity, orders_orderId)
		Values (215, 10, 2);
INSERT INTO order_items (itemPrice, quantity, orders_orderId)
		Values (121, 2, 2);
INSERT INTO order_items (itemPrice, quantity, orders_orderId)
		Values (69, 1, 4);
        
        -- table entries for products -- 
INSERT INTO products (productName, productType, music_store_storeId, categories_categoryId,order_items_itemId, noOfProducts)
		values ("Album songs-1", "Listening", 1, 1,1, 12);
INSERT INTO products (productName, productType, music_store_storeId, categories_categoryId,order_items_itemId, noOfProducts)
		values ("Album songs-2", "Listening", 1, 1,1, 15);
INSERT INTO products (productName, productType, music_store_storeId, categories_categoryId,order_items_itemId, noOfProducts)
		values ("Video songs", "Entertainment", 2, 2, 2, 10);
INSERT INTO products (productName, productType, music_store_storeId, categories_categoryId,order_items_itemId, noOfProducts)
		values (" Bluetooth", "Electronics", 3, 3, 3, 11);
INSERT INTO products (productName, productType, music_store_storeId, categories_categoryId,order_items_itemId, noOfProducts)
		values ("Air Pods", "Electronics", 2, 2, 2, 22);

-- table entries for singer -- 
INSERT INTO singer (singer_name, gender, music_store_storeId, singerAge)
		Values ("Akon", "Male", 1, 33);
INSERT INTO singer (singer_name, gender, music_store_storeId, singerAge)
		Values ("Dua Lipa", "Female", 2, 31);
INSERT INTO singer (singer_name, gender, music_store_storeId, singerAge)
		Values ("Sid Sri ram", "Male", 3, 26);
INSERT INTO singer (singer_name, gender, music_store_storeId, singerAge)
		Values ("Divine", "Male", 4, 32);
        
        
        

-- table entries for video -- 
INSERT INTO video (actorName, genre, singer_singerId, videoQuality)
		Values ("NTR", "Melody", 1, "HD");
INSERT INTO video (actorName, genre, singer_singerId, videoQuality)
		Values ("Ram Charan", "Romance", 1, "720P");
INSERT INTO video (actorName, genre, singer_singerId, videoQuality)
		Values ("Prabhas", "Gym", 2, "1080P");
INSERT INTO video (actorName, genre, singer_singerId, videoQuality)
		Values ("Bunny", "Melody", 3, "HD");
INSERT INTO video (actorName, genre, singer_singerId, videoQuality)
		Values ("Nagarjuna", "Devotional", 3, "480P");


-- table entries for audio -- 
INSERT INTO audio (singer, music_director, genre, singer_singerId, lyricist)
		Values ("Srinith", "Thaman", "Title Track", 1, "Goud");
INSERT INTO audio (singer, music_director, genre, singer_singerId, lyricist)
		Values ("Venkat", "DSP", "Romance", 1, "Tamminana");
INSERT INTO audio (singer, music_director, genre, singer_singerId, lyricist)
		Values ("Allu Sirish", "Gibran", " BackGround", 2, "srinivas");
INSERT INTO audio (singer, music_director, genre, singer_singerId, lyricist)
		Values ("Hriday", "Anuoop Rubens", "Title Track", 3, "Krupati");
INSERT INTO audio (singer, music_director, genre, singer_singerId, lyricist)
		Values ("Akhil", "Anirudh", "Melody", 3, "Jahardar");

        



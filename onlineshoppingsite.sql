-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: onlineshoppingsite
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartid` int DEFAULT NULL,
  `productid` int DEFAULT NULL,
  `productquantity` int DEFAULT NULL,
  KEY `pcns` (`productid`),
  KEY `cartcns` (`cartid`),
  CONSTRAINT `cartcns` FOREIGN KEY (`cartid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pcns` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (2,17,3),(7,17,1),(8,2,10),(9,16,1),(9,8,1),(9,9,1),(7,6,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryid` int NOT NULL AUTO_INCREMENT,
  `categorytitle` varchar(255) NOT NULL DEFAULT 'other',
  `categoryimage` varchar(255) NOT NULL DEFAULT 'default.png',
  `categorydescription` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Laptops','Laptops.jpg',' If you are looking for laptops online, Online Shopping Site India is the place for you. Explore a wide range of laptops online at attractive prices. Check out the wide assortment of top class laptops available on Online Shopping Site India. Shop for a wide range of Laptops from top brands such as HP, Dell, Lenovo, Acer, Apple, Asus, Microsoft, Xiaomi, LG and more.'),(7,'Computer Accessories & Peripherals','computeracc.jpg','Welcome to the computer accessories store.Shop from the widest selection of Printers,Monitors, Keyboards, Mice, Laptop bags, Gaming accessories, PC Speakers, Laptop,batteries, Laptop stands and tables and more.'),(8,'Mobile','Mobile.jpg',' you will be able to find an elaborate selection of mobile from top brands'),(9,'Televisions','tv.jpg','Shop from the hottest deals for you Mi,OnePlus, Samsung, LG, Sony, TCL, Sanyo, Hisense. Unsure which TV is right for you? Browse our TV Buying Guide. Enjoy hassle-free shopping with 1 year brand warranty, easy returns, cash on delivery and Pan India delivery*.'),(11,'Speaker','speaker.jpeg','From Philips subwoofers and Intex soundbars to JBL boombox and JBL flip 4 speakers, music systems may come in different types and sizes, so you can pick one as per your requirements and your budget. A few things to consider before buying a sound system are the power output, drivers, frequency range and its connectivity options. The power output can be anywhere between 20 W to 300 W');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactus`
--

DROP TABLE IF EXISTS `contactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactus` (
  `fname` varchar(500) NOT NULL,
  `lname` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `msg` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contactdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contactusid` int NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL DEFAULT 'not answered',
  PRIMARY KEY (`contactusid`),
  KEY `contactusid` (`contactusid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactus`
--

LOCK TABLES `contactus` WRITE;
/*!40000 ALTER TABLE `contactus` DISABLE KEYS */;
INSERT INTO `contactus` VALUES ('Prashant','Jha','prashant@gmail.com','I have brought a laptop a week ago but still it has not delivered','2021-03-22 11:30:45',4,'not answered'),('Prashant','Jha','prashant@gmail.com','please try to solve it soon','2021-03-22 11:37:32',5,'not answered');
/*!40000 ALTER TABLE `contactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `discount` float NOT NULL DEFAULT '0',
  `discountdescription` varchar(255) DEFAULT NULL,
  `categoryid` int NOT NULL,
  KEY `disck` (`categoryid`),
  CONSTRAINT `disck` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (10,'Only for  three days hurry...!!!!',1),(40,'For Two days',8),(6,'as much we satisfy you',11);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderproduct`
--

DROP TABLE IF EXISTS `orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderproduct` (
  `orderid` varchar(500) NOT NULL,
  `productid` int NOT NULL,
  `productname` varchar(500) NOT NULL,
  `productdescription` varchar(500) NOT NULL,
  `productprice` float NOT NULL,
  `categoryid` int NOT NULL,
  `quantity` int NOT NULL,
  `productcategory` varchar(255) NOT NULL,
  `productimage` varchar(255) NOT NULL,
  `productdiscount` float NOT NULL,
  `netprice` float NOT NULL,
  KEY `productkey` (`productid`),
  KEY `orderpkey` (`orderid`),
  CONSTRAINT `orderpkey` FOREIGN KEY (`orderid`) REFERENCES `ordertable` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderproduct`
--

LOCK TABLES `orderproduct` WRITE;
/*!40000 ALTER TABLE `orderproduct` DISABLE KEYS */;
INSERT INTO `orderproduct` VALUES ('16157886775361',8,'Redmi 9','Redmi 9 Prime (Sunrise Flare, 64 GB)  (4 GB RAM) 4 GB RAM | 64 GB ROM | Expandable Upto 512 GB',11999,8,1,'Mobile','p9.jpg',0,11999),('16157886775361',9,'Redmi 9 Fiery Red','4 GB RAM | 64 GB ROM 16.59 cm (6.53 inch) Full HD+ Display | 48MP Rear Camera | 8MP Front Camera |Qualcomm Snapdragon 662 Processor | 6000 mAh Battery',11429,8,1,'Mobile','p9.jpg',0,11429),('16157890867511',8,'Redmi 9','Redmi 9 Prime (Sunrise Flare, 64 GB)  (4 GB RAM) 4 GB RAM | 64 GB ROM | Expandable Upto 512 GB',11999,8,1,'Mobile','p9.jpg',0,11999),('16157890867511',9,'Redmi 9 Fiery Red','4 GB RAM | 64 GB ROM 16.59 cm (6.53 inch) Full HD+ Display | 48MP Rear Camera | 8MP Front Camera |Qualcomm Snapdragon 662 Processor | 6000 mAh Battery',11429,8,1,'Mobile','p9.jpg',0,11429),('16157894686241',9,'Redmi 9 Fiery Red','4 GB RAM | 64 GB ROM 16.59 cm (6.53 inch) Full HD+ Display | 48MP Rear Camera | 8MP Front Camera |Qualcomm Snapdragon 662 Processor | 6000 mAh Battery',11429,8,1,'Mobile','p9.jpg',0,11429),('16157896555851',9,'Redmi 9 Fiery Red','4 GB RAM | 64 GB ROM 16.59 cm (6.53 inch) Full HD+ Display | 48MP Rear Camera | 8MP Front Camera |Qualcomm Snapdragon 662 Processor | 6000 mAh Battery',11429,8,5,'Mobile','p9.jpg',0,57145),('16157896555851',3,'Dell Latitude','Dell Latitude 3400 / i5-8265U/4GB 2400 Mhz/1 TB/Ubuntu/14\"HD/NO ODD/3 Yrs ADP/Backlit KB/Intel® Dual-Band Wireless-AC 9560+BT5.0/ 3 Cell',39000,1,1,'Laptops','p3.jpeg',10,35100),('16157984006437',4,'Lenovo Ideapad','lenovo Ideapad S145 Core i5 10th Gen - (8 GB/1 TB HDD/Windows 10 Home) S145-15IIL Laptop  (15.6 inch, Platinum Grey, 1.85 kg, With MS Office)',66690,1,2,'Laptops','p4.jpg',10,120042),('16157984006437',8,'Redmi 9','Redmi 9 Prime (Sunrise Flare, 64 GB)  (4 GB RAM) 4 GB RAM | 64 GB ROM | Expandable Upto 512 GB',11999,8,1,'Mobile','p9.jpg',0,11999),('16157986341907',7,'Poco X3','POCO X3 (Cobalt Blue, 128 GB)  (6 GB RAM)',20999,8,4,'Mobile','p7.jpeg',0,83996),('16157989073207',7,'Poco X3','POCO X3 (Cobalt Blue, 128 GB)  (6 GB RAM)',20999,8,1,'Mobile','p7.jpeg',0,20999),('16158720130827',1,'HP Laptop','HP 15 7th Gen Intel Core i3 Processor 15.6-inch FHD Laptop (4GB/1TB HDD/Windows 10 Home/MS Office/Sparkling Black /2.04 kg), 15q-ds0007TU',43990,1,3,'Laptops','p1.jpeg',10,118773),('16161528031661',7,'Poco X3','POCO X3 (Cobalt Blue, 128 GB)  (6 GB RAM)',20999,8,1,'Mobile','p7.jpeg',40,12599.4),('16161532545527',5,'HP Omen','HP Omen 15 Ryzen 7 Octa Core 4800H - (16 GB/1 TB SSD/Windows 10 Home/6 GB Graphics/NVIDIA GeForce RTX 2060/144 Hz) 15-en0037AX Gaming Laptop  (15.6 inch, Mica Silver, 2.37 kg)',140347,1,2,'Laptops','p5.jpg',10,252625),('16161539229397',8,'Redmi 9','Redmi 9 Prime (Sunrise Flare, 64 GB)  (4 GB RAM) 4 GB RAM | 64 GB ROM | Expandable Upto 512 GB',11999,8,4,'Mobile','p9.jpg',40,28797.6),('16163910941687',16,'MarQ Bluetooth Soundbar ','\r\nMarQ 120W soundbar comes with a subwoofer to deliver heavy bass along with loud volume to give you a cinema like experience. Bring your TV to life with this hassle-free, wireless, beautifully designed, sleek soundbar. The MarQ soundbar will be an ideal companion to your TV and give you an experience that matches your expectations.\r\n',6499,11,1,'Speaker','marqspeaker.jpeg',6,6109.06),('16166909078851',2,'Dell Vestro','Dell Vostro 3590 15.6-inch FHD Laptop (10th Gen Core i3-10110U/4GB/1TB HDD/Windows 10 + MS Office/Intel HD Graphics), Black',53000,1,31,'Laptops','p2.jpg',10,1478700),('16166919827361',2,'Dell Vestro','Dell Vostro 3590 15.6-inch FHD Laptop (10th Gen Core i3-10110U/4GB/1TB HDD/Windows 10 + MS Office/Intel HD Graphics), Black',53000,1,31,'Laptops','p2.jpg',10,1478700),('16166924087601',5,'HP Omen','HP Omen 15 Ryzen 7 Octa Core 4800H - (16 GB/1 TB SSD/Windows 10 Home/6 GB Graphics/NVIDIA GeForce RTX 2060/144 Hz) 15-en0037AX Gaming Laptop  (15.6 inch, Mica Silver, 2.37 kg)',140347,1,31,'Laptops','p5.jpg',10,3915680),('16166928172251',6,'HP Pavilion','HP Pavilion x360 Core i5 8th Gen - (8 GB/1 TB HDD/256 GB SSD/Windows 10 Home/2 GB Graphics) 14-dh0043TX 2 in 1 Laptop  (14 inch, Mineral Silver, 1.65 kg, With MS Office)',91470,1,20,'Laptops','p6.jpeg',10,1646460),('161677891302715',5,'HP Omen','HP Omen 15 Ryzen 7 Octa Core 4800H - (16 GB/1 TB SSD/Windows 10 Home/6 GB Graphics/NVIDIA GeForce RTX 2060/144 Hz) 15-en0037AX Gaming Laptop  (15.6 inch, Mica Silver, 2.37 kg)',140347,1,1,'Laptops','p5.jpg',10,126312);
/*!40000 ALTER TABLE `orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordertable`
--

DROP TABLE IF EXISTS `ordertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordertable` (
  `orderid` varchar(500) NOT NULL,
  `userid` int NOT NULL,
  `totalprice` float NOT NULL DEFAULT '0',
  `totalitem` int NOT NULL DEFAULT '0',
  `totaldiscount` float NOT NULL DEFAULT '0',
  `dateoforder` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expecteddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shipaddress` varchar(500) NOT NULL,
  `paymentmethod` varchar(500) NOT NULL DEFAULT 'COD(cash on delivery)',
  `status` varchar(255) NOT NULL DEFAULT 'not delivered',
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int NOT NULL,
  `country` varchar(500) NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `userkey` (`userid`),
  CONSTRAINT `userkey` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertable`
--

LOCK TABLES `ordertable` WRITE;
/*!40000 ALTER TABLE `ordertable` DISABLE KEYS */;
INSERT INTO `ordertable` VALUES ('16157886775361',1,23428,2,0,'2021-03-15 06:11:17','2021-03-28 06:11:17','B-22/28 Shop-23 Karol Bag','1234-2344-8989-9991','not delivered','Delhi','Delhi',110074,'india'),('16157890867511',1,23428,2,0,'2021-03-15 06:18:06','2021-03-25 06:11:17','B-22/28 Shop-23 Karol Bag','1234-2344-8989-9991','delivered','Delhi','Delhi',110074,'india'),('16157894686241',1,11429,1,0,'2021-03-15 06:24:28','2021-03-15 06:24:28','B-113 Mukund Vihar, Karawal Nagar near Hari Om garden','1234-2344-8989-9991','not delivered','Delhi','Delhi',110094,'india'),('16157896555851',1,96145,6,3900,'2021-03-15 06:27:35','2021-03-15 06:27:35','B-113 Mukund Vihar, Karawal Nagar near Hari Om garden','1234-2344-8989-9991','not delivered','Delhi','Delhi',110094,'india'),('16157984006437',7,145379,3,13338,'2021-03-15 08:53:20','2021-03-15 08:53:20','Benito Juarez Marg, South Campus, South Moti Bagh','7850-2222-5656-7890','not delivered','New Delhi','Delhi',110021,'india'),('16157986341907',7,83996,4,0,'2021-03-15 08:57:14','2021-03-15 08:57:14','Benito Juarez Marg, South Campus, South Moti Bagh','5656-9099-2341-3451','not delivered','New Delhi','Delhi',110021,'india'),('16157989073207',7,20999,1,0,'2021-03-15 09:01:47','2021-03-15 09:01:47','Benito Juarez Marg, South Campus, South Moti Bagh','1235-7897-5252-4646','not delivered','New Delhi','Delhi',110021,'india'),('16158720130827',7,131970,3,13197,'2021-02-15 08:57:14','2021-02-15 08:57:14','Benito Juarez Marg, South Campus, South Moti Bagh','3696-7894-4569-4545','delivered','Delhi','Delhi',1100035,'india'),('16161528031661',1,20999,1,8399.6,'2021-03-19 11:20:03','2021-03-19 11:20:03','B-113 Mukund Vihar, Karawal Nagar near Hari Om garden','7878-8989-9090-1234','not delivered','Delhi','Delhi',110074,'india'),('16161532545527',7,280694,2,28069.4,'2021-03-19 11:27:34','2021-03-19 11:27:34','Benito Juarez Marg, South Campus, South Moti Bagh','8989-8989-9900-6666','not delivered','Delhi','Delhi',1100035,'india'),('16161539229397',7,47996,4,19198.4,'2021-03-19 11:38:42','2021-03-19 11:38:42','Benito Juarez Marg, South Campus','8989-4449-8970-6767','not delivered','Delhi','Delhi',1100035,'india'),('16163910941687',7,6499,1,389.94,'2021-03-22 05:31:34','2021-03-22 05:31:34','Benito Juarez Marg, South Campus','9638-7894-4545-1236','not delivered','New Delhi','Delhi',110021,'india'),('16166909078851',1,1643000,31,164300,'2021-03-25 16:48:27','2021-03-25 16:48:27','B-113 Mukund Vihar, Karawal Nagar near Hari Om garden','4562-4587-9696-1236','not delivered','Delhi','Delhi',1100035,'india'),('16166919827361',1,1643000,31,164300,'2021-03-25 17:06:22','2021-03-31 17:06:22','B-113 Mukund Vihar, Karawal Nagar near Hari Om garden','9696-9696-9999-4545','not delivered','New Delhi','Delhi',110021,'india'),('16166924087601',1,4350760,31,435076,'2021-03-25 17:13:28','2021-03-25 17:13:28','B-113 Mukund Vihar, Karawal Nagar near Hari Om garden','5252-7896-4587-1236','not delivered','Delhi','Delhi',1100035,'india'),('16166928172251',1,1829400,20,182940,'2021-03-25 17:20:17','2021-03-25 17:20:17','B-113 Mukund Vihar, Karawal Nagar near Hari Om garden Delhi Delhi-1100035 india','8585-9696-3636-7777','not delivered','Delhi','Delhi',110074,'india'),('161677891302715',15,140347,1,14034.7,'2021-03-26 17:15:13','2021-03-27 17:15:13','Benito Juarez Marg, South Campus, South Moti Bagh','9696-7894-7474-8888','delivered','New Delhi','Delhi',110021,'india');
/*!40000 ALTER TABLE `ordertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productid` int NOT NULL AUTO_INCREMENT,
  `productname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `productdescription` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `productprice` float NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '0',
  `categoryid` int NOT NULL,
  `productimage` varchar(255) NOT NULL DEFAULT 'productdefault.jpg',
  PRIMARY KEY (`productid`),
  KEY `productct` (`categoryid`),
  CONSTRAINT `productct` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'HP Laptop','HP 15 7th Gen Intel Core i3 Processor 15.6-inch FHD Laptop (4GB/1TB HDD/Windows 10 Home/MS Office/Sparkling Black /2.04 kg), 15q-ds0007TU',43990,23,1,'p1.jpeg'),(2,'Dell Vestro','Dell Vostro 3590 15.6-inch FHD Laptop (10th Gen Core i3-10110U/4GB/1TB HDD/Windows 10 + MS Office/Intel HD Graphics), Black',53000,30,1,'p2.jpg'),(3,'Dell Latitude','Dell Latitude 3400 / i5-8265U/4GB 2400 Mhz/1 TB/Ubuntu/14\"HD/NO ODD/3 Yrs ADP/Backlit KB/Intel® Dual-Band Wireless-AC 9560+BT5.0/ 3 Cell',39000,30,1,'p3.jpeg'),(4,'Lenovo Ideapad','lenovo Ideapad S145 Core i5 10th Gen - (8 GB/1 TB HDD/Windows 10 Home) S145-15IIL Laptop  (15.6 inch, Platinum Grey, 1.85 kg, With MS Office)',66690,0,1,'p4.jpg'),(5,'HP Omen','HP Omen 15 Ryzen 7 Octa Core 4800H - (16 GB/1 TB SSD/Windows 10 Home/6 GB Graphics/NVIDIA GeForce RTX 2060/144 Hz) 15-en0037AX Gaming Laptop  (15.6 inch, Mica Silver, 2.37 kg)',140347,29,1,'p5.jpg'),(6,'HP Pavilion','HP Pavilion x360 Core i5 8th Gen - (8 GB/1 TB HDD/256 GB SSD/Windows 10 Home/2 GB Graphics) 14-dh0043TX 2 in 1 Laptop  (14 inch, Mineral Silver, 1.65 kg, With MS Office)',91470,20,1,'p6.jpeg'),(7,'Poco X3','POCO X3 (Cobalt Blue, 128 GB)  (6 GB RAM)',20999,30,8,'p7.jpeg'),(8,'Redmi 9','Redmi 9 Prime (Sunrise Flare, 64 GB)  (4 GB RAM) 4 GB RAM | 64 GB ROM | Expandable Upto 512 GB',11999,17,8,'p9.jpg'),(9,'Redmi 9 Fiery Red','4 GB RAM | 64 GB ROM 16.59 cm (6.53 inch) Full HD+ Display | 48MP Rear Camera | 8MP Front Camera |Qualcomm Snapdragon 662 Processor | 6000 mAh Battery',11429,45,8,'p9.jpg'),(12,'Mi 4A Pro FHD LED Smart Android TV ',' Boost the fun and watch them all in good and clear-quality on this 108 cm (43) Mi smart TV. Its Full HD display can accentuate your viewing experience and make it better. You can even access video streaming apps on it and never run out of quality-content to watch and enjoy',23000,30,9,'mihorizon1.jpeg'),(14,'Mi 4A Horizon Smart Android TV','Thanks to the Horizon display and wide viewing angle, you can enjoy great detail while watching movies or TV shows. It features pulled-back bezels from each side so that thereâs more space on the screen. This way, the TV will be hard to miss.',16999,21,9,'mihorizon1.jpeg'),(15,'Mi Q1 Smart Android TV','\r\nRevamp your home entertainment experience with this Mi QLED TV that comes with a plethora of cutting-end technologies and a stunning design. This home appliance features the Dolby Vision technology for stunning visuals, DTS-HD Audio for immersive sound, and a 96% Screen-to-Body Ratio for distraction-free visuals.',54999,30,9,'miq1tv.jpeg'),(16,'MarQ Bluetooth Soundbar ','\r\nMarQ 120W soundbar comes with a subwoofer to deliver heavy bass along with loud volume to give you a cinema like experience. Bring your TV to life with this hassle-free, wireless, beautifully designed, sleek soundbar. The MarQ soundbar will be an ideal companion to your TV and give you an experience that matches your expectations.\r\n',6499,29,11,'marqspeaker.jpeg'),(17,'Terabyte KUBIX 2W Speakers','The elegant Terabyte USB computer speakers come in an attractive black and bright yellow colour combination. The edges have been decorated with LED light to further add to its elegance. ',294,20,11,'terabytespeaker.jpeg'),(18,'HP Wired Keyboard and Mouse','\r\nExtend your input capabilities with keyboards and mice from HP. Connection is a breeze with USB connectivity so you can get up and running fast\r\n<br>\r\nWired Keyboard and Wired Mouse\r\n<br>\r\nHP Wired Keyboard and Mouse 160 Combo Set',729,34,7,'wiredkeyborad.jpeg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `productid` int NOT NULL,
  `userid` int NOT NULL,
  `comment` varchar(500) NOT NULL,
  `starcount` int NOT NULL,
  KEY `usercns` (`userid`),
  CONSTRAINT `usercns` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (8,1,'nice product',6),(9,1,'',6),(1,7,'thats great',5),(5,15,'nice product',4);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userpassword` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `useremail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usertype` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'normal',
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userimage` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'userdefault.png',
  PRIMARY KEY (`userid`,`useremail`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Prashant','25180da8d338eb82819105d5f3c7629','prashant@gmail.com','normal','B-113 Mukund Vihar, Karawal Nagar near Hari Om garden Delhi Delhi-1100035 india Delhi Delhi-110074 india','963-423-6710','userdefault.png'),(2,'Admin','e3afed047b08059d0fada10f40c1e5','admin@gmail.com','admin','Company','011-2000005','userdefault.png'),(7,'Demo','f72c1502be8e55f428d69419f5da','demouser@gmail.com','normal','Benito Juarez Marg, South Campus New Delhi Delhi-110021 india','963-423-6710','userdefault.png'),(8,'Mohan','b3f947379e88aab49c26f395aaebaee','mohan@gmail.com','normal','B-23/28 Noida sector-23 Delhi Delhi-05','8988887770','userdefault.png'),(9,'Prashant','25180da8d338eb82819105d5f3c7629','demo1@gmail.com','normal','Noida sector -23','9999956576','userdefault.png'),(10,'Mohan','25180da8d338eb82819105d5f3c7629','mohan@gmail.com','normal','b-11 street-10 geeta colony dlhi-94','93167032824','userdefault.png'),(11,'home','202cb962ac5975b964b7152d234b70','home@gmail.com','normal','sjdjsakjkdjl','9634236710','userdefault.png'),(13,'gaurav','25180da8d338eb82819105d5f3c7629','gaurav@gmail.com','normal','B-113 Mukund Vihar, Karawal Nagar near Hari Om garden','9634236710','userdefault.png'),(15,'Mohan','ce596ff204fe1baa6fabd7e507c5415','mohan12@gmail.com','normal','Benito Juarez Marg, South Campus, South Moti Bagh New Delhi Delhi-110021 india','963-423-6710','userdefault.png'),(16,'prashantignou8@gmail.com','b3bc9ce555f7d127c6da44337e364f','prashantignou8@gmail.com','normal','demo','9634236710','userdefault.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-30  0:53:51

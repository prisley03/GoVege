DELETE FROM [MsUser];
DBCC CHECKIDENT ('[MsUser]', RESEED, 0);

SET IDENTITY_INSERT [dbo].[MsUser] ON
INSERT INTO [dbo].[MsUser] ([userID], [userName], [userPhone], [userPassword], [userEmail], [userFoodPreference], [userImage]) VALUES (1, N'Dale Cooper', N'+62 887-622-143', N'dale1234', N'dale@mail.com', N'Vegan', N'dalecooper.jpg')
INSERT INTO [dbo].[MsUser] ([userID], [userName], [userPhone], [userPassword], [userEmail], [userFoodPreference], [userImage]) VALUES (2, N'Kanye West', N'+62 823-5065-2398', N'kanye1234', N'kanye@mail.com', N'Vegetarian', N'kanye.jpg')
INSERT INTO [dbo].[MsUser] ([userID], [userName], [userPhone], [userPassword], [userEmail], [userFoodPreference], [userImage]) VALUES (3, N'Ongo Gablogian', N'+62 887-4390-15859', N'ongo1234', N'ongo@mail.com', N'Vegan', N'ongo gablogian.png')
INSERT INTO [dbo].[MsUser] ([userID], [userName], [userPhone], [userPassword], [userEmail], [userFoodPreference], [userImage]) VALUES (4, N'Martin Scorsese', N'+62 892-4986-18939', N'martin1234', N'martin@mail.com', N'Vegan', N'scorsese.jpg')
INSERT INTO [dbo].[MsUser] ([userID], [userName], [userPhone], [userPassword], [userEmail], [userFoodPreference], [userImage]) VALUES (5, N'Flight Reacts', N'+62 870-451-048', N'flight1234', N'flight@mail.com', N'Vegetarian', N'shockedguy.png')
INSERT INTO [dbo].[MsUser] ([userID], [userName], [userPhone], [userPassword], [userEmail], [userFoodPreference], [userImage]) VALUES (6, N'Admin', N'+62 555-555-555', N'admin1234', N'admin@mail.com', N'Admin', N'admin.jpg')
SET IDENTITY_INSERT [dbo].[MsUser] OFF


DELETE FROM [MsVoucher];
DBCC CHECKIDENT ('[MsVoucher]', RESEED, 0);

SET IDENTITY_INSERT [dbo].[MsVoucher] ON
INSERT INTO [dbo].[MsVoucher] ([voucherID], [voucherName], [description], [startDate], [endDate], [discountAmount], [photo]) VALUES (1, N'35% off for our new users', N'Mandiry, DCA, VegPay, UVU', N'2023-04-01', N'2023-04-14', 0.35, N'voucher-3.png')
INSERT INTO [dbo].[MsVoucher] ([voucherID], [voucherName], [description], [startDate], [endDate], [discountAmount], [photo]) VALUES (2, N'50% off on christmas eve', N'Mandiry, DCA, VegPay, UVU', N'2023-12-18', N'2023-12-26', 0.5, N'voucher-2.png')
INSERT INTO [dbo].[MsVoucher] ([voucherID], [voucherName], [description], [startDate], [endDate], [discountAmount], [photo]) VALUES (3, N'10% off at the market', N'Mandiry, DCA, VegPay, UVU', N'2023-06-10', N'2023-12-10', 0.1, N'voucher-5.png')
INSERT INTO [dbo].[MsVoucher] ([voucherID], [voucherName], [description], [startDate], [endDate], [discountAmount], [photo]) VALUES (4, N'70% off at black friday', N'Mandiry, DCA, VegPay, UVU', N'2023-03-13', N'2023-05-10', 0.7, N'voucher-4.png')
INSERT INTO [dbo].[MsVoucher] ([voucherID], [voucherName], [description], [startDate], [endDate], [discountAmount], [photo]) VALUES (5, N'60% off on Labor Day', N'Mandiry, DCA, VegPay, UVU', N'2023-08-10', N'2023-09-06', 0.6, N'voucher-1.png')
SET IDENTITY_INSERT [dbo].[MsVoucher] OFF

DELETE FROM [MsDriver];
DBCC CHECKIDENT ('[MsDriver]', RESEED, 0);

SET IDENTITY_INSERT [dbo].[MsDriver] ON
INSERT INTO [dbo].[MsDriver] ([driverID], [driverName], [driverLicensePlate], [driverVehicleName], [driverImage], [driverRating]) VALUES (1, N'Jimmy DeSanta', N'B 1990 AWT', N'Daihatsu Xenia', N'jimmy.png', 3.5)
INSERT INTO [dbo].[MsDriver] ([driverID], [driverName], [driverLicensePlate], [driverVehicleName], [driverImage], [driverRating]) VALUES (2, N'Bjork', N'B 1045 RGB', N'Toyota Camry', N'bjork.jpg', 5)
INSERT INTO [dbo].[MsDriver] ([driverID], [driverName], [driverLicensePlate], [driverVehicleName], [driverImage], [driverRating]) VALUES (3, N'Kendrick Lamar', N'L 1556 TWT', N'Daihatsu Sigra', N'kdot.jpg', 4.5)
INSERT INTO [dbo].[MsDriver] ([driverID], [driverName], [driverLicensePlate], [driverVehicleName], [driverImage], [driverRating]) VALUES (4, N'Mega Mind', N'B 1990 SSE', N'Toyota Avanza', N'megamind.jpg', 4)
INSERT INTO [dbo].[MsDriver] ([driverID], [driverName], [driverLicensePlate], [driverVehicleName], [driverImage], [driverRating]) VALUES (5, N'Tupac Shakur', N'N 1423 FFR', N'Honda Civic', N'tupac.png', 5)
SET IDENTITY_INSERT [dbo].[MsDriver] OFF


DELETE FROM [MsVendorCategory];
DBCC CHECKIDENT ('[MsVendorCategory]', RESEED, 0);

SET IDENTITY_INSERT [dbo].[MsVendorCategory] ON
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName], [categoryImage]) VALUES (1, N'Indonesian', N'soto.png')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName], [categoryImage]) VALUES (2, N'Chinese', N'mapotofu.jpg')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName], [categoryImage]) VALUES (3, N'Salad', N'rujak.png')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName], [categoryImage]) VALUES (4, N'Rice', N'nasigoreng.jpg')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName], [categoryImage]) VALUES (5, N'International', N'pizza.jpg')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName], [categoryImage]) VALUES (6, N'Coffee', N'coffee.png')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName], [categoryImage]) VALUES (7, N'Dessert', N'cheesecake.jpg')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName], [categoryImage]) VALUES (8, N'Breakfast', N'croissant.jpg')
SET IDENTITY_INSERT [dbo].[MsVendorCategory] OFF

DELETE FROM [MsVendor];
DBCC CHECKIDENT ('[MsVendor]', RESEED, 0);

SET IDENTITY_INSERT [dbo].[MsVendor] ON
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (1, N'Vegan King', N'79k, Jalan Marunda Kepu', 4.5, N'gadogado.png', N'Vegan', 3)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (2, N'Warung Mbak Sri', N'15, Jalan Teuku Umar', 5, N'kangkung.png', N'Vegan', 1)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (3, N'Lesehan Ratu Sari', N'Y7 No.10, Jalan Raya Pondok Kopi', 4.5, N'soto.png', N'Vegetarian', 1)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (4, N'Sugoi Sushi', N'Lapangan Golf Pangkalan Jati, 1, Jalan Jati Raya', 4, N'sushi.jpg', N'Vegetarian', 4)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (5, N'Mi Casa Su Casa', N'Rumah Sakit Umum Persahabatan, 1, Jalan Persahabatan Raya', 4, N'tacos.jpg', N'Vegetarian', 5)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (6, N'The Chinese Restaurant', N'18, Jalan Lembang', 4, N'mapotofu.jpg', N'Vegan', 2)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (7, N'Rice Kingdom', N'CImobil, 54, Jalan Penganten Ali', 5, N'jollofrice.jpg', N'Vegan', 4)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (8, N'Ooh La La Bistro', N'Institut Kesenian Jakarta, 1, Jalan Sekolah Seni', 5, N'nasilemak.jpg', N'Vegan', 4)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (9, N'Curry Place', N'Kav 4-5, Jalan Profesor Dokter Satrio', 4.5, N'curry.png', N'Vegetarian', 5)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (10, N'La Korean Restaurante', N'Graha WPN Bulding, 26, Jalan Yos Sudarso', 5, N'bibimbap.jpg', N'Vegetarian', 5)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (11, N'Nooderinos', N'12, Jalan Gereja Theresia', 4.5, N'noodles.jpg', N'Vegan', 2)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (12, N'Cheesecake Factory', N'126, Jalan KH. Mas Mansyur', 4.5, N'cheesecake.jpg', N'Vegan', 7)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (13, N'Cafe Society', N'14, Jalan Juana', 5, N'quiche.jpg', N'Vegetarian', 6)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (14, N'Cafe Cafe Cafe', N'79k, Jalan Marunda Kepu', 4, N'coffee.png', N'Vegan', 6)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (15, N'Sultan''s Palace', N'Lot 9, Sudirman Central Business District Northway', 4.5, N'falafels.png', N'Vegetarian', 5)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (16, N'Jamba Juice', N'No. 6 Kav B6, Jalan Rendani', 3.5, N'orangejuice.jpg', N'Vegetarian', 8)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (17, N'Rice a Ronis', N'Y7 No.10, Jalan Raya Pondok Kopi', 5, N'daal.jpg', N'Vegan', 4)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (18, N'Signora No', N'Kantor Pos Besar, 1, Jalan Lapangan Banteng Utara', 3.5, N'mushrooms.jpg', N'Vegan', 5)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (19, N'Pie O My', N'125, Jalan Tanjung Selor', 4.5, N'pie.jpg', N'Vegetarian', 7)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (20, N'Pizzeria Oh No', N'Grand Heaven Funeral House, 191-193, Jalan Pluit Raya', 3.5, N'pizza.jpg', N'Vegetarian', 5)
SET IDENTITY_INSERT [dbo].[MsVendor] OFF

DELETE FROM [MsProduct];
DBCC CHECKIDENT ('[MsProduct]', RESEED, 0);

SET IDENTITY_INSERT [dbo].[MsProduct] ON
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (1, 1, N'Caesar Salad', 40000, N'caesar.jpg', N'Vegan', 50)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (2, 1, N'Gado Gado', 25000, N'gadogado.png', N'Vegan', 75)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (3, 1, N'Cobb Salad', 50000, N'cobb.jpg', N'Vegan', 100)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (4, 1, N'Salad of Salads', 50000, N'cobb.jpg', N'Vegan', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (5, 2, N'Gado Gado', 30000, N'gadogado.png', N'Vegan', 125)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (6, 2, N'Nasi Goreng', 25000, N'nasigoreng.jpg', N'Vegan', 100)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (7, 2, N'Sayur Asem', 35000, N'sayurasem.jpe', N'Vegan', 25)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (8, 2, N'Pecel Madiun', 60000, N'pecel.png', N'Vegan', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (9, 2, N'Tahu Bacem', 55000, N'tahu.jpe', N'Vegan', 175)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (10, 2, N'Tempe Bacem', 55000, N'tempe.jpg', N'Vegan', 200)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (11, 3, N'Paneer', 20000, N'paneer.jpg', N'Vegetarian', 200)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (12, 3, N'Pasta', 25000, N'pasta.jpg', N'Vegetarian', 250)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (13, 3, N'Pizza', 50000, N'pizza.jpg', N'Vegetarian', 225)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (14, 3, N'Quiche', 75000, N'quiche.jpg', N'Vegetarian', 225)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (15, 4, N'Sushi', 50000, N'sushi.jpg', N'Vegetarian', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (16, 4, N'Soto', 30000, N'soto.png', N'Vegetarian', 125)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (17, 4, N'Rujak Cingur', 35000, N'rujak.png', N'Vegetarian', 175)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (18, 5, N'Tacos', 60000, N'tacos.jpg', N'Vegetarian', 75)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (19, 5, N'Ratatouille', 40000, N'ratatouille.jpg', N'Vegetarian', 100)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (20, 5, N'Croissant', 100000, N'croissant.jpg', N'Vegetarian', 50)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (21, 5, N'Cheesecake', 60000, N'cheesecake.jpg', N'Vegetarian', 25)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (22, 5, N'Bread', 75000, N'bread.png', N'Vegetarian', 75)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (23, 6, N'Nasi Lemak', 50000, N'nasilemak.jpg', N'Vegan', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (24, 6, N'Mapo Tofu', 25000, N'mapotofu.jpg', N'Vegan', 175)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (25, 6, N'Peanut Noodles', 35000, N'noodles.jpg', N'Vegan', 200)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (26, 7, N'Fried Mushrooms', 40000, N'mushrooms.jpg', N'Vegan', 250)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (27, 7, N'Nasi Goreng', 30000, N'nasigoreng.jpg', N'Vegan', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (28, 7, N'Jollof Rice', 45000, N'jollofrice.jpg', N'Vegan', 175)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (29, 7, N'Daal', 35000, N'daal.jpg', N'Vegan', 200)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (30, 7, N'Shish Kabob', 15000, N'shishkabob.png', N'Vegan', 250)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (31, 8, N'Kangkung Belacan', 25000, N'kangkung.png', N'Vegan', 25)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (32, 8, N'Kopi Kenangan', 10000, N'coffee.png', N'Vegan', 50)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (33, 8, N'Cheesecake', 50000, N'cheesecake (2).jpg', N'Vegan', 200)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (34, 8, N'English Breakfast', 45000, N'breakfast.jpg', N'Vegan', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (35, 8, N'Brownies', 50000, N'brownies.jpg', N'Vegan', 250)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (36, 8, N'Burger', 40000, N'burger.png', N'Vegan', 175)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (37, 9, N'Bibimbap', 50000, N'bibimbap.jpg', N'Vegetarian', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (38, 9, N'Daal', 75000, N'daal.jpg', N'Vegetarian', 75)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (39, 9, N'Curry', 20000, N'curry.png', N'Vegetarian', 100)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (40, 9, N'Falafel', 40000, N'falafels.png', N'Vegetarian', 125)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (41, 10, N'Bibimbap', 30000, N'bibimbap.jpg', N'Vegetarian', 100)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (42, 10, N'Mashed Potatoes', 10000, N'mash.jpg', N'Vegetarian', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (43, 10, N'Orange Juice', 5000, N'orangejuice.jpg', N'Vegetarian', 125)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (44, 10, N'Apple Pie', 20000, N'pie.jpg', N'Vegetarian', 75)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (45, 11, N'Rendang', 50000, N'rendang.jpg', N'Vegan', 100)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (46, 11, N'Ramen', 75000, N'ramen.jpg', N'Vegan', 200)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (47, 11, N'Nooderinos', 100000, N'noodles.jpg', N'Vegan', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (48, 12, N'Strawberry Cheesecake', 125000, N'cheesecake (2).jpg', N'Vegan', 250)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (49, 12, N'Blueberry Cheesecake', 125000, N'cheesecake.jpg', N'Vegan', 250)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (50, 12, N'Coffee', 10000, N'coffee.png', N'Vegan', 100)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (51, 13, N'Coffee', 15000, N'coffee.png', N'Vegetarian', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (52, 13, N'Croissant', 20000, N'croissant.jpg', N'Vegetarian', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (53, 13, N'Quiche', 25000, N'quiche.jpg', N'Vegetarian', 175)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (54, 14, N'Coffee', 15000, N'coffee.png', N'Vegan', 50)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (55, 15, N'Falafel', 40000, N'falafels.png', N'Vegan', 100)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (56, 15, N'Daal', 50000, N'daal.jpg', N'Vegan', 200)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (57, 15, N'Curry', 60000, N'curry.png', N'Vegan', 250)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (58, 15, N'Paneer', 50000, N'paneer.jpg', N'Vegan', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (59, 16, N'Juice', 10000, N'orangejuice.jpg', N'Vegan', 75)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (60, 17, N'Nasi Goreng', 10000, N'nasigoreng.jpg', N'Vegan', 100)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (61, 17, N'Daal', 20000, N'daal.jpg', N'Vegan', 150)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (62, 17, N'Jollof Rice', 30000, N'jollofrice.jpg', N'Vegan', 175)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (63, 17, N'Nasi Lemak', 40000, N'nasilemak.jpg', N'Vegan', 200)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (64, 18, N'Pasta', 45000, N'pasta.jpg', N'Vegan', 250)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (65, 18, N'Pizza', 45000, N'pizza.jpg', N'Vegan', 250)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (66, 19, N'Mystery Pie', 30000, N'pie.jpg', N'Vegetarian', 225)
INSERT INTO [dbo].[MsProduct] ([productID], [vendorID], [productName], [productPrice], [productImage], [productFoodType], [productCalories]) VALUES (67, 20, N'Pizza', 25000, N'pizza.jpg', N'Vegetarian', 250)
SET IDENTITY_INSERT [dbo].[MsProduct] OFF

DELETE FROM [MsCart];

INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (1, 1, 2)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (1, 4, 1)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (1, 6, 1)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (1, 8, 1)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (2, 11, 1)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (2, 12, 1)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (2, 13, 1)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (3, 23, 1)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (3, 24, 2)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (3, 26, 1)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (4, 46, 2)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (4, 47, 1)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (4, 48, 2)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (4, 50, 1)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (5, 37, 1)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (5, 38, 2)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (5, 40, 1)
INSERT INTO [dbo].[MsCart] ([userID], [productID], [quantity]) VALUES (5, 41, 2)

DELETE FROM [MsTransaction];
DBCC CHECKIDENT ('[MsTransaction]', RESEED, 0);

SET IDENTITY_INSERT [dbo].[MsTransaction] ON
INSERT INTO [dbo].[MsTransaction] ([transactionID], [userID], [driverID], [voucherID], [deliveryDate], [deliveryTime], [deliveryAddress], [deliveryNotes], [paymentMethod]) VALUES (1, 1, 2, NULL, N'2023-06-01', N'19:30:00', N'15931, Indiana Avenue', NULL, N'DCA')
INSERT INTO [dbo].[MsTransaction] ([transactionID], [userID], [driverID], [voucherID], [deliveryDate], [deliveryTime], [deliveryAddress], [deliveryNotes], [paymentMethod]) VALUES (2, 1, 3, 2, N'2023-05-25', N'15:00:00', N'15931, Indiana Avenue', N'deliver to security', N'Mandiry')
INSERT INTO [dbo].[MsTransaction] ([transactionID], [userID], [driverID], [voucherID], [deliveryDate], [deliveryTime], [deliveryAddress], [deliveryNotes], [paymentMethod]) VALUES (3, 1, 5, 4, N'2023-06-10', N'20:00:00', N'15931, Indiana Avenue', N'no pickles', N'UVU')
INSERT INTO [dbo].[MsTransaction] ([transactionID], [userID], [driverID], [voucherID], [deliveryDate], [deliveryTime], [deliveryAddress], [deliveryNotes], [paymentMethod]) VALUES (4, 2, 1, 1, N'2023-04-30', N'12:00:00', N'369, West Arlight Street', NULL, N'VegPay')
INSERT INTO [dbo].[MsTransaction] ([transactionID], [userID], [driverID], [voucherID], [deliveryDate], [deliveryTime], [deliveryAddress], [deliveryNotes], [paymentMethod]) VALUES (5, 2, 4, 3, N'2023-04-22', N'16:30:00', N'369, West Arlight Street', N'black gate', N'DCA')
INSERT INTO [dbo].[MsTransaction] ([transactionID], [userID], [driverID], [voucherID], [deliveryDate], [deliveryTime], [deliveryAddress], [deliveryNotes], [paymentMethod]) VALUES (6, 2, 5, 5, N'2023-06-18', N'19:00:00', N'369, West Arlight Street', N'black gate', N'DCA')
INSERT INTO [dbo].[MsTransaction] ([transactionID], [userID], [driverID], [voucherID], [deliveryDate], [deliveryTime], [deliveryAddress], [deliveryNotes], [paymentMethod]) VALUES (7, 3, 1, NULL, N'2023-06-18', N'18:00:00', N'712, Belden Avenue', N'with extra condiments', N'Mandiry')
INSERT INTO [dbo].[MsTransaction] ([transactionID], [userID], [driverID], [voucherID], [deliveryDate], [deliveryTime], [deliveryAddress], [deliveryNotes], [paymentMethod]) VALUES (8, 3, 2, 4, N'2023-03-31', N'15:45:00', N'712, Belden Avenue', N'without rice', N'Mandiry')
INSERT INTO [dbo].[MsTransaction] ([transactionID], [userID], [driverID], [voucherID], [deliveryDate], [deliveryTime], [deliveryAddress], [deliveryNotes], [paymentMethod]) VALUES (9, 4, 3, 3, N'2023-03-30', N'17:30:00', N'16511, Summershade Drive', N'with no peas', N'DCA')
INSERT INTO [dbo].[MsTransaction] ([transactionID], [userID], [driverID], [voucherID], [deliveryDate], [deliveryTime], [deliveryAddress], [deliveryNotes], [paymentMethod]) VALUES (10, 4, 5, 1, N'2023-02-26', N'19:00:00', N'16511, Summershade Drive', NULL, N'UVU')
INSERT INTO [dbo].[MsTransaction] ([transactionID], [userID], [driverID], [voucherID], [deliveryDate], [deliveryTime], [deliveryAddress], [deliveryNotes], [paymentMethod]) VALUES (11, 5, 4, NULL, N'2023-06-17', N'20:00:00', N'1440, West 25th Street', NULL, N'VegPay')
SET IDENTITY_INSERT [dbo].[MsTransaction] OFF

DELETE FROM [MsTransactionDetail];
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (1, 1, 2)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (1, 2, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (1, 4, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (1, 5, 3)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (1, 6, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (2, 23, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (2, 24, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (2, 25, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (3, 45, 2)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (3, 46, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (3, 48, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (4, 37, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (4, 38, 2)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (5, 51, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (5, 52, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (5, 53, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (6, 51, 2)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (7, 55, 2)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (7, 56, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (7, 58, 1)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (8, 64, 2)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (8, 65, 2)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (9, 59, 2)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (9, 60, 2)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (10, 16, 3)
INSERT INTO [dbo].[MsTransactionDetail] ([transactionID], [productID], [quantity]) VALUES (11, 18, 5)


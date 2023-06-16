DELETE FROM [MsUser];
DBCC CHECKIDENT ('[MsUser]', RESEED, 0);

SET IDENTITY_INSERT [dbo].[MsUser] ON
INSERT INTO [dbo].[MsUser] ([userID], [userName], [userPhone], [userPassword], [userEmail], [userFoodPreference], [userImage]) VALUES (1, N'Dale Cooper', N'+62 887-622-143', N'dale1234', N'dale@mail.com', N'Vegan', N'dalecooper.jpg')
INSERT INTO [dbo].[MsUser] ([userID], [userName], [userPhone], [userPassword], [userEmail], [userFoodPreference], [userImage]) VALUES (2, N'Kanye West', N'+62 823-5065-2398', N'kanye1234', N'kanye@mail.com', N'Vegetarian', N'kanye.jpg')
INSERT INTO [dbo].[MsUser] ([userID], [userName], [userPhone], [userPassword], [userEmail], [userFoodPreference], [userImage]) VALUES (3, N'Ongo Gablogian', N'+62 887-4390-15859', N'ongo1234', N'ongo@mail.com', N'Vegan', N'ongo gablogian.png')
INSERT INTO [dbo].[MsUser] ([userID], [userName], [userPhone], [userPassword], [userEmail], [userFoodPreference], [userImage]) VALUES (4, N'Martin Scorsese', N'+62 892-4986-18939', N'martin1234', N'martin@mail.com', N'Vegan', N'scorsese.jpg')
INSERT INTO [dbo].[MsUser] ([userID], [userName], [userPhone], [userPassword], [userEmail], [userFoodPreference], [userImage]) VALUES (5, N'Flight Reacts', N'+62 870-451-048', N'flight1234', N'flight@mail.com', N'Vegetarian', N'shockedguy.png')
SET IDENTITY_INSERT [dbo].[MsUser] OFF

DELETE FROM [MsVoucher];
DBCC CHECKIDENT ('[MsVoucher]', RESEED, 0);

SET IDENTITY_INSERT [dbo].[MsVoucher] ON
INSERT INTO [dbo].[MsVoucher] ([voucherID], [voucherName], [discountAmount], [voucherImage], [startDate], [endDate]) VALUES (1, N'35% off for our new users', 35, N'voucher-1.png', N'2023-04-01', N'2023-04-14')
INSERT INTO [dbo].[MsVoucher] ([voucherID], [voucherName], [discountAmount], [voucherImage], [startDate], [endDate]) VALUES (2, N'50% off on christmas eve', 50, N'voucher-2.png', N'2023-12-25', N'2023-12-30')
INSERT INTO [dbo].[MsVoucher] ([voucherID], [voucherName], [discountAmount], [voucherImage], [startDate], [endDate]) VALUES (3, N'10% off at the market', 10, N'voucher-3.png', N'2023-04-11', N'2023-05-04')
INSERT INTO [dbo].[MsVoucher] ([voucherID], [voucherName], [discountAmount], [voucherImage], [startDate], [endDate]) VALUES (4, N'70% off at black friday', 70, N'voucher-4.png', N'2023-03-13', N'2023-05-10')
INSERT INTO [dbo].[MsVoucher] ([voucherID], [voucherName], [discountAmount], [voucherImage], [startDate], [endDate]) VALUES (5, N'60% off on Labor Day', 60, N'voucher-5.png', N'2023-09-04', N'2023-09-30')
SET IDENTITY_INSERT [dbo].[MsVoucher] OFF

DELETE FROM [MsDriver];
DBCC CHECKIDENT ('[MsDriver]', RESEED, 0);

SET IDENTITY_INSERT [dbo].[MsDriver] ON
INSERT INTO [dbo].[MsDriver] ([driverID], [driverName], [driverLicensePlate], [driverVehicleName], [driverImage]) VALUES (1, N'Jimmy DeSanta', N'B 1990 AWT', N'Daihatsu Xenia', N'jimmy.png')
INSERT INTO [dbo].[MsDriver] ([driverID], [driverName], [driverLicensePlate], [driverVehicleName], [driverImage]) VALUES (2, N'Bjork', N'B 1045 RGB ', N'Toyota Camry', N'bjork.jpg')
INSERT INTO [dbo].[MsDriver] ([driverID], [driverName], [driverLicensePlate], [driverVehicleName], [driverImage]) VALUES (3, N'Kendrick Lamar', N'L 1556 TWT', N'Daihatsu Sigra', N'kdot.jpg')
INSERT INTO [dbo].[MsDriver] ([driverID], [driverName], [driverLicensePlate], [driverVehicleName], [driverImage]) VALUES (4, N'Mega Mind', N'B 1990 SSE', N'Toyota Avanza', N'megamind.jpg')
INSERT INTO [dbo].[MsDriver] ([driverID], [driverName], [driverLicensePlate], [driverVehicleName], [driverImage]) VALUES (5, N'Tupac Shakur', N'N 1423 FFR', N'Honda Civic', N'tupac.png')
SET IDENTITY_INSERT [dbo].[MsDriver] OFF

DELETE FROM [MsVendorCategory];
DBCC CHECKIDENT ('[MsVendorCategory]', RESEED, 0);

SET IDENTITY_INSERT [dbo].[MsVendorCategory] ON
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName]) VALUES (1, N'Indonesian')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName]) VALUES (2, N'Chinese')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName]) VALUES (3, N'Salad')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName]) VALUES (4, N'Rice')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName]) VALUES (5, N'International')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName]) VALUES (6, N'Coffee')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName]) VALUES (7, N'Dessert')
INSERT INTO [dbo].[MsVendorCategory] ([categoryID], [categoryName]) VALUES (8, N'Breakfast')
SET IDENTITY_INSERT [dbo].[MsVendorCategory] OFF

DELETE FROM [MsVendor];
DBCC CHECKIDENT ('[MsVendor]', RESEED, 0);

SET IDENTITY_INSERT [dbo].[MsVendor] ON
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (1, N'Vegan King', N'79k, Jalan Marunda Kepu', 4.5, N'gadogado.png', N'Vegan', 3)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (2, N'Warung Mbak Sri', N'15, Jalan Teuku Umar', 4.8, N'kangkung.png', N'Vegan', 1)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (3, N'Lesehan Ratu Sari', N'Y7 No.10, Jalan Raya Pondok Kopi', 4.7, N'soto.png', N'Vegetarian', 1)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (4, N'Sugoi Sushi', N'Lapangan Golf Pangkalan Jati, 1, Jalan Jati Raya', 4.6, N'sushi.jpg', N'Vegetarian', 4)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (5, N'Mi Casa Su Casa', N'Rumah Sakit Umum Persahabatan, 1, Jalan Persahabatan Raya', 4.5, N'tacos.jpg', N'Vegetarian', 5)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (6, N'The Chinese Restaurant', N'18, Jalan Lembang', 4.8, N'mapotofu.jpg', N'Vegan', 2)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (7, N'Rice Kingdom', N'CImobil, 54, Jalan Penganten Ali', 4.7, N'jollofrice.jpg', N'Vegan', 4)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (8, N'Ooh La La Bistro', N'Institut Kesenian Jakarta, 1, Jalan Sekolah Seni', 5, N'nasilemak.jpg', N'Vegan', 4)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (9, N'Curry Place', N'Kav 4-5, Jalan Profesor Dokter Satrio', 4.4, N'curry.png', N'Vegetarian', 5)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (10, N'La Korean Restaurante', N'Graha WPN Bulding, 26, Jalan Yos Sudarso', 5, N'bibimbap.jpg', N'Vegetarian', 5)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (11, N'Nooderinos', N'12, Jalan Gereja Theresia', 4.6, N'noodles.jpg', N'Vegan', 2)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (12, N'Cheesecake Factory', N'126, Jalan KH. Mas Mansyur', 4.9, N'cheesecake.jpg', N'Vegan', 7)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (13, N'Cafe Society', N'14, Jalan Juana', 4.6, N'quiche.jpg', N'Vegetarian', 6)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (14, N'Cafe Cafe Cafe', N'79k, Jalan Marunda Kepu', 4.8, N'coffee.png', N'Vegan', 6)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (15, N'Sultan''s Palace', N'Lot 9, Sudirman Central Business District Northway', 4.9, N'falafels.png', N'Vegetarian', 5)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (16, N'Jamba Juice', N'No. 6 Kav B6, Jalan Rendani', 4.6, N'orangejuice.jpg', N'Vegetarian', 8)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (17, N'Rice a Ronis', N'Y7 No.10, Jalan Raya Pondok Kopi', 4.8, N'daal.jpg', N'Vegan', 4)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (18, N'Signora No', N'Kantor Pos Besar, 1, Jalan Lapangan Banteng Utara', 4.7, N'mushrooms.jpg', N'Vegan', 5)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (19, N'Pie O My', N'125, Jalan Tanjung Selor', 4.9, N'pie.jpg', N'Vegetarian', 7)
INSERT INTO [dbo].[MsVendor] ([vendorID], [vendorName], [vendorAddress], [vendorRating], [vendorImage], [vendorTypePreference], [categoryID]) VALUES (20, N'Pizzeria Oh No', N'Grand Heaven Funeral House, 191-193, Jalan Pluit Raya', 4.5, N'pizza.jpg', N'Vegetarian', 5)
SET IDENTITY_INSERT [dbo].[MsVendor] OFF


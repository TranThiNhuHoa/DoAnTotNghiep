-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 04, 2018 lúc 11:15 AM
-- Phiên bản máy phục vụ: 10.1.31-MariaDB
-- Phiên bản PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `recommendation`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `ID` int(1) NOT NULL,
  `admin_name` varchar(10) NOT NULL,
  `admin_password` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`ID`, `admin_name`, `admin_password`) VALUES
(1, 'admin', 123456);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `fuzzy_set`
--

CREATE TABLE `fuzzy_set` (
  `ID` int(10) NOT NULL,
  `Bien_Ngon_Ngu` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `a1` float NOT NULL,
  `b1` float NOT NULL,
  `c1` float NOT NULL,
  `d1` float NOT NULL,
  `h11` float NOT NULL,
  `h12` float NOT NULL,
  `a2` float NOT NULL,
  `b2` float NOT NULL,
  `c2` float NOT NULL,
  `d2` float NOT NULL,
  `h21` float NOT NULL,
  `h22` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `fuzzy_set`
--

INSERT INTO `fuzzy_set` (`ID`, `Bien_Ngon_Ngu`, `a1`, `b1`, `c1`, `d1`, `h11`, `h12`, `a2`, `b2`, `c2`, `d2`, `h21`, `h22`) VALUES
(1, 'cuc_ky_thich', 0.8, 0.9, 1, 1, 1, 1, 0.85, 0.93, 1, 1, 0.8, 0.8),
(2, 'rat_thich', 0.6, 0.7, 0.9, 1, 1, 1, 0.65, 0.73, 0.87, 0.95, 0.8, 0.8),
(3, 'yeu_thich', 0.4, 0.5, 0.7, 0.8, 1, 1, 0.45, 0.53, 0.67, 0.75, 0.8, 0.8),
(4, 'binh_thuong', 0.2, 0.3, 0.5, 0.6, 1, 1, 0.25, 0.33, 0.47, 0.55, 0.8, 0.8),
(5, 'khong_thich', 0, 0.1, 0.3, 0.4, 1, 1, 0.05, 0.13, 0.27, 0.35, 0.8, 0.8),
(6, 'rat_khong_thich', 0, 0, 0.1, 0.2, 1, 1, 0, 0, 0.05, 0.15, 0.8, 0.8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoi_nganh`
--

CREATE TABLE `khoi_nganh` (
  `Khoi_Nganh_ID` int(11) NOT NULL,
  `Ten_Khoi_Nganh` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `So_Chi_Tieu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `khoi_nganh`
--

INSERT INTO `khoi_nganh` (`Khoi_Nganh_ID`, `Ten_Khoi_Nganh`, `So_Chi_Tieu`) VALUES
(1, 'Khối ngành I', 0),
(2, 'Khối ngành II', 0),
(3, 'Khối ngành III', 0),
(4, 'Khối ngành IV', 0),
(5, 'Khối ngành V', 0),
(6, 'Khối ngành VI', 0),
(7, 'Khối ngành VII', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoi_thi`
--

CREATE TABLE `khoi_thi` (
  `Khoi_Thi_ID` int(11) NOT NULL,
  `Ma_Khoi_Thi_BGD` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Mon_Thi_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Mon_Thi_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Mon_Thi_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `khoi_thi`
--

INSERT INTO `khoi_thi` (`Khoi_Thi_ID`, `Ma_Khoi_Thi_BGD`, `Mon_Thi_1`, `Mon_Thi_2`, `Mon_Thi_3`) VALUES
(1, 'A00', 'Toán Học', 'Vật Lí', 'Hóa Học'),
(2, 'A01', 'Toán Học', 'Vật Lí', 'Tiếng Anh'),
(3, 'B00', 'Toán Học', 'Hóa Học', 'Sinh Học'),
(4, 'C00', 'Ngữ Văn', 'Lịch Sử', 'Địa Lý'),
(5, 'D01', 'Ngữ Văn', 'Toán Học', 'Tiếng Anh'),
(6, 'D02', 'Ngữ Văn', 'Toán Học', 'Tiếng Nga'),
(7, 'D03', 'Ngữ Văn', 'Toán Học', 'Tiếng Pháp'),
(8, 'D04', 'Ngữ Văn', 'Toán Học', 'Tiếng Trung'),
(9, 'D05', 'Ngữ Văn', 'Toán Học', 'Tiếng Đức'),
(10, 'D06', 'Ngữ Văn', 'Toán Học', 'Lịch Sử'),
(11, 'A02', 'Toán Học', 'Vật Lí', 'Sinh Học'),
(12, 'A03', 'Toán Học', 'Vật Lí', 'Lịch Sử'),
(13, 'A04', 'Toán Học', 'Vật Lí', 'Địa Lý'),
(14, 'A05', 'Toán Học', 'Hóa Học', 'Lịch Sử'),
(15, 'A06', 'Toán Học', 'Hóa Học', 'Địa Lý'),
(16, 'A07', 'Toán Học', 'Lịch Sử', 'Địa Lý'),
(17, 'A08', 'Toán Học', 'Lịch Sử', 'Giáo Dục Công Dân'),
(18, 'A09', 'Toán Học', 'Địa Lý', 'Giáo Dục Công Dân'),
(19, 'A10', 'Toán Học', 'Vật Lí', 'Giáo Dục Công Dân'),
(20, 'A11', 'Toán Học', 'Hóa Học', 'Giáo Dục Công Dân'),
(21, 'A12', 'Toán Học', 'Khoa Học Tự Nhiên', 'Khoa Học Xã Hội'),
(22, 'A14', 'Toán Học', 'Khoa Học Tự Nhiên', 'Địa Lý'),
(23, 'A15', 'Toán Học', 'Khoa Học Tự Nhiên', 'Lịch Sử'),
(24, 'A16', 'Toán Học', 'Khoa Học Tự Nhiên', 'Ngữ Văn'),
(25, 'A17', 'Toán Học', 'Vật Lí', 'Khoa Học Xã Hội'),
(26, 'A18', 'Toán Học', 'Hóa Học', 'Khoa Học Xã Hội'),
(27, 'B01', 'Toán Học', 'Sinh Học', 'Lịch Sử'),
(28, 'B02', 'Toán Học', 'Sinh Học', 'Địa Lý'),
(29, 'B03', 'Toán Học', 'Sinh Học', 'Ngữ Văn'),
(30, 'B04', 'Toán Học', 'Sinh Học', 'Giáo Dục Công Dân'),
(31, 'B05', 'Toán Học', 'Sinh Học', 'Khoa Học Xã Hội'),
(32, 'B08', 'Toán Học', 'Sinh Học', 'Tiếng Anh'),
(33, 'C01', 'Ngữ Văn', 'Toán Học', 'Vật Lí'),
(34, 'C02', 'Ngữ Văn', 'Toán Học', 'Hóa Học'),
(35, 'C03', 'Ngữ Văn', 'Toán Học', 'Lịch Sử'),
(36, 'C04', 'Ngữ Văn', 'Toán Học', 'Địa Lý'),
(37, 'C05', 'Ngữ Văn', 'Vật Lí', 'Hóa Học'),
(38, 'C06', 'Ngữ Văn', 'Vật Lí', 'Sinh Học'),
(39, 'C07', 'Ngữ Văn', 'Vật Lí', 'Lịch Sử'),
(40, 'C08', 'Ngữ Văn', 'Hóa Học', 'Sinh Học'),
(41, 'C09', 'Ngữ Văn', 'Vật Lí', 'Địa Lý'),
(42, 'C10', 'Ngữ Văn', 'Hóa Học', 'Lịch Sử'),
(43, 'C12', 'Ngữ Văn', 'Sinh Học', 'Lịch Sử'),
(44, 'C13', 'Ngữ Văn', 'Sinh Học', 'Địa Lý'),
(45, 'C14', 'Ngữ Văn', 'Toán Học', 'Giáo Dục Công Dân'),
(46, 'C16', 'Ngữ Văn', 'Vật Lí', 'Giáo Dục Công Dân'),
(47, 'C17', 'Ngữ Văn', 'Hóa Học', 'Giáo Dục Công Dân'),
(48, 'C19', 'Ngữ Văn', 'Lịch Sử', 'Giáo Dục Công Dân'),
(49, 'C20', 'Ngữ Văn', 'Địa Lý', 'Giáo Dục Công Dân'),
(50, 'D07', 'Toán Học', 'Hóa Học', 'Tiếng Anh'),
(51, 'D08', 'Toán Học', 'Sinh Học', 'Tiếng Anh'),
(52, 'D09', 'Toán Học', 'Lịch Sử', 'Tiếng Anh'),
(53, 'D10', 'Toán Học', 'Địa Lý', 'Tiếng Anh'),
(54, 'D11', 'Ngữ Văn', 'Vật Lí', 'Tiếng Anh'),
(55, 'D12', 'Ngữ Văn', 'Hóa Học', 'Tiếng Anh'),
(56, 'D13', 'Ngữ Văn', 'Sinh Học', 'Tiếng Anh'),
(57, 'D14', 'Ngữ Văn', 'Lịch Sử', 'Tiếng Anh'),
(58, 'D15', 'Ngữ Văn', 'Địa Lý', 'Tiếng Anh'),
(59, 'D16', 'Toán Học', 'Địa Lý', 'Tiếng Đức'),
(60, 'D17', 'Toán Học', 'Địa Lý', 'Tiếng Nga'),
(61, 'D18', 'Toán Học', 'Địa Lý', 'Tiếng Nhật'),
(62, 'D19', 'Toán Học', 'Địa Lý', 'Tiếng Pháp'),
(63, 'D20', 'Toán Học', 'Địa Lý', 'Tiếng Trung'),
(64, 'D21', 'Toán Học', 'Hóa Học', 'Tiếng Đức'),
(65, 'D22', 'Toán Học', 'Hóa Học', 'Tiếng Nga'),
(66, 'D23', 'Toán Học', 'Hóa Học', 'Tiếng Nhật'),
(67, 'D24', 'Toán Học', 'Hóa Học', 'Tiếng Pháp'),
(68, 'D25', 'Toán Học', 'Hóa Học', 'Tiếng Trung'),
(69, 'D26', 'Toán Học', 'Vật Lí', 'Tiếng Đức'),
(70, 'D27', 'Toán Học', 'Vật Lí', 'Tiếng Nga'),
(71, 'D28', 'Toán Học', 'Vật Lí', 'Tiếng Nhật'),
(72, 'D29', 'Toán Học', 'Vật Lí', 'Tiếng Pháp'),
(73, 'D30', 'Toán Học', 'Vật Lí', 'Tiếng Trung'),
(74, 'D31', 'Toán Học', 'Sinh Học', 'Tiếng Đức'),
(75, 'D32', 'Toán Học', 'Sinh Học', 'Tiếng Nga'),
(76, 'D33', 'Toán Học', 'Sinh Học', 'Tiếng Nhật'),
(77, 'D34', 'Toán Học', 'Sinh Học', 'Tiếng Pháp'),
(78, 'D35', 'Toán Học', 'Sinh Học', 'Tiếng Trung'),
(79, 'D41', 'Ngữ Văn', 'Địa Lý', 'Tiếng Đức'),
(80, 'D42', 'Ngữ Văn', 'Địa Lý', 'Tiếng Nga'),
(81, 'D43', 'Ngữ Văn', 'Địa Lý', 'Tiếng Nhật'),
(82, 'D44', 'Ngữ Văn', 'Địa Lý', 'Tiếng Pháp'),
(83, 'D45', 'Ngữ Văn', 'Địa Lý', 'Tiếng Trung'),
(84, 'D52', 'Ngữ Văn', 'Vật Lí', 'Tiếng Nga'),
(85, 'D54', 'Ngữ Văn', 'Vật Lí', 'Tiếng Pháp'),
(86, 'D55', 'Ngữ Văn', 'Vật Lí', 'Tiếng Trung'),
(87, 'D61', 'Ngữ Văn', 'Lịch Sử', 'Tiếng Đức'),
(88, 'D62', 'Ngữ Văn', 'Lịch Sử', 'Tiếng Nga'),
(89, 'D63', 'Ngữ Văn', 'Lịch Sử', 'Tiếng Nhật'),
(90, 'D64', 'Ngữ Văn', 'Lịch Sử', 'Tiếng Pháp'),
(91, 'D65', 'Ngữ Văn', 'Lịch Sử', 'Tiếng Trung'),
(92, 'D66', 'Ngữ Văn', 'Giáo Dục Công Dân', 'Tiếng Anh'),
(93, 'D68', 'Ngữ Văn', 'Giáo Dục Công Dân', 'Tiếng Nga'),
(94, 'D69', 'Ngữ Văn', 'Giáo Dục Công Dân', 'Tiếng Nhật'),
(95, 'D70', 'Ngữ Văn', 'Giáo Dục Công Dân', 'Tiếng Pháp'),
(96, 'D72', 'Ngữ Văn', 'Khoa Học Tự Nhiên', 'Tiếng Anh'),
(97, 'D73', 'Ngữ Văn', 'Khoa Học Tự Nhiên', 'Tiếng Đức'),
(98, 'D74', 'Ngữ Văn', 'Khoa Học Tự Nhiên', 'Tiếng Nga'),
(99, 'D75', 'Ngữ Văn', 'Khoa Học Tự Nhiên', 'Tiếng Nhật'),
(100, 'D76', 'Ngữ Văn', 'Khoa Học Tự Nhiên', 'Tiếng Pháp'),
(101, 'D77', 'Ngữ Văn', 'Khoa Học Tự Nhiên', 'Tiếng Trung'),
(102, 'D78', 'Ngữ Văn', 'Khoa Học Xã Hội', 'Tiếng Anh'),
(103, 'D79', 'Ngữ Văn', 'Khoa Học Xã Hội', 'Tiếng Đức'),
(104, 'D80', 'Ngữ Văn', 'Khoa Học Xã Hội', 'Tiếng Nga'),
(105, 'D81', 'Ngữ Văn', 'Khoa Học Xã Hội', 'Tiếng Nhật'),
(106, 'D82', 'Ngữ Văn', 'Khoa Học Xã Hội', 'Tiếng Pháp'),
(107, 'D83', 'Ngữ Văn', 'Khoa Học Xã Hội', 'Tiếng Trung'),
(108, 'D84', 'Toán Học', 'Giáo Dục Công Dân', 'Tiếng Anh'),
(109, 'D85', 'Toán Học', 'Giáo Dục Công Dân', 'Tiếng Đức'),
(110, 'D86', 'Toán Học', 'Giáo Dục Công Dân', 'Tiếng Nga'),
(111, 'D87', 'Toán Học', 'Giáo Dục Công Dân', 'Tiếng Pháp'),
(112, 'D88', 'Toán Học', 'Giáo Dục Công Dân', 'Tiếng Nhật'),
(113, 'D90', 'Toán Học', 'Khoa Học Tự Nhiên', 'Tiếng Anh'),
(114, 'D91', 'Toán Học', 'Khoa Học Tự Nhiên', 'Tiếng Pháp'),
(115, 'D92', 'Toán Học', 'Khoa Học Tự Nhiên', 'Tiếng Đức'),
(116, 'D93', 'Toán Học', 'Khoa Học Tự Nhiên', 'Tiếng Nga'),
(117, 'D94', 'Toán Học', 'Khoa Học Tự Nhiên', 'Tiếng Nhật'),
(118, 'D95', 'Toán Học', 'Khoa Học Tự Nhiên', 'Tiếng Trung'),
(119, 'D96', 'Toán Học', 'Khoa Học Xã Hội', 'Tiếng Anh'),
(120, 'D97', 'Toán Học', 'Khoa Học Xã Hội', 'Tiếng Pháp'),
(121, 'D98', 'Toán Học', 'Khoa Học Xã Hội', 'Tiếng Đức'),
(122, 'D99', 'Toán Học', 'Khoa Học Xã Hội', 'Tiếng Nga'),
(123, 'H00', 'Ngữ Văn', 'Năng Khiếu Vẽ Nghệ Thuật 1', 'Năng Khiếu Vẽ Nghệ Thuật 2'),
(124, 'H01', 'Toán Học', 'Ngữ Văn', 'Vữ'),
(125, 'H02', 'Toán học', 'Vẽ Hình Họa Mỹ Thuật', 'Vẽ Trang Trí Màu'),
(126, 'H03', 'Toán Học', 'Khoa Học Tự Nhiên', 'Vẽ Năng Khiếu'),
(127, 'H04', 'Toán Học', 'Tiếng Anh', 'Vẽ Năng Khiếu'),
(128, 'H05', 'Ngữ Văn', 'Khoa Học Xã Hội', 'Vẽ Năng Khiếu'),
(129, 'H06', 'Ngữ Văn', 'Tiếng Anh', 'Vẽ Mỹ Thuật'),
(130, 'H07', 'Toán Học', 'Hình Họa', 'Trang Trí'),
(131, 'H08', 'Ngữ Văn', 'Lịch Sử', 'Vẽ Mỹ Thuật'),
(132, 'K01', 'Toán Học', 'Tiếng Anh', 'Tin Học'),
(133, 'M00', 'Ngữ Văn', 'Toán Học', 'Đọc Diễn Cảm - Hát'),
(134, 'M01', 'Ngữ Văn', 'Lịch Sử', 'Năng Khiếu'),
(135, 'M02', 'Toán Học', 'Năng Khiếu 1', 'Năng Khiếu 2'),
(136, 'M03', 'Ngữ Văn', 'Năng Khiếu 1', 'Năng Khiếu 2'),
(137, 'M04', 'Toán Học', 'Đọc Diễn Cảm', 'Hát - Múa'),
(138, 'M09', 'Toán Học', 'Năng Khiếu Mầm Non 1', 'Năng Khiếu Mầm Non 2'),
(139, 'M10', 'Toán Học', 'Tiếng Anh', 'Năng Khiếu 1'),
(140, 'M11', 'Ngữ Văn', 'Năng Khiếu Báo Chí', 'Tiếng Anh'),
(141, 'M13', 'Toán Học', 'Sinh Học', 'Năng Khiếu'),
(142, 'M14', 'Ngữ Văn', 'Năng Khiếu Báo Chí', 'Toán Học'),
(143, 'M15', 'Ngữ Văn', 'Năng Khiếu Báo Chí', 'Tiếng Anh'),
(144, 'M16', 'Ngữ Văn', 'Năng Khiếu Báo Chí', 'Vật Lí'),
(145, 'M17', 'Ngữ Văn', 'Năng Khiếu Báo Chí', 'Lích Sử'),
(146, 'M18', 'Ngữ Văn', 'Năng Khiếu Ảnh Báo Chí', 'Toán Học'),
(147, 'M19', 'Ngữ Văn', 'Năng Khiếu Ảnh Báo Chí', 'Tiếng Anh'),
(148, 'M20', 'Ngữ Văn', 'Năng Khiếu Ảnh Báo Chí', 'Vật Lí'),
(149, 'M21', 'Ngữ Văn', 'Năng Khiếu Ảnh Báo Chí', 'Lịch Sử'),
(150, 'M22', 'Ngữ Văn', 'Năng Khiếu Quay Phim Truyền Hình', 'Toán Học'),
(151, 'M23', 'Ngữ Văn', 'Năng Khiếu Quay Phim Truyền Hình', 'Tiếng Anh'),
(152, 'M24', 'Ngữ Văn', 'Năng Khiếu Quay Phim Truyền Hình', 'Vật Lí'),
(153, 'M25', 'Ngữ Văn', 'Năng Khiếu Quay Phim Truyền Hình', 'Lích Sử'),
(154, 'N00', 'Ngữ Văn', 'Năng Khiếu Âm Nhạc 1', 'Năng Khiếu Âm Nhạc 2'),
(155, 'N01', 'Ngữ Văn', 'Xướng Âm', 'Biểu Diễn Nghệ Thuật'),
(156, 'N02', 'Ngữ Văn', 'Ký Xướng Âm', 'Hát Hoặc Biểu Diễn Nhạc Cụ'),
(157, 'N03', 'Ngữ Văn', 'Ghi Âm - Xướng Âm', 'Chuyên Môn'),
(158, 'N04', 'Ngữ Văn', 'Năng Khiếu Thuyết Trình', 'Năng Khiếu'),
(159, 'N05', 'Ngữ Văn', 'Xây Dựng Kích Bản Sự Kiện', 'Năng Khiếu'),
(160, 'N08', 'Ngữ Văn', 'Hòa Thanh', 'Phát Triển Chủ Đề Và Pgổ Thơ'),
(161, 'N09', 'Ngữ Văn', 'Hòa Thanh', 'Chỉ Huy Tại Chỗ'),
(162, 'R00', 'Ngữ Văn', 'Lích Sử', 'Năng Khiếu Báo Chí'),
(163, 'R01', 'Ngữ Văn', 'Địa Lý', 'Năng Khiếu Biểu Diễn Nghệ Thuật'),
(164, 'R02', 'Ngữ Văn', 'Toán Học', 'Năng Khiếu Biểu Diễn Nghệ Thuật'),
(165, 'R04', 'Ngữ Văn', 'Năng Khiếu Biểu Diễn Nghệ Thuật', 'Năng khiếu Kiến thức Văn Hóa - Xã Hội - Nghệ Thuật'),
(166, 'R05', 'Ngữ Văn', 'Tiếng Anh', 'Năng Khiếu Kiến Thức Truyền Thông'),
(167, 'S00', 'Ngữ Văn', 'Năng Khiếu Sân Khấu Điện Ảnh 1', 'Năng Khiếu Sân Khấu Điện Ảnh 2'),
(168, 'S01', 'Toán Học', 'Năng Khiếu 1', 'Năng Khiếu 2'),
(169, 'T00', 'Toán Học', 'Sinh Học', 'Năng Khiếu Thể Dục Thể Thao'),
(170, 'T01', 'Toán Học', 'Ngữ Văn', 'Năng Khiếu Thể Dục Thể Thao'),
(171, 'T02', 'Ngữ Văn', 'Sinh Học', 'Năng Khiếu Thể Dục Thể Thao'),
(172, 'T03', 'Ngữ Văn', 'Địa Lý', 'Năng Khiếu Thể Dục Thể Thao'),
(173, 'T04', 'Toán Học', 'Vật Lí', 'Năng Khiếu Thể Dục Thể Thao'),
(174, 'T05', 'Ngữ Văn', 'Giáo Dục Công Dân', 'Năng Khiếu'),
(175, 'V00', 'Toán Học', 'Vật Lí', 'Vẽ Hình Họa Mỹ Thuật'),
(176, 'V01', 'Toán Học', 'Ngữ Văn', 'Vẽ Hình Họa Mỹ Thuật'),
(177, 'V02', 'Vẽ Mỹ Thuật', 'Toán Học', 'Tiếng Anh'),
(178, 'V03', 'Vẽ Mỹ Thuật', 'Toán Học', 'Hóa Học'),
(179, 'V04', 'Vẽ Mỹ Thuật', 'Ngữ Văn', 'Vật Lí'),
(180, 'V06', 'Vẽ Mỹ Thuật', 'Toán Học', 'Địa Lý'),
(181, 'V07', 'Vẽ Mỹ Thuật', 'Toán Học', 'Tiếng Đức'),
(182, 'V08', 'Vẽ Mỹ Thuật', 'Toán Học', 'Tiếng Nga'),
(183, 'V09', 'Vẽ Mỹ Thuật', 'Toán Học', 'Tiếng Nhật'),
(184, 'V10', 'Vẽ Mỹ Thuật', 'Toán Học', 'Tiếng Pháp'),
(185, 'V11', 'Vẽ Mỹ Thuật', 'Toán Học', 'Tiếng Trung');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `linh_vuc_dao_tao`
--

CREATE TABLE `linh_vuc_dao_tao` (
  `Linh_Vuc_Dao_Tao_ID` int(11) NOT NULL,
  `Ma_Linh_Vuc_Dao_Tao` int(11) NOT NULL,
  `Ten_Linh_Vuc_Dao_Tao` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `So_Chi_Tieu_Linh_Vuc_Dao_Tao` int(11) NOT NULL,
  `Khoi_Nganh_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `linh_vuc_dao_tao`
--

INSERT INTO `linh_vuc_dao_tao` (`Linh_Vuc_Dao_Tao_ID`, `Ma_Linh_Vuc_Dao_Tao`, `Ten_Linh_Vuc_Dao_Tao`, `So_Chi_Tieu_Linh_Vuc_Dao_Tao`, `Khoi_Nganh_ID`) VALUES
(1, 714, 'Khoa học giáo dục và đào tạo giáo viên', 0, 1),
(2, 721, 'Nghệ thuật', 0, 2),
(3, 722, 'Nhân văn', 0, 7),
(4, 731, 'Khoa học xã hội và hành vi', 0, 7),
(5, 732, 'Báo chí và thông tin', 0, 7),
(6, 734, 'Kinh doanh và quản lý', 0, 3),
(7, 742, 'Khoa học sự sống', 0, 4),
(8, 744, 'Khoa học tự nhiên', 0, 4),
(9, 746, 'Toán và thống kê', 0, 5),
(10, 748, 'Máy tính và công nghệ thông tin', 0, 5),
(11, 751, 'công nghệ kỹ thuật', 0, 5),
(12, 752, 'Kỹ thuật', 0, 5),
(13, 754, 'Sản xuất và chế biến', 0, 5),
(14, 758, 'Kiến trúc và xây dựng', 0, 5),
(15, 762, 'Nông, lâm nghiệp và thủy sản', 0, 5),
(16, 764, 'Thú y', 0, 5),
(17, 772, 'Sức khỏe', 0, 6),
(18, 776, 'Dịch vụ xã hội', 0, 7),
(19, 781, 'Du lịch, khách sạn, thể thao và dịch vụ cá nhân', 0, 7),
(20, 784, 'Dịch vụ vận tải', 0, 7),
(21, 785, 'Môi trường và bảo vệ môi trường', 0, 7),
(22, 786, 'An ninh, Quốc phòng', 0, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nganh`
--

CREATE TABLE `nganh` (
  `Nganh_ID` int(11) NOT NULL,
  `Ma_Nganh_BGD` int(11) NOT NULL,
  `Ten_Nganh` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Nhom_Nganh_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `nganh`
--

INSERT INTO `nganh` (`Nganh_ID`, `Ma_Nganh_BGD`, `Ten_Nganh`, `Nhom_Nganh_ID`) VALUES
(1, 7140101, 'Giáo dục học', 1),
(2, 7140114, 'Quản lý giáo dục', 1),
(3, 7140201, 'Giáo dục Mầm non', 2),
(4, 7140202, 'Giáo dục Tiểu học', 2),
(5, 7140203, 'Giáo dục Đặc biệt', 2),
(6, 7140204, 'Giáo dục Công dân', 2),
(7, 7140205, 'Giáo dục Chính trị', 2),
(8, 7140206, 'Giáo dục Thể chất', 2),
(9, 7140207, 'Huấn luyện thể thao', 2),
(10, 7140208, 'Giáo dục Quốc phòng - An ninh', 2),
(11, 7140209, 'Sư phạm Toán học', 2),
(12, 7140210, 'Sư phạm Tin học', 2),
(13, 7140211, 'Sư phạm Vật Lý', 2),
(14, 7140212, 'Sư phạm Hóa học', 2),
(15, 7140213, 'Sư phạm Sinh học', 2),
(16, 7140214, 'Sư phạm Kỹ thuật công nghiệp', 2),
(17, 7140215, 'Sư phạm Kỹ thuật nông nghiệp', 2),
(18, 7140217, 'Sư phạm Ngữ văn', 2),
(19, 7140218, 'Sư phạm Lịch sử', 2),
(20, 7140219, 'Sư phạm Địa lý', 2),
(21, 7140221, 'Sư phạm Âm nhạc', 2),
(22, 7140222, 'Sư phạm Mỹ thuật', 2),
(23, 7140223, 'Sư phạm Tiếng Bana', 2),
(24, 7140224, 'Sư phạm Tiếng Êđê', 2),
(25, 7140225, 'Sư phạm Tiếng Jrai', 2),
(26, 7140226, 'Sư phạm Tiếng Khmer', 2),
(27, 7140227, 'Sư phạm Tiếng Hmông', 2),
(28, 7140228, 'Sư phạm Tiếng Chăm', 2),
(29, 7140229, 'Sư phạm Tiếng Mnông', 2),
(30, 7140230, 'Sư phạm Tiếng Xê đăng', 2),
(31, 7140231, 'Sư phạm Tiếng Anh', 2),
(32, 7140232, 'Sư phạm Tiếng Nga', 2),
(33, 7140233, 'Sư phạm Tiếng Pháp', 2),
(34, 7140234, 'Sư phạm Tiếng Trung Quốc', 2),
(35, 7140235, 'Sư phạm Tiếng Đức', 2),
(36, 7140236, 'Sư phạm Tiếng Nhật', 2),
(37, 7140237, 'Sư phạm Tiếng Hàn Quốc', 2),
(38, 7140245, 'Sư phạm Nghệ thuật', 2),
(39, 7140246, 'Sư phạm Công nghệ', 2),
(40, 7140247, 'Sư phạm Khoa học tự nhiên', 2),
(41, 7140248, 'Giáo dục Pháp luật', 2),
(42, 7210101, 'Lý luận, lịch sử và phê bình mỹ thuật', 4),
(43, 7210103, 'Hội họa', 4),
(44, 7210104, 'Đồ họa', 4),
(45, 7210105, 'Điêu khắc', 4),
(46, 7210107, 'Gốm', 4),
(47, 7210110, 'Mỹ thuật đô thị', 4),
(48, 7210201, 'Âm nhạc học', 5),
(49, 7210203, 'Sáng tác âm nhạc', 5),
(50, 7210204, 'Chỉ huy âm nhạc', 5),
(51, 7210205, 'Thanh nhạc', 5),
(52, 7210207, 'Biểu diễn nhạc cụ phương Tây', 5),
(53, 7210208, 'Piano', 5),
(54, 7210209, 'Nhạc Jazz', 5),
(55, 7210210, 'Biểu diễn nhạc cụ truyền thống', 5),
(56, 7210221, 'Lý luận, lịch sử và phê bình sân khấu', 5),
(57, 7210225, 'Biên kịch sân khấu', 5),
(58, 7210226, 'Diễn viên sân khấu kịch hát', 5),
(59, 7210227, 'Đạo diễn sân khấu', 5),
(60, 7210231, 'Lý luận, lịch sử và phê bình điện ảnh, truyền hình', 5),
(61, 7210233, 'Biên kịch điện ảnh, truyền hình', 5),
(62, 7210234, 'Diễn viên kịch, điện ảnh, truyền hình', 5),
(63, 7210235, 'Đạo diễn điện ảnh, truyền hình', 5),
(64, 7210236, 'Quay phim', 5),
(65, 7210241, 'Lý luận, lịch sử và phê bình múa', 5),
(66, 7210242, 'Diễn viên múa', 5),
(67, 7210243, 'Biên đạo múa', 5),
(68, 7210244, 'Huấn luyện múa', 5),
(69, 7210301, 'Nhiếp ảnh', 6),
(70, 7210302, 'Công nghệ điện ảnh, truyền hình', 6),
(71, 7210303, 'Thiết kế âm thanh, ash sáng', 6),
(72, 7210402, 'Thiết kế công nghiệp', 7),
(73, 7210403, 'Thiết kế đồ họa', 7),
(74, 7210404, 'Thiết kế thời trang', 7),
(75, 7210406, 'Thiết kế mỹ thuật sân khấu điện ảnh', 7),
(76, 7220101, 'Tiếng Việt và văn hóa Việt Nam', 9),
(77, 7220104, 'Hán Nôm', 9),
(78, 7220105, 'Ngôn ngữ Jrai', 9),
(79, 7220106, 'Ngôn ngữ Khmer', 9),
(80, 7220107, 'Ngôn ngữ Hmông', 9),
(81, 7220108, 'Ngôn ngữ Chăm', 9),
(82, 7220110, 'Sáng tác văn học', 9),
(83, 7220112, 'Văn hóa các dân tọc thiểu số Việt Nam', 9),
(84, 7220201, 'Ngôn ngữ Anh', 10),
(85, 7220202, 'Ngôn ngữ Nga', 10),
(86, 7220203, 'Ngôn ngữ Pháp', 10),
(87, 7220204, 'Ngôn ngữ Trung Quốc', 10),
(88, 7220205, 'Ngôn ngữ Đức', 10),
(89, 7220206, 'Ngôn ngữ Tây Ban Nha', 10),
(90, 7220207, 'Ngôn ngữ Bồ Đào Nha', 10),
(91, 7220208, 'Ngôn ngữ Italia', 10),
(92, 7220209, 'Ngôn ngữ Nhật', 10),
(93, 7220210, 'Ngôn ngữ Hàn Quốc', 10),
(94, 7220211, 'Ngôn ngữ Ả Rập', 10),
(95, 7229001, 'Triết học', 11),
(96, 7229008, 'Chủ nghĩa xã hội khoa học', 11),
(97, 7229009, 'Tôn giáo học', 11),
(98, 7229010, 'Lịch sử', 11),
(99, 7229020, 'Ngôn ngữ học', 11),
(100, 7229030, 'Văn học', 11),
(101, 7229040, 'Văn hóa học', 11),
(102, 7229042, 'Quản lý văn hóa', 11),
(103, 7229045, 'Gia đình học', 11),
(104, 7310101, 'Kinh tế', 12),
(105, 7310102, 'Kinh tế chính trị', 12),
(106, 7310104, 'Kinh tế đầu tư', 12),
(107, 7310105, 'Kinh tế phát triển', 12),
(108, 7310106, 'Kinh tế quốc tế', 12),
(109, 7310107, 'Thống kê kinh tế', 12),
(110, 7310108, 'Toán kinh tế', 12),
(111, 7310201, 'Chính trị học', 13),
(112, 7310202, 'Xây dựng Đảng và chính quyền Nhà nước', 13),
(113, 7310205, 'Quản lý nhà nước', 13),
(114, 7310206, 'Quan hệ quốc tế', 13),
(115, 7310301, 'Xã hội học', 14),
(116, 7310302, 'Nhân học', 14),
(117, 7310401, 'Tâm lý học', 15),
(118, 7310402, 'Tâm lý học giáo dục', 15),
(119, 7310501, 'Địa lý học', 16),
(120, 7310601, 'Quốc tế học', 17),
(121, 7310602, 'Châu Á học', 17),
(122, 7310607, 'Thái Bình Dương học', 17),
(123, 7310608, 'Đông phương học', 17),
(124, 7310612, 'Trung Quốc học', 17),
(125, 7310613, 'Nhật Bản học', 17),
(126, 7310614, 'Hàn Quốc học', 17),
(127, 7310620, 'Đông Nam Á học', 17),
(128, 7310630, 'Việt Nam học', 17),
(129, 7320101, 'Báo chí', 19),
(130, 7320104, 'Truyền thông đa phương tiện', 19),
(131, 7320105, 'Truyền thông đại chúng', 19),
(132, 7320106, 'Công nghệ truyền thông', 19),
(133, 7320107, 'Truyền thông quốc tế', 19),
(134, 7320108, 'Quan hệ công chúng', 19),
(135, 7320201, 'Thông tin - Thư viện', 20),
(136, 7320205, 'Quản lý thông tin', 20),
(137, 7320303, 'Lưu trữ học', 21),
(138, 7320305, 'Bảo tàng học', 21),
(139, 7320401, 'Xuất bản', 22),
(140, 7320402, 'Kinh doanh xuất bản phẩm', 22),
(141, 7340101, 'Quản trị kinh doanh', 24),
(142, 7340115, 'Marketing', 24),
(143, 7340116, 'Bất động sản', 24),
(144, 7340120, 'Kinh doanh quốc tế', 24),
(145, 7340121, 'Kinh doanh thương mại', 24),
(146, 7340122, 'Thương mại điện tử', 24),
(147, 7340123, 'Kinh doanh thời trang và dệt may', 24),
(148, 7340201, 'Tài chính - Ngân hàng', 25),
(149, 7340204, 'Bảo hiểm', 25),
(150, 7340301, 'Kế toán', 26),
(151, 7340302, 'Kiểm toán', 26),
(152, 7340401, 'Khoa học quản lý', 27),
(153, 7340403, 'Quản lý công', 27),
(154, 7340404, 'Quản trị nhân lực', 27),
(155, 7340405, 'Hệ thống thông tin quản lý', 27),
(156, 7340406, 'Quản trị văn phòng', 27),
(157, 7340408, 'Quan hệ lao động', 27),
(158, 7340409, 'Quản lý dự án', 27),
(159, 7380101, 'Luật', 29),
(160, 7380102, 'Luật Hiến pháp và luật Hành chính', 29),
(161, 7380103, 'Luật dân sự và tố tụng dân sự', 29),
(162, 7380104, 'Luật hình sự và tố tụng hình sự', 29),
(163, 7380107, 'Luật kinh tế', 29),
(164, 7380108, 'Luật quốc tế', 29),
(165, 7420101, 'Sinh học', 31),
(166, 7420201, 'Công nghệ sinh học', 32),
(167, 7420202, 'Kỹ thuật sinh học', 32),
(168, 7420203, 'Sinh học ứng dụng', 32),
(169, 7440101, 'Thiên văn học', 34),
(170, 7440102, 'Vật lý học', 34),
(171, 7440106, 'Vật lý nguyên tử và hạt nhân', 34),
(172, 7440110, 'Cơ học', 34),
(173, 7440112, 'Hóa học', 34),
(174, 7440122, 'Khoa học vật liệu', 34),
(175, 7440201, 'Địa chất học', 35),
(176, 7440212, 'Bản đồ học', 35),
(177, 7440217, 'Địa lý tự nhiên', 35),
(178, 7440221, 'Khí tượng và khí hậu học', 35),
(179, 7440224, 'Thủy văn học', 35),
(180, 7440228, 'Hải dương học', 35),
(181, 7440301, 'Khoa học môi trường', 36),
(182, 7460101, 'Toán học', 38),
(183, 7460107, 'Khoa học tính toán', 38),
(184, 7460112, 'Toán ứng dụng', 38),
(185, 7460115, 'Toán cơ', 38),
(186, 7460117, 'Toán tin', 38),
(187, 7460201, 'Thống kê', 39),
(188, 7480101, 'Khoa học máy tính', 41),
(189, 7480102, 'Mạng máy tính và truyền thông dữ liệu', 41),
(190, 7480103, 'Kỹ thuật phần mềm', 41),
(191, 7480104, 'Hệ thống thông tin', 41),
(192, 7480106, 'Kỹ thuật máy tính', 41),
(193, 7480108, 'Công nghệ kỹ thuật máy tính', 41),
(194, 7480201, 'Công nghệ thông tin', 42),
(195, 7480202, 'An toàn thông tin', 42),
(196, 7510101, 'Công nghệ kỹ thuật kiến trúc', 44),
(197, 7510102, 'Công nghệ kỹ thuật công trình xây dựng', 44),
(198, 7510103, 'Công nghệ kỹ thuật xây dựng', 44),
(199, 7510104, 'Công nghệ kỹ thuật giao thông', 44),
(200, 7510105, 'Công nghệ kỹ thuật vật liệu xây dựng', 44),
(201, 7510201, 'Công nghệ kỹ thuật cơ khí', 45),
(202, 7510202, 'Công nghệ chế tạo máy', 45),
(203, 7510203, 'Công nghệ kỹ thuật cơ điện tử', 45),
(204, 7510205, 'Công nghệ kỹ thuật ô tô', 45),
(205, 7510206, 'Công nghệ kỹ thuật nhiệt', 45),
(206, 7510207, 'Công nghệ kỹ thuật tàu thủy', 45),
(207, 7510211, 'Bảo dưỡng công nghiệp', 45),
(208, 7510301, 'Công nghệ kỹ thuật điện, điện tử', 46),
(209, 7510302, 'Công nghệ kỹ thuật điện tử - viễn thông', 46),
(210, 7510303, 'Công nghệ kỹ thuật điều khiển và tự động hóa', 46),
(211, 7510401, 'Công nghệ kỹ thuật hóa học', 47),
(212, 7510402, 'Công nghệ vật liệu', 47),
(213, 7510406, 'Công nghệ kỹ thuật môi trường', 47),
(214, 7510407, 'Công nghệ kỹ thuật hạt nhân', 47),
(215, 7510601, 'Quản lý công nghiệp', 48),
(216, 7510604, 'Kinh tế công nghiệp', 48),
(217, 7510605, 'Logistics và Quản lý chuỗi cung ứng', 48),
(218, 7510701, 'Công nghệ dầu khí và khai thác dầu', 49),
(219, 7510801, 'Công nghệ kỹ thuật in', 50),
(220, 7520101, 'Cơ kỹ thuật', 52),
(221, 7520103, 'Kỹ thuật cơ khí', 52),
(222, 7520114, 'Kỹ thuật cơ điện tử', 52),
(223, 7520115, 'Kỹ thuật nhiệt', 52),
(224, 7520116, 'Kỹ thuật cơ khí động lực', 52),
(225, 7520117, 'Kỹ thuật công nghiệp', 52),
(226, 7520118, 'Kỹ thuật hệ thống công nghiệp', 52),
(227, 7520120, 'Kỹ thuật hàng không', 52),
(228, 7520121, 'Kỹ thuật không gian', 52),
(229, 7520122, 'Kỹ thuật tàu thủy', 52),
(230, 7520130, 'Kỹ thuật ô tô', 52),
(231, 7520137, 'Kỹ thuật in', 52),
(232, 7520201, 'Kỹ thuật điện', 53),
(233, 7520204, 'Kỹ thuật ra-đa dẫn đường', 53),
(234, 7520205, 'Kỹ thuật thủy âm', 53),
(235, 7520206, 'Kỹ thuật biển', 53),
(236, 7520207, 'Kỹ thuật điện tử - viễn thông', 53),
(237, 7520212, 'Kỹ thuật y sinh', 53),
(238, 7520216, 'Kỹ thuật điều khiển và tự động hóa', 53),
(239, 7520301, 'Kỹ thuật hóa học', 54),
(240, 7520309, 'Kỹ thuật vật liệu', 54),
(241, 7520310, 'Kỹ thuật vật liệu kim loại', 54),
(242, 7520312, 'Kỹ thuật dệt', 54),
(243, 7520320, 'Kỹ thuật môi trường', 54),
(244, 7520401, 'Vật lý kỹ thuật', 55),
(245, 7520402, 'Kỹ thuật hạt nhân', 55),
(246, 7520501, 'Kỹ thuật địa chất', 56),
(247, 7520502, 'Kỹ thuật địa vật lý', 56),
(248, 7520503, 'Kỹ thuật trắc địa - bản đồ', 56),
(249, 7520601, 'Kỹ thuật mỏ', 57),
(250, 7520602, 'Kỹ thuật thăm dò và khảo sát', 57),
(251, 7520604, 'Kỹ thuật dầu khí', 57),
(252, 7520607, 'Kỹ thuật tuyển khoáng', 57),
(253, 7540101, 'Công nghệ thực phẩm', 59),
(254, 7540102, 'Kỹ thuật thực phẩm', 59),
(255, 7540104, 'Công nghệ sau thu hoạch', 59),
(256, 7540105, 'Công nghệ chế biến thủy sản', 59),
(257, 7540106, 'Đảm bảo chất lượng và an toàn thực phẩm', 59),
(258, 7540202, 'Công nghệ sợi, dệt', 60),
(259, 7540203, 'Công nghệ vật liệu dệt, may', 60),
(260, 7540204, 'Công nghệ dệt, may', 60),
(261, 7540206, 'Công nghệ da giày', 60),
(262, 7549001, 'Công nghệ chế biến lâm sản', 61),
(263, 7580101, 'Kiến trúc', 62),
(264, 7580102, 'Kiến trúc cảnh quan', 62),
(265, 7580103, 'Kiến trúc nội thất', 62),
(266, 7580104, 'Kiến trúc đô thị', 62),
(267, 7580105, 'Quy hoạch vùng và đô thị', 62),
(268, 7580106, 'Quản lý đô thị và cong trình', 62),
(269, 7580108, 'Thiết kế nội thất', 62),
(270, 7580111, 'Bảo tồn di sản kiến trúc đô thị', 62),
(271, 7580112, 'Đô thị học', 62),
(272, 7580201, 'Kỹ thuật xây dựng', 63),
(273, 7580202, 'Kỹ thuật xây dựng công trình thủy', 63),
(274, 7580203, 'Kỹ thuật xây dựng công trình biển', 63),
(275, 7580205, 'Kỹ thuật xây dựng công trình giao thông', 63),
(276, 7580210, 'Kỹ thuật cơ sở hạ tầng', 63),
(277, 7580211, 'Địa kỹ thuật xây dựng', 63),
(278, 7580212, 'Kỹ thuật tài nguyên nước', 63),
(279, 7580213, 'Kỹ thuật cấp thoát nước', 63),
(280, 7580301, 'Kinh tế xây dựng', 64),
(281, 7580302, 'Quản lý xây dựng', 64),
(282, 7620101, 'Nông nghiệp', 66),
(283, 7620102, 'Khuyến nông', 66),
(284, 7620103, 'Khoa học đất', 66),
(285, 7620105, 'Chăn nuôi', 66),
(286, 7620109, 'Nông học', 66),
(287, 7620110, 'Khoa học cây trồng', 66),
(288, 7620112, 'Bảo vệ thực vật', 66),
(289, 7620113, 'Công nghệ rau hoa quả và cảnh quan', 66),
(290, 7620114, 'Kinh doanh nông nghiệp', 66),
(291, 7620115, 'Kinh tế nông nghiệp', 66),
(292, 7620116, 'Phát triển nông thôn', 66),
(293, 7620201, 'Lâm học', 67),
(294, 7620202, 'Lâm nghiệp đô thị', 67),
(295, 7620205, 'Lâm sinh', 67),
(296, 7620211, 'Quản lý tài nguyên rừng', 67),
(297, 7620301, 'Nuôi trồng thủy sản', 68),
(298, 7620302, 'Bệnh học thủy sản', 68),
(299, 7620303, 'Khoa học thủy sản', 68),
(300, 7620304, 'Khai thác thủy sản', 68),
(301, 7620305, 'Quản lý thủy sản', 68),
(302, 7640404, 'Thú y', 70),
(303, 7720101, 'Y khoa', 71),
(304, 7720110, 'Y học dự phòng', 71),
(305, 7720115, 'Y học cổ truyền', 71),
(306, 7720201, 'Dược học', 72),
(307, 7720203, 'Hóa dược', 72),
(308, 7720301, 'Điều dưỡng', 73),
(309, 7720302, 'Hộ sinh', 73),
(310, 7720401, 'Dinh dưỡng', 74),
(311, 7720501, 'Răng - Hàm - Mặt', 75),
(312, 7720502, 'Kỹ thuật phục hình răng', 75),
(313, 7720601, 'Kỹ thuật xét nghiệm Y học', 76),
(314, 7720602, 'Kỹ thuật hình ảnh Y học', 76),
(315, 7720603, 'Kỹ thuật hồi phục chức năng', 76),
(316, 7720701, 'Y tế công cộng', 77),
(317, 7720801, 'Tổ chức và quản lý y tế', 78),
(318, 7720802, 'Quản lý bệnh viện', 78),
(319, 7729001, 'Y học thể dục thể thao', 79),
(321, 7760101, 'Công tác xã hội', 80),
(322, 7760102, 'Công tác thanh thiếu niên', 80),
(323, 7760103, 'Hỗ trợ giáo dục người khuyết tật', 80),
(324, 7810101, 'Du lịch', 82),
(325, 7810103, 'Quản trị dịch vụ du lịch và lữ hành', 82),
(326, 7810201, 'Quản trị khách sạn', 83),
(327, 7810202, 'Quản trị nhà hàng và dịch vụ ăn uống', 83),
(328, 7810301, 'Quản lỹ thể dục thể thao', 84),
(329, 7810501, 'Kinh tế gia đình', 85),
(330, 7840101, 'Khai thác vận tải', 87),
(331, 7840102, 'Quản lý hoạt động bay', 87),
(332, 7840104, 'Kinh tế vận tải', 87),
(333, 7840106, 'Khoa học hàng hải', 87),
(334, 7850101, 'Quản lý tài nguyên và môi trường', 89),
(335, 7850102, 'Kinh tế tài nguyên thiên nhiên', 89),
(336, 7850103, 'Quản lý đất đai', 89),
(337, 7850201, 'Bảo hộ lao động', 90),
(338, 7860101, 'Trinh sát an ninh', 92),
(339, 7860102, 'Trinh sát cảnh sát', 92),
(340, 7860104, 'Điều tra hình sự', 92),
(341, 7860108, 'Kỹ thuật hình sự', 92),
(342, 7860109, 'Quản lý nhà nước về an ninh trật tự', 92),
(343, 7860110, 'Quản lý trật tự an toàn giao thông', 92),
(344, 7860111, 'Thi hành án hình sự và hỗ trợ tư pháp', 92),
(345, 7860112, 'Tham mưu, chỉ huy công an nhân dân', 92),
(346, 7860113, 'Phòng cháy chữa cháy và cứu nạn cứu hộ', 92),
(347, 7860116, 'Hậu cần công an nhân dân', 92),
(348, 7860117, 'Tình báo an ninh', 92),
(349, 7860201, 'Chỉ huy tham mưu Lục quân', 93),
(350, 7860202, 'Chỉ huy tham mưu Hải quân', 93),
(351, 7860203, 'Chỉ huy tham mưu Không quân', 93),
(352, 7860204, 'Chỉ huy tham mưu Phòng không', 93),
(353, 7860205, 'Chỉ huy tham mưu Pháo binh', 93),
(354, 7860206, 'Chỉ huy tham mưu Thăng - Thiết giáp', 93),
(355, 7860207, 'Chỉ huy tham mưu Đặc công', 93),
(356, 7860214, 'Biên phòng', 93),
(357, 7860217, 'Tình báo quân sự', 93),
(358, 7860218, 'Hậu cần quân sự', 93),
(359, 7860220, 'Chỉ huy tham mưu thông tin', 93),
(360, 7860222, 'Quân sự cơ sở', 93),
(361, 7860224, 'Chỉ huy quản lý kỹ thuật', 93),
(362, 7860226, 'Chỉ huy Kỹ thuật phòng không', 93),
(363, 7860227, 'Chỉ huy kỹ thuật Tăng thiết giáp', 93),
(364, 7860228, 'Chỉ huy kỹ thuật Công binh', 93),
(365, 7860229, 'Chỉ huy kỹ thuật Hóa học', 93),
(366, 7860231, 'Trinh sát kỹ thuật', 93),
(367, 7860232, 'Chỉ huy kỹ thuật Hải quân', 93),
(368, 7860233, 'Chỉ huy kỹ thuật tác chiến điện tử', 93);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhom_nganh`
--

CREATE TABLE `nhom_nganh` (
  `Nhom_Nganh_ID` int(11) NOT NULL,
  `Ma_Nhom_Nganh_BGD` int(11) NOT NULL,
  `Ten_Nhom_Nganh` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `So_Chi_Tieu_Nhom_Nganh` int(11) NOT NULL,
  `Linh_Vuc_Dao_Tao_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `nhom_nganh`
--

INSERT INTO `nhom_nganh` (`Nhom_Nganh_ID`, `Ma_Nhom_Nganh_BGD`, `Ten_Nhom_Nganh`, `So_Chi_Tieu_Nhom_Nganh`, `Linh_Vuc_Dao_Tao_ID`) VALUES
(1, 71401, 'Khoa học giáo dục', 0, 1),
(2, 71402, 'Đào tạo giáo viên', 0, 1),
(3, 71490, 'Khác', 0, 1),
(4, 72101, 'Mỹ thuật', 0, 2),
(5, 72102, 'Nghệ thuật trình diễn', 0, 2),
(6, 72103, 'Nghệ thuật nghe nhìn', 0, 2),
(7, 72104, 'Mỹ thuật ứng dụng', 0, 2),
(8, 72190, 'Khác', 0, 2),
(9, 72201, 'Ngôn ngữ, văn học và văn hóa Việt Nam', 0, 3),
(10, 72202, 'Ngôn ngữ, văn học và văn hóa nước ngoài', 0, 3),
(11, 72290, 'Khác', 0, 3),
(12, 73101, 'Kinh tế học', 0, 4),
(13, 73102, 'Khoa học chính trị', 0, 4),
(14, 73103, 'Xã hội học và Nhân học', 0, 4),
(15, 73104, 'Tâm lý học', 0, 4),
(16, 73105, 'Địa lý học', 0, 4),
(17, 73106, 'Khu vực học', 0, 4),
(18, 73190, 'Khác', 0, 4),
(19, 73201, 'Báo chí và truyền thông', 0, 5),
(20, 73202, 'Thông tin - Thư viện', 0, 5),
(21, 73203, 'Văn thư - Lưu trữ - Bảo tàng', 0, 5),
(22, 73204, 'Xuất bản - Phát hành', 0, 5),
(23, 73290, 'Khác', 0, 5),
(24, 73401, 'Kinh doanh', 0, 6),
(25, 73402, 'Tài chính - Ngân hàng - Bảo hiểm', 0, 6),
(26, 73403, 'Kế toán - Kiểm toán', 0, 6),
(27, 73404, 'Quản trị - Quản lý', 0, 6),
(28, 73490, 'Khác', 0, 6),
(29, 73801, 'Luật', 0, 7),
(30, 73890, 'Khác', 0, 7),
(31, 74201, 'Sinh học', 0, 8),
(32, 74202, 'Sinh học ứng dụng', 0, 8),
(33, 74290, 'Khác', 0, 8),
(34, 74401, 'Khoa học vật chất', 0, 9),
(35, 74402, 'Khoa học trái đất', 0, 9),
(36, 74403, 'Khoa học môi trường', 0, 9),
(37, 74490, 'Khác', 0, 9),
(38, 74601, 'Toán học', 0, 10),
(39, 74602, 'Thống kê', 0, 10),
(40, 74690, 'Khác', 0, 10),
(41, 74801, 'Máy tính', 0, 11),
(42, 74802, 'Công nghệ thông tin', 0, 11),
(43, 74890, 'Khác', 0, 11),
(44, 75101, 'Công nghệ kỹ thuật kiến trúc và công trình xây dựng', 0, 11),
(45, 75102, 'Công nghệ kỹ thuật cơ khí', 0, 11),
(46, 75103, 'Công nghệ kỹ thuật điện, điện tử và viễn thông', 0, 11),
(47, 75104, 'Công nghệ hóa học, vật liệu, luyện kim và môi trường', 0, 11),
(48, 75106, 'Quản lý công nghiệp', 0, 11),
(49, 75107, 'Công nghệ dầu khí và khai thác', 0, 11),
(50, 75108, 'Công nghệ kỹ thuật in', 0, 11),
(51, 75190, 'Khác', 0, 11),
(52, 75201, 'Kỹ thuật cơ khí và cơ kỹ thuật', 0, 12),
(53, 75202, 'Kỹ thuật điện, điện tử và viễn thông', 0, 12),
(54, 75203, 'Kỹ thuật hóa học, vật liệu, luyện kim và môi trường', 0, 12),
(55, 75204, 'Vật lý kỹ thuật', 0, 12),
(56, 75205, 'Kỹ thuật địa chất, địa vật lý và trắc địa', 0, 12),
(57, 75206, 'Kỹ thuật mỏ', 0, 12),
(58, 75290, 'Khác', 0, 12),
(59, 75401, 'Chế biến lương thực, thực phẩm và đồ uống', 0, 13),
(60, 75402, 'Sản xuất, chế biến sợi, vải, giày, da', 0, 13),
(61, 75490, 'Khác', 0, 13),
(62, 75801, 'Kiến trúc và quy hoạch', 0, 14),
(63, 75802, 'Xây dựng', 0, 14),
(64, 75803, 'Quản lý xây dựng', 0, 14),
(65, 75890, 'Khác', 0, 14),
(66, 76201, 'Nông nghiệp', 0, 15),
(67, 76202, 'Lâm nghiệp', 0, 15),
(68, 76203, 'Thủy sản', 0, 15),
(69, 76290, 'Khác', 0, 15),
(70, 76401, 'Thú y', 0, 16),
(71, 77201, 'Y học', 0, 17),
(72, 77202, 'Dược học', 0, 17),
(73, 77203, 'Điều dưỡng - Hộ sinh', 0, 17),
(74, 77204, 'Dinh dưỡng', 0, 17),
(75, 77205, 'Răng - Hàm - Mặt (Nha khoa)', 0, 17),
(76, 77206, 'Kỹ thuật Y học', 0, 17),
(77, 77207, 'Y tế công cộng', 0, 17),
(78, 77208, 'Quản lý Y tế', 0, 17),
(79, 77290, 'Khác', 0, 17),
(80, 77601, 'Công tác xã hội', 0, 18),
(81, 77690, 'Khác', 0, 18),
(82, 78101, 'Du lịch', 0, 19),
(83, 78102, 'Khách sạn, nhà hàng', 0, 19),
(84, 78103, 'Thể dục thể thao', 0, 19),
(85, 78105, 'Kinh tế gia đình', 0, 19),
(86, 78190, 'Khác', 0, 19),
(87, 78401, 'Khai thác vận tải', 0, 20),
(88, 78490, 'Khác', 0, 20),
(89, 78501, 'Quản lý tài nguyên môi trường', 0, 21),
(90, 78502, 'Dịch vụ an toàn lao động và vệ sinh công nghiệp', 0, 21),
(91, 78590, 'Khác', 0, 21),
(92, 78601, 'An ninh và trật tự xã hội', 0, 22),
(93, 78602, 'Quân sự', 0, 22),
(94, 78690, 'Khác', 0, 22);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuoc_tinh_bai_toan_1`
--

CREATE TABLE `thuoc_tinh_bai_toan_1` (
  `ID` int(5) NOT NULL,
  `Ten_Thuoc_Tinh` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `thuoc_tinh_bai_toan_1`
--

INSERT INTO `thuoc_tinh_bai_toan_1` (`ID`, `Ten_Thuoc_Tinh`) VALUES
(1, 'Năng lực bản thân'),
(2, 'Mức độ yêu thích'),
(3, 'Số chỉ tiêu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuoc_tinh_bai_toan_2`
--

CREATE TABLE `thuoc_tinh_bai_toan_2` (
  `ID` int(11) NOT NULL,
  `Ten_Thuoc_Tinh` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `thuoc_tinh_bai_toan_2`
--

INSERT INTO `thuoc_tinh_bai_toan_2` (`ID`, `Ten_Thuoc_Tinh`) VALUES
(1, 'Ranking của trường'),
(2, 'Số chỉ tiêu'),
(3, 'Điểm chuẩn'),
(4, 'Khả năng tìm việc'),
(5, 'Khoảng cách'),
(6, 'Học phí'),
(7, 'Môi trường học tập');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `to_chuc_dao_tao`
--

CREATE TABLE `to_chuc_dao_tao` (
  `To_Chuc_Dao_Tao_ID` int(11) NOT NULL,
  `Ma_To_Chuc_Dao_Tao` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Ten_To_Chuc_Dao_Tao` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Logo` varchar(255) NOT NULL,
  `Website` varchar(255) NOT NULL,
  `Thong_Tin_Tuyen_Sinh` varchar(255) NOT NULL,
  `Rankiing` int(11) NOT NULL,
  `Vi_Tri` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `to_chuc_dao_tao`
--

INSERT INTO `to_chuc_dao_tao` (`To_Chuc_Dao_Tao_ID`, `Ma_To_Chuc_Dao_Tao`, `Ten_To_Chuc_Dao_Tao`, `Logo`, `Website`, `Thong_Tin_Tuyen_Sinh`, `Rankiing`, `Vi_Tri`) VALUES
(1, 'BKA', 'Đại học Bách Khoa Hà Nội', 'img/bkhnlogo.jpg', 'https://www.hust.edu.vn/', 'http://tuyensinhdaihoc.hust.edu.vn/', 1, 'Số 1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội'),
(2, 'QH', 'Đại học Quốc gia Hà Nội', 'img/dhqghnlogo.jpg', 'http://www.vnu.edu.vn/home/', 'http://tuyensinh.vnu.edu.vn/', 2, ''),
(3, 'SPH', 'Đại học Sư phạm Hà Nội', 'img/dhsphnlogo.jpg', 'http://hnue.edu.vn/', 'http://hnue.edu.vn/Tintuc-Sukien/Trangtintonghop/tabid/260/category/61/Default.aspx', 3, ''),
(4, 'TCT', 'Đại học Cần Thơ', 'img/dhctlogo.jpg', 'https://www.ctu.edu.vn/', 'https://tuyensinh.ctu.edu.vn/', 4, 'Khu II, đường 3/2, P. Xuân Khánh, Q. Ninh Kiều, TP. Cần Thơ.'),
(5, 'QS', 'Đại học Quốc Gia Thành Phố Hồ Chí Minh', 'img/dhqgtphcmlogo.jpg', 'http://www.vnuhcm.edu.vn/', 'http://tuyensinh.vnuhcm.edu.vn/', 5, ''),
(6, 'HVN', 'Học viện Nông Nghiệp Việt Nam', 'img/hvnnvnlogo.jpg', 'http://www.vnua.edu.vn/', 'http://tuyensinh.vnua.edu.vn/', 6, ''),
(7, 'MDA', 'Đại học Mỏ - Địa Chất', 'img/dhmdclogo.jpg', 'http://humg.edu.vn/Pages/home.aspx', 'http://ts.humg.edu.vn/Pages/home.aspx', 7, ''),
(8, 'DT', 'Đại học Thái Nguyên', 'img/dhtnlogo.jpg', 'http://www.tnu.edu.vn/Pages/home.aspx', 'http://tuyensinh.tnu.edu.vn/', 8, ''),
(9, 'DD', 'Đại học Đà Nẵng', 'img/dhdnlogo.jpg', 'http://www.udn.vn/', 'http://ts.udn.vn/', 9, ''),
(10, 'YHB', 'Đại học Y Hà Nội', 'img/dhyhnlogo.jpg', 'http://www.hmu.edu.vn/news/default.aspx', 'http://www.hmu.edu.vn/news/xc66_Tuyen-sinh-.html', 10, ''),
(11, 'NLS', 'Đại học Nông Lâm Thành Phố Hồ Chí Minh', 'img/dhnltphcmlogo.jpg', 'http://www.hcmuaf.edu.vn/', 'http://ts.hcmuaf.edu.vn/contents.php?ur=ts&ids=32054', 11, ''),
(12, 'BVH', 'Học viện Công nghệ Bưu chính Viễn thông', 'img/dhcnbcvtlogo.jpg', 'http://portal.ptit.edu.vn/', 'http://portal.ptit.edu.vn/tuyensinh/dh-chinh-quy/', 12, ''),
(13, 'DH', 'Đại học Huế', 'img/dhhlogo.jpg', 'http://hueuni.edu.vn/', 'http://hueuni.edu.vn/portal/vi/index.php/Category/tin-tuyen-sinh.html', 13, ''),
(14, 'KHA', 'Đại học Kinh tế Quốc dân', 'img/dhktqdlogo.jpg', 'https://www.neu.edu.vn/', 'https://tuyensinh.neu.edu.vn/', 14, ''),
(15, 'GHA', 'Đại học Giao Thông Vận tải', 'img/dhgtvtlogo.jpg', 'https://www.utc.edu.vn/', 'http://ts.utc.edu.vn/', 15, ''),
(16, 'TDV', 'Đại học Vinh', 'img/dhvlogo.jpg', 'http://www.vinhuni.edu.vn/', 'http://www.vinhuni.edu.vn/tuyen-sinh/dai-hoc-chinh-quy', 16, ''),
(17, 'KQH', 'Học viện Kỹ thuật Quân sự', 'img/hvktqslogo.jpg', 'http://mta.edu.vn/', 'http://mta.edu.vn/TUY%E1%BB%82N-SINH/Tuy%E1%BB%83n-sinh-%C4%91%E1%BA%A1i-h%E1%BB%8Dc', 17, ''),
(18, 'DQN', 'Đại học Quy Nhơn', 'img/dhqnlogo.jpg', 'http://www.qnu.edu.vn/', 'http://tuyensinh.qnu.edu.vn/', 18, ''),
(19, 'DVT', 'Đại học Trà Vinh', 'img/dhtvlogo.jpg', 'http://www.tvu.edu.vn/', 'https://tuyensinh.tvu.edu.vn/', 19, ''),
(20, 'XDA', 'Đại học Xây Dựng', 'img/dhxdlogo.jpg', 'http://nuce.edu.vn/', 'http://tuyensinh.nuce.edu.vn/', 20, ''),
(21, 'TSN', 'Đại học Nha Trang', 'img/dhntlogo.jpg', 'http://www.ntu.edu.vn/', 'http://tuyensinh.ntu.edu.vn/', 21, ''),
(22, 'KSA', 'Đại học Kinh tế Thành phố Hồ Chí Minh', 'img/dhkttphcmlogo.jpg', 'http://www.ueh.edu.vn/', 'http://tuyensinh.ueh.edu.vn/', 22, ''),
(23, 'QSQ', 'Đại học Quốc tế - Đại học Quốc gia Thp. Hồ Chí Minh', 'img/dhqtdhqgtphcmlogo.jpg', 'https://www.hcmiu.edu.vn/', 'https://tuyensinh.hcmiu.edu.vn/', 23, ''),
(24, 'DDT', 'Đại học Duy Tân', 'img/dhdtlogo.jpg', 'http://duytan.edu.vn/', 'http://duytan.edu.vn/tuyen-sinh/Page/Home.aspx', 24, ''),
(25, 'QST', 'Đại học Khoa Học Tự Nhiên - Đại học Quốc Gia Thp. Hồ Chí Minh', 'img/dhkhtndhqgtphcmlogo.jpg', 'https://www.hcmus.edu.vn/', 'https://tuyensinh.hcmus.edu.vn/', 25, ''),
(26, 'DVL', 'Đại học Văn Lang', 'img/dhvllogo.jpg', 'http://www.vanlanguni.edu.vn/', 'http://tuyensinh.vanlanguni.edu.vn/', 26, ''),
(27, 'RMU', 'Đại học Quốc tế RMIT Việt Nam', 'img/dhqtrmitvnlogo.jpg', 'https://www.rmit.edu.vn/vi', 'http://diemthi.tuyensinh247.com/thong-tin-dai-hoc-quoc-te-rmit-viet-nam-RMU.html', 27, ''),
(28, 'FPT', 'Đại học FPT', 'img/dhfptlogo.jpg', 'http://fpt.edu.vn/don-vi/dai-hoc-fpt', 'http://fpt.edu.vn/don-vi/dai-hoc-fpt', 28, ''),
(29, 'QSC', 'Đại học Công nghệ Thông tin - Đại học Quốc gia Thành phố Hồ Chí Minh', 'img/dhcnttdhqgtphcmlogo.jpg', 'https://www.uit.edu.vn/', 'https://tuyensinh.uit.edu.vn/', 29, ''),
(30, 'YDS', 'Đại học Y dược Thành phố Hồ Chí Minh', 'img/dhydtphcmlogo.jpg', 'http://www.yds.edu.vn/yds2/', 'http://www.yds.edu.vn/yds2/?Content=tuyensinh', 30, ''),
(31, 'DKC', 'Đại học Công nghệ Thp. Hồ Chí Minh', 'img/dhcntphcmlogo.jpg', 'https://www.hutech.edu.vn/', 'http://www.hutech.edu.vn/xet-tuyen-dai-hoc', 31, ''),
(32, 'SPK', 'Đại học Sư phạm Kỹ thuật TP. Hồ Chí Minh', 'img/dhspkttphcmlogo.jpg', 'http://hcmute.edu.vn/', 'http://hcmute.edu.vn/ArticleId/9333f78d-088e-49e5-9a65-1e93a6404c9d/tuyen-sinh-dai-hoc-he-chinh-quy-nam-2018-cua-truong-dh-spkt-tp-hcm', 32, ''),
(33, 'TAG', 'Đại học An Giang', 'img/dhaglogo.jpg', 'http://www.agu.edu.vn/', 'http://www.agu.edu.vn/tuyensinh/', 33, ''),
(34, 'SKH', 'Đại học Sư phạm Kỹ thuật Hưng Yên', 'img/dhspkthylogo.jpg', 'http://www.utehy.edu.vn/', 'http://tuyensinh.utehy.edu.vn/', 34, ''),
(35, 'SPS', 'Đại học Sư phạm TP. HỒ CHÍ MINH', 'img/dhsptphcmlogo.jpg', 'http://www.hcmup.edu.vn/', 'http://www.thongtintuyensinh.vn/Truong_Dai_hoc_Su_pham_TPHCM_C51_D705.htm', 35, ''),
(36, 'NTH', 'Đại học Ngoại thương', 'img/dhngoaithuonglogo.jpg', 'http://ftu.edu.vn/', 'http://www.tuyensinhtoanquoc24h.com/2017/11/truong-dai-hoc-ngoai-thuong-tuyen-sinh.html', 36, ''),
(37, 'NHH', 'Học viện Ngân hàng', 'img/hvnhlogo.jpg', 'http://hvnh.edu.vn/hvnh/vi/home.html', 'http://hvnh.edu.vn/hvnh/vi/thong-tin-tuyen-sinh', 37, ''),
(38, 'DTH', 'Đại học Hoa Sen', 'img/dhhslogo.jpg', 'https://www.hoasen.edu.vn/vi', 'https://tuyensinh.hoasen.edu.vn/', 38, ''),
(39, 'HHA', 'Đại học Hàng hải Việt Nam', 'img/dhhhvnlogo.jpg', 'http://www.vimaru.edu.vn/', 'http://tuyensinh.vimaru.edu.vn/', 39, ''),
(40, 'VGU', 'Đại học Việt - Đức', 'img/dhvdlogo.jpg', 'http://www.vgu.edu.vn/vi/', 'http://www.vgu.edu.vn/vi/web/cms/admission', 40, ''),
(41, 'NTT', 'Đại học Nguyễn Tất Thành', 'img/dhnttlogo.jpg', 'http://ntt.edu.vn/web/', 'http://ntt.edu.vn/web/tuyen-sinh/', 41, ''),
(42, 'HDT', 'Đại học Hồng Đức', 'img/dhhdlogo.jpg', 'http://www.hdu.edu.vn/default.aspx', 'http://www.hdu.edu.vn/default.aspx', 42, ''),
(43, 'MBS', 'Đại học Mở Thành phố Hồ Chí Minh', 'img/dhmtphcmlogo.jpg', 'http://ou.edu.vn/', 'http://tuyensinh.ou.edu.vn/', 43, ''),
(44, 'DLH', 'Đại học Lạc Hồng', 'img/dhlhlogo.jpg', 'https://lhu.edu.vn/', 'https://tuyensinh.lhu.edu.vn/', 44, ''),
(45, '', 'Cao đẳng Nghề Bách Khoa Hà Nội', 'img/bkhnlogo.jpg', 'http://www.hactech.edu.vn/', 'http://www.hactech.edu.vn/vn/Thong-tin-tuyen-sinh-517.html', 45, ''),
(46, 'YTC', 'Đại học Y tế Công cộng', 'img/dhytcclogo.jpg', 'http://www.huph.edu.vn/', 'http://tuyensinh.huph.edu.vn/', 46, ''),
(47, 'DHP', 'Đại học Dân lập Hải Phòng', 'img/dhdlhplogo.jpg', 'http://www.hpu.edu.vn/home/trangchu.html', 'http://www.hpu.edu.vn/tuyensinh/HPUTS-tuyensinh.html', 47, ''),
(48, 'DDL', 'Đại học Điện lực', 'img/dhdllogo.jpg', 'http://epu.edu.vn/', 'http://tuyensinh.epu.edu.vn/', 48, ''),
(49, 'DTN', 'Đại học Nông Lâm Thái Nguyên', 'img/dhnltnlogo.jpg', 'http://tuaf.edu.vn/', 'http://tuyensinh.tuaf.edu.vn/', 49, ''),
(50, 'SP2', 'Đại học Sư phạm Hà Nội 2', 'img/dhsphn2logo.jpg', 'http://www.hpu2.edu.vn/', 'http://tuyensinh.hpu2.edu.vn/', 50, ''),
(51, 'DTK', 'Đại học Kỹ thuật Công nghiệp - Đại học Thái Nguyên', 'img/dhktcntnlogo.jpg', 'http://www.tnut.edu.vn/', 'http://ts.tnut.edu.vn/', 51, ''),
(52, 'QSX', 'Đại học Khoa học Xã hội và Nhân văn - Đại học Quốc gia Thành phố Hồ Chí Minh', 'img/dhkhxhvnvdhqgtphcmlogo.jpg', 'http://hcmussh.edu.vn/', 'http://tuyensinh.hcmussh.edu.vn/', 52, ''),
(53, 'DCN', 'Đại học Công nghiệp Hà Nội', 'img/dhcnhnlogo.jpg', 'https://www.haui.edu.vn/vn', 'https://tuyensinh.haui.edu.vn/', 53, ''),
(54, 'SGD', 'Đại học Sài Gòn', 'img/dhsglogo.jpg', 'https://sgu.edu.vn/', 'http://www.thongtintuyensinh.vn/Truong-Dai-hoc-Sai-Gon_C51_D707.htm', 54, ''),
(55, 'TLA', 'Đại học Thủy lợi', 'img/dhtllogo.jpg', 'http://www.tlu.edu.vn/', 'http://www.tlu.edu.vn/tuyen-sinh', 55, ''),
(56, 'GTA', 'Đại học Công nghệ Giao thông Vận tải', 'img/dhcngtvtlogo.jpg', 'http://utt.edu.vn/', 'http://tuyensinh.utt.edu.vn/', 56, ''),
(57, 'SPD', 'Đại học Đồng Tháp', 'img/dhdongthaplogo.jpg', 'http://www.dthu.edu.vn/', 'http://www.dthu.edu.vn/', 57, ''),
(58, 'LNS', 'Đại học Lâm nghiệp', 'img/dhlnlogo.jpg', 'http://vnuf.edu.vn/', 'http://tuyensinh.vfu.edu.vn/', 58, ''),
(59, 'VHH', 'Đại học Văn hóa Hà Nội', 'img/dhvhhnlogo.jpg', 'http://huc.edu.vn/', 'http://huc.edu.vn/thong-tin-tuyen-sinh-dai-hoc-chinh-quy-nam-2018-5311-vi.htm', 59, ''),
(60, 'LPS', 'Đại học Luật TP.HCM', 'img/dhltphcmlogo.jpg', 'http://www.hcmulaw.edu.vn/', 'http://ts.hcmulaw.edu.vn/', 60, ''),
(61, 'NHS', 'Đại học Ngân hàng Thành phố Hồ Chí Minh', 'img/dhnhtphcmlogo.jpg', 'http://buh.edu.vn/', 'http://tuyensinh.buh.edu.vn/', 61, ''),
(62, 'DTT', 'Đại học Tôn Đức Thắng', 'img/dhtdtlogo.jpg', 'http://www.tdtu.edu.vn/', 'http://tuyensinh.tdtu.edu.vn/', 62, ''),
(63, 'TTB', 'Đại học Tây Bắc', 'img/dhtblogo.jpg', 'http://www.utb.edu.vn/', 'http://www.utb.edu.vn/index.php/tuyen-sinh', 63, ''),
(64, 'HUI', 'Đại học Công nghiệp TP.HCM', 'img/dhcongnghieptphcmlogo.jpg', 'http://www.hui.edu.vn/', 'http://www.utb.edu.vn/index.php/tuyen-sinh', 64, ''),
(65, 'DKH', 'Đại học Dược Hà Nội', 'img/dhdhnlogo.jpg', 'http://www.hup.edu.vn/Pages/default.aspx#section=generalw', 'http://www.hup.edu.vn/Pages/tuyen-sinh.aspx', 65, ''),
(66, 'TYS', 'Đại học Y khoa Phạm Ngọc Thạch', 'img/dhykpntlogo.jpg', 'https://www.pnt.edu.vn/', 'https://pqldt.pnt.edu.vn/vi/tuyen-sinh-dai-hoc-chinh-quy', 66, ''),
(67, 'NHF', 'Đại học Hà Nội', 'img/dhhnlogo.jpg', 'http://www.hanu.edu.vn/vn/', 'http://hanu.vn/vn/chinh-quy.html', 67, ''),
(68, 'KTS', 'Đại học Kiến trúc TP. Hồ Chí Minh', 'img/dhkientructphcmlogo.jpg', 'http://www.uah.edu.vn/', 'http://www.uah.edu.vn/router/dai-hoc-353.html', 68, ''),
(69, 'HTC', 'Học viện Tài chính', 'img/hvtclogo.jpg', 'https://hvtc.edu.vn/', 'https://hvtc.edu.vn/tabid/109/Default.aspx', 69, ''),
(70, 'TDL', 'Đại học Đà Lạt', 'img/dhdalatlogo.jpg', 'http://www.dlu.edu.vn/', 'http://pqldt.dlu.edu.vn/', 70, ''),
(71, 'QSK', 'Đại học Kinh tế Luật - Đại học Quốc gia Thành phố Hồ Chí Minh', 'img/dhktldhqgtphcmlogo.jpg', 'http://www.uel.edu.vn/', 'http://tuyensinh.uel.edu.vn/', 71, ''),
(72, 'QHT', 'Đại học Khoa học Tự nhiên - Đại học Quốc gia Hà Nội', 'img/dhkhtndhqghnlogo.jpg', 'http://hus.vnu.edu.vn/', 'http://hus.vnu.edu.vn/vi/main/tuyensinh', 72, ''),
(73, 'LPH', 'Đại học Luật Hà Nội', 'img/dhlhnlogo.jpg', 'http://hlu.edu.vn/', 'http://tuyensinh.hlu.edu.vn/', 73, ''),
(74, 'MHN', 'Viện đại học Mở Hà Nội', 'img/dhmhnlogo.jpg', 'https://hou.edu.vn/', 'https://tuyensinh.hou.edu.vn/', 74, ''),
(75, 'QHE', 'Đại học Kinh tế - Đại học Quốc gia Hà Nội', 'img/dhktdhqghnlogo.jpg', 'http://ueb.edu.vn/', 'http://tuyensinhdaihoc.ueb.edu.vn/', 75, ''),
(76, 'TDM', 'Đại học Thủ Dầu Một', 'img/dhtdmlogo.jpg', 'https://tdmu.edu.vn/', 'https://tuyensinh.tdmu.edu.vn/', 76, ''),
(77, 'DNT', 'Đại học Ngoại ngữ - Tin học TP.HCM', 'img/dhnnthtphcmlogo.jpg', 'http://www.huflit.edu.vn/', 'http://www.huflit.edu.vn/tuyen-sinh-39/', 77, ''),
(78, 'KTA', 'Đại học Kiến trúc Hà Nội', 'img/dhkthnlogo.jpg', 'http://www.hau.edu.vn/', 'http://www.hau.edu.vn/thong-tin-tuyen-sinh-dai-hoc_c08/', 78, ''),
(79, '', 'Trung tâm Nghiên cứu và Đào tạo Thiết kế Vi mạch', 'img/icdreclogo.jpg', 'http://icdrec.edu.vn/', '', 79, ''),
(80, 'TMA', 'Đại học Thương mại', 'img/dhtmlogo.jpg', 'http://tmu.edu.vn/', 'https://tmu.edu.vn/vi/news/TUYEN-SINH/', 80, ''),
(81, 'THP', 'Đại học Hải Phòng', 'img/dhhplogo.jpg', 'http://dhhp.edu.vn/vi/trang-chu/', 'http://tuyensinh.dhhp.edu.vn/', 81, ''),
(82, '', 'Viện đào tạo Quốc tế về Khoa học Vật liệu Đại học Bách Khoa Hà Nội', 'img/itimslogo.jpg', 'http://www.itims.edu.vn/', '', 82, ''),
(83, 'DTL', 'Đại học Thăng Long', 'img/dhthanglonglogo.jpg', 'http://www.thanglong.edu.vn/', 'http://www.thanglong.edu.vn/tuyen-sinh/tuyen-sinh-dai-hoc-chinh-quy', 83, ''),
(84, 'YPB', 'Đại học Y Dược Hải Phòng', 'img/dhydhplogo.jpg', 'http://hpmu.edu.vn/hpmu/', 'http://hpmu.edu.vn/hpmu/news/THONG-TIN-TUYEN-SINH/', 84, ''),
(85, 'DQK', 'Đại học Kinh doanh và Công nghệ Hà Nội', 'img/dhkdvcnhnlogo.jpg', 'http://hubt.edu.vn/', 'http://hubt.edu.vn/tin-tuc-khoa-1/dai-hoc-chinh-quy/20', 85, ''),
(86, 'GTS', 'Đại học Giao thông Vận tải Thành phố Hồ Chí Minh', 'img/dhgtvttphcmlogo.jpg', 'https://ut.edu.vn/', 'http://tuyensinh.ut.edu.vn/chuyenmuc/thong-bao-tuyen-sinh/dai-hoc-cao-dang-chinh-quy/', 86, ''),
(87, 'DSG', 'Đại học Công nghệ Sài Gòn', 'img/dhcnsglogo.jpg', 'http://www.stu.edu.vn/', 'http://www.stu.edu.vn/vi/1/14112/thong-bao-tuyen-sinh-dai-hoc-chinh-quy-nam-2018.html', 87, ''),
(88, 'DBD', 'Đại học Bình Dương', 'img/dhbdlogo.jpg', 'http://www.bdu.edu.vn/', 'http://tuyensinh.bdu.edu.vn/', 88, ''),
(89, 'HQT', 'Học viện Ngoại giao Việt Nam', 'img/hvnglogo.jpg', 'http://www.dav.edu.vn/', 'https://www.dav.edu.vn/vi/tuyen-sinh', 89, ''),
(90, '', 'Học viện Kỹ thuật Lê Qúy Đôn', 'img/dhktlqdlogo.jpg', 'http://www.lqdtu.edu.vn/', '', 90, ''),
(91, 'DHL', 'Đại học Nông Lâm - Đại học Huế', 'img/dhnlhlogo.jpg', 'http://www.huaf.edu.vn/', 'http://tuyensinh.huaf.edu.vn/', 91, ''),
(92, 'BVU', 'Đại học Bà Rịa - Vũng Tàu', 'img/dhbrvtlogo.jpg', 'http://bvu.edu.vn/', 'http://bvu.edu.vn/tuyen-sinh1', 92, ''),
(93, 'DQB', 'Đại học Quảng Bình', 'img/dhqblogo.jpg', 'http://quangbinhuni.edu.vn/', 'http://quangbinhuni.edu.vn/Dai-Hoc-Quang-Binh/PortalNews/Tuyen_sinh/0/36/0', 94, ''),
(94, 'HIU', 'Đại học Quốc tế Hồng Bàng', 'img/dhqthblogo.jpg', 'http://hiu.vn/', 'http://admissions.hiu.vn/', 95, ''),
(95, 'DCD', 'Đại học Công nghệ Đồng Nai', 'img/dhcndnlogo.jpg', 'http://dntu.edu.vn/', 'http://ts.dntu.edu.vn/', 96, ''),
(96, 'TTN', 'Đại học Tây Nguyên', 'img/dhtaynguyenlogo.jpg', 'http://www.ttn.edu.vn/', 'https://www.ttn.edu.vn/index.php/tuyensinh/tuyensinhdhcd', 97, ''),
(97, '', 'Saigon Tech', 'img/saigontechlogo.jpg', 'http://www.saigontech.edu.vn/', 'http://www.saigontech.edu.vn/thong-tin-tuyen-sinh-va-nhap-hoc.html', 98, ''),
(98, 'DBG', 'Đại học Nông Lâm Bắc Giang', 'img/dhnlbglogo.jpg', 'http://bafu.edu.vn/home/', 'http://bafu.edu.vn/tuyensinh/', 99, ''),
(99, 'DBH', 'Đại học Quốc tế Bắc Hà', 'img/dhqtbhlogo.jpg', 'http://www.bhiu.edu.vn/', 'http://www.bhiu.edu.vn/danh-muc-tin/313_tuyen-sinh', 100, ''),
(100, 'MTS', 'Đại học Mỹ thuật Thành phố Hồ Chí Minh', 'img/dhmythuattphcmlogo.jpg', 'http://hcmufa.edu.vn/', 'http://hcmufa.edu.vn/tuyen-sinh', 101, ''),
(101, 'D50', 'Cao đẳng Cộng đồng Đồng Tháp', 'img/cdcddtlogo.jpg', 'http://www.dtcc.edu.vn/', 'http://www.dtcc.edu.vn/tuyen_sinh/ch%C3%ADnh-quy/th%C3%B4ng-tin-tuy%E1%BB%83n-sinh-2018.html', 102, ''),
(102, 'HCH', 'Học viện Hành chính Quốc gia', 'img/hvhcqglogo.jpg', 'http://www1.napa.vn/', 'http://www1.napa.vn/bandaotao/category/tuyen-sinh', 103, ''),
(103, 'GSA', 'Đại học Giao thông Vận tải cơ sở 2 phía Nam', 'img/dhgtvtcs2logo.jpg', 'http://utc2.edu.vn/', 'http://tuyensinh.utc2.edu.vn/', 107, ''),
(104, 'DLA', 'Đại học Kinh tế Công nghiệp Long An', 'img/dhktcnlalogo.jpg', 'http://daihoclongan.edu.vn/', 'https://daihoclongan.edu.vn/tin-tuc-su-kien/tin-tuyen-sinh/1349-thong-tin-tuyen-sinh-dai-hoc-chinh-quy-nam-2018.html', 108, ''),
(105, 'DCL', 'Đại học Cửu Long', 'img/dhcllogo.jpg', 'http://www.mku.edu.vn/', 'http://mku.edu.vn/tuyensinh/', 109, ''),
(106, 'NVH', 'Học viện Âm nhạc Quốc gia Việt Nam', 'img/hvanqgvnlogo.jpg', 'http://www.vnam.edu.vn/', 'http://www.vnam.edu.vn/Categories.aspx?lang=&CatID=9', 110, ''),
(107, 'NVS', 'Nhạc viện Thành phố Hồ Chí Minh', 'img/nvtphcmlogo.jpg', 'http://www.hcmcons.vn/', 'http://www.hcmcons.vn/dao-tao/trung-cap-dai-hoc/thong-bao/tuyen-sinh', 111, ''),
(108, '', 'Cao đẳng Kinh tế Tài chính Vĩnh Long', 'img/cdkttcvllogo.jpg', 'http://www.vcef.edu.vn/', 'http://www.vcef.edu.vn/', 112, ''),
(109, 'DQT', 'Đại học Quang Trung', 'img/dhqtlogo.jpg', 'http://www.quangtrung.edu.vn/page/dhqt.php', 'http://www.quangtrung.edu.vn/page/dhqt.php', 114, ''),
(110, 'MTC', 'Đại học Mỹ thuật Công nghiệp Hà Nội', 'img/dhmtcnhnlogo.jpg', 'http://mythuatcongnghiep.edu.vn/', 'http://mythuatcongnghiep.edu.vn/tin-tuc/tuyen-sinh.html', 115, ''),
(111, 'QSB', 'Đại học Bách Khoa Tp. Hồ Chí Minh', 'img/dhbktphcmlogo.jpg', 'http://www.bku.edu.vn/', 'https://kenhtuyensinh.vn/dai-hoc-bach-khoa-tphcm', 116, ''),
(112, 'DVX', 'Đại học Công nghệ Vạn Xuân', 'img/dhcnvxlogo.jpg', 'https://www.vxut.edu.vn/', 'https://www.vxut.edu.vn/home/v1/category/79/', 123, ''),
(113, '', 'Cao đẳng Sư phạm Ninh Thuận', 'img/cdspntlogo.jpg', 'http://www.cdspninhthuan.edu.vn/', 'http://www.cdspninhthuan.edu.vn/', 124, ''),
(114, 'DPD', 'Đại học Dân lập Phương Đông', 'img/dhpdlogo.jpg', 'http://phuongdong.edu.vn/', 'http://phuongdong.edu.vn/tuyensinh.html', 125, ''),
(115, 'DPX', 'Đại học Dân lập Phú Xuân', 'img/dhdlpxlogo.jpg', 'http://www.phuxuanuni.edu.vn/', 'https://drive.google.com/file/d/1pfy_AMtAeODAm2QclQZFLpARmI86yMK-/view', 126, ''),
(116, '0218', 'Trung cấp Phương Nam', 'img/tcpnlogo.jpg', 'http://www.phuongnam-et.edu.vn/index.php?lang=vi', 'http://tuyensinh.phuongnam-et.edu.vn/', 127, ''),
(117, 'HKC', 'Học viện Khoa học và Công nghệ', 'img/hvkhvcnlogo.jpg', 'http://gust.edu.vn/vn', 'http://gust.edu.vn/vn', 128, ''),
(118, 'D54', 'Cao đẳng Kiên Giang', 'img/cdkglogo.jpg', 'http://www.kgtec.edu.vn/', 'http://www.kgc.edu.vn/tuyen-sinh.html', 129, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trong_so`
--

CREATE TABLE `trong_so` (
  `ID` int(2) NOT NULL,
  `Trong_So_Bien_Ngon_Ngu` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `trong_so`
--

INSERT INTO `trong_so` (`ID`, `Trong_So_Bien_Ngon_Ngu`) VALUES
(1, 'khong_anh_huong'),
(2, 'anh_huong_it'),
(3, 'anh_huong_kha_lon'),
(4, 'anh_huong_rat_lon');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tuyen_sinh`
--

CREATE TABLE `tuyen_sinh` (
  `Tuyen_Sinh_ID` int(11) NOT NULL,
  `Ma_To_Chuc_Dao_Tao` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Ten_Nganh` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Ma_Khoi_Thi` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `So_Chi_Tieu` int(11) NOT NULL,
  `Ma_Nganh_TCDT` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Diem_Nguong` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tuyen_sinh`
--

INSERT INTO `tuyen_sinh` (`Tuyen_Sinh_ID`, `Ma_To_Chuc_Dao_Tao`, `Ten_Nganh`, `Ma_Khoi_Thi`, `So_Chi_Tieu`, `Ma_Nganh_TCDT`, `Diem_Nguong`) VALUES
(1, 'BKA', 'Kỹ thuật cơ điện tử', 'A00', 160, 'ME1', 27),
(2, 'BKA', 'Kỹ thuật cơ điện tử', 'A01', 160, 'ME1', 27),
(3, 'BKA', 'Kỹ thuật Cơ khí', 'A00', 250, 'ME2', 25.75),
(4, 'BKA', 'Kỹ thuật Cơ khí', 'A01', 250, 'ME2', 25.75),
(5, 'BKA', 'Chương trình tiên tiến Cơ điện tử', 'A00', 40, 'ME-E1', 25.5),
(6, 'BKA', 'Chương trình tiên tiến Cơ điện tử', 'A01', 40, 'ME-E1', 25.5),
(7, 'BKA', 'Kỹ thuật Ô tô', 'A00', 110, 'TE1', 25.75),
(8, 'BKA', 'Kỹ thuật Ô tô', 'A01', 110, 'TE1', 25.75),
(9, 'BKA', 'Kỹ thuật Cơ khi Động lực', 'A00', 25, 'TE2', 25.75),
(10, 'BKA', 'Kỹ thuật Cơ khi Động lực', 'A01', 25, 'TE2', 25.75),
(11, 'BKA', 'Kỹ thuật Hàng không', 'A00', 20, 'TE3', 25.75),
(12, 'BKA', 'Kỹ thuật Hàng không', 'A01', 20, 'TE3', 25.75),
(13, 'BKA', 'Kỹ thuật Tàu thủy', 'A00', 20, 'TE4', 25.75),
(14, 'BKA', 'Kỹ thuật Tàu thủy', 'A01', 20, 'TE4', 25.75),
(15, 'BKA', 'Chương trình tiên tiến Kỹ thuật Ô tô', 'A00', 15, 'TE-E2', 0),
(16, 'BKA', 'Chương trình tiên tiến Kỹ thuật Ô tô', 'A01', 15, 'TE-E2', 0),
(17, 'BKA', 'Kỹ thuật Nhiệt', 'A00', 125, 'HE1', 24.75),
(18, 'BKA', 'Kỹ thuật Nhiệt', 'A01', 125, 'HE1', 24.75),
(19, 'BKA', 'Kỹ thuật Vật liệu', 'A00', 110, 'MS1', 23.75),
(20, 'BKA', 'Kỹ thuật Vật liệu', 'A01', 110, 'MS1', 23.75),
(21, 'BKA', 'Chương trình Tiên tiến Khoa học Kỹ thuật Vật liệu', 'A00', 15, 'MS-E3', 23.37),
(22, 'BKA', 'Chương trình Tiên tiến Khoa học Kỹ thuật Vật liệu', 'A01', 15, 'MS-E3', 23.37),
(23, 'BKA', 'Kỹ thuật Điện tử Viễn thông', 'A00', 270, 'ET1', 26.25),
(24, 'BKA', 'Kỹ thuật Điện tử Viễn thông', 'A01', 270, 'ET1', 26.25),
(25, 'BKA', 'Chương trình Tiên tiến Điện tử Viễn thông', 'A00', 20, 'ET-E4', 25.5),
(26, 'BKA', 'Chương trình Tiên tiến Điện tử Viễn thông', 'A01', 20, 'ET-E4', 25.5),
(27, 'BKA', 'Chương trình Tiên tiến Kỹ thuật Y sinh', 'A00', 20, 'ET-E5', 25.25),
(28, 'BKA', 'Chương trình Tiên tiến Kỹ thuật Y sinh', 'A01', 20, 'ET-E5', 25.25),
(29, 'BKA', 'Khoa học Máy tính', 'A00', 100, 'IT1', 28.25),
(30, 'BKA', 'Khoa học Máy tính', 'A01', 100, 'IT1', 28.25),
(31, 'BKA', 'Kỹ thuật Máy tính', 'A00', 80, 'IT2', 28.25),
(32, 'BKA', 'Kỹ thuật Máy tính', 'A01', 80, 'IT2', 28.25),
(33, 'BKA', 'Công nghệ Thông tin', 'A00', 800, 'IT3', 28.25),
(34, 'BKA', 'Công nghệ Thông tin', 'A01', 800, 'IT3', 28.25),
(35, 'BKA', 'Công nghệ Thông tin Việt -Nhật', 'A00', 100, 'IT-E6', 26.75),
(36, 'BKA', 'Công nghệ Thông tin Việt -Nhật', 'A01', 100, 'IT-E6', 26.75),
(37, 'BKA', 'Công nghệ Thồng tin ICT', 'A00', 40, 'IT-E7', 26.75),
(38, 'BKA', 'Công nghệ Thồng tin ICT', 'A01', 40, 'IT-E7', 26.75),
(39, 'BKA', 'Toán Tin', 'A00', 50, 'MI1', 25.75),
(40, 'BKA', 'Toán Tin', 'A01', 50, 'MI1', 25.75),
(41, 'BKA', 'Hệ thống Thông tin Quản lý', 'A00', 30, 'MI2', 25.75),
(42, 'BKA', 'Hệ thống Thông tin Quản lý', 'A01', 30, 'MI2', 25.75),
(43, 'BKA', 'Kỹ thuật Điện', 'A00', 110, 'EE1', 27.25),
(44, 'BKA', 'Kỹ thuật Điện', 'A01', 110, 'EE1', 27.25),
(45, 'BKA', 'Kỹ thuật Điều khiển - Tự động hóa', 'A00', 250, 'EE2', 27.25),
(46, 'BKA', 'Kỹ thuật Điều khiển - Tự động hóa', 'A01', 250, 'EE2', 27.25),
(47, 'BKA', 'Chương trình Tiên tiến Điều khiển Tự động hóa và Hệ thống điện', 'A00', 40, 'EE-E8', 26.25),
(48, 'BKA', 'Chương trình Tiên tiến Điều khiển Tự động hóa và Hệ thống điện', 'A01', 40, 'EE-E8', 26.25),
(49, 'BKA', 'Kỹ thuật Hóa học', 'A00', 160, 'CH1', 25),
(50, 'BKA', 'Kỹ thuật Hóa học', 'B00', 160, 'CH1', 25),
(51, 'BKA', 'Kỹ thuật Hóa học', 'D07', 160, 'CH1', 25),
(52, 'BKA', 'Hóa học', 'A00', 27, 'CH2', 25),
(53, 'BKA', 'Hóa học', 'B00', 26, 'CH2', 25),
(54, 'BKA', 'Hóa học', 'D07', 26, 'CH2', 25),
(55, 'BKA', 'Kỹ thuật in', 'A00', 14, 'CH3', 21.25),
(56, 'BKA', 'Kỹ thuật in', 'B00', 13, 'CH3', 21.25),
(57, 'BKA', 'Kỹ thuật in', 'D07', 13, 'CH3', 21.25),
(58, 'BKA', 'Kỹ thuật Sinh học', 'A00', 27, 'BF1', 25),
(59, 'BKA', 'Kỹ thuật Sinh học', 'B00', 27, 'BF1', 25),
(60, 'BKA', 'Kỹ thuật Sinh học', 'D07', 26, 'BF1', 25),
(61, 'BKA', 'Kỹ thuật Thực phẩm', 'A00', 67, 'BF2', 25),
(62, 'BKA', 'Kỹ thuật Thực phẩm', 'B00', 67, 'BF2', 25),
(63, 'BKA', 'Kỹ thuật Thực phẩm', 'D07', 66, 'BF2', 25),
(64, 'BKA', 'Kỹ thuật Môi trường', 'A00', 40, 'EV1', 25),
(65, 'BKA', 'Kỹ thuật Môi trường', 'B00', 40, 'EV1', 25),
(66, 'BKA', 'Kỹ thuật Môi trường', 'D07', 40, 'EV1', 25),
(67, 'BKA', 'Kỹ thuật Dệt', 'A00', 55, 'TX1', 24.5),
(68, 'BKA', 'Kỹ thuật Dệt', 'A01', 55, 'TX1', 24.5),
(69, 'BKA', 'Công nghệ May', 'A00', 45, 'TX2', 24.5),
(70, 'BKA', 'Công nghệ May', 'A01', 45, 'TX2', 24.5),
(71, 'BKA', 'Sư phạm Kỹ thuật Công nghiệp', 'A00', 20, 'ED1', 22.5),
(72, 'BKA', 'Sư phạm Kỹ thuật Công nghiệp', 'A01', 20, 'ED1', 22.5),
(73, 'BKA', 'Vật lý Kỹ thuật', 'A00', 75, 'PH1', 23.25),
(74, 'BKA', 'Vật lý Kỹ thuật', 'A01', 75, 'PH1', 23.25),
(75, 'BKA', 'Kỹ thuật Hạt nhân', 'A00', 15, 'NE1', 23.25),
(76, 'BKA', 'Kỹ thuật Hạt nhân', 'A01', 15, 'NE1', 23.25),
(77, 'BKA', 'Kinh tế Công nghiệp', 'A00', 17, 'EM1', 23),
(78, 'BKA', 'Kinh tế Công nghiệp', 'A01', 17, 'EM1', 23),
(79, 'BKA', 'Kinh tế Công nghiệp', 'D01', 16, 'EM1', 23),
(80, 'BKA', 'Quản lý Công nghiệp', 'A00', 30, 'EM2', 23),
(81, 'BKA', 'Quản lý Công nghiệp', 'A01', 30, 'EM2', 23),
(82, 'BKA', 'Quản lý Công nghiệp', 'D01', 30, 'EM2', 23),
(83, 'BKA', 'Quản trị kinh doanh', 'A00', 27, 'EM3', 24.25),
(84, 'BKA', 'Quản trị kinh doanh', 'A01', 27, 'EM3', 24.25),
(85, 'BKA', 'Quản trị kinh doanh', 'D01', 26, 'EM3', 24.25),
(86, 'BKA', 'Kế toán', 'A00', 20, 'EM4', 23.75),
(87, 'BKA', 'Kế toán', 'A01', 20, 'EM4', 23.75),
(88, 'BKA', 'Kế toán', 'D01', 20, 'EM4', 23.75),
(89, 'BKA', 'Tài chính Ngân hàng', 'A00', 14, 'EM5', 23.75),
(90, 'BKA', 'Tài chính Ngân hàng', 'A01', 13, 'EM5', 23.75),
(91, 'BKA', 'Tài chính Ngân hàng', 'D01', 13, 'EM5', 23.75),
(92, 'BKA', 'Tiếng Anh Khoa học Kỹ thuật và Công nghệ', 'D01', 140, 'FL1', 24.5),
(93, 'BKA', 'Tiếng Anh chuyên nghiệp Quốc tế', 'D01', 60, 'FL2', 24.5),
(94, 'BKA', 'Cơ điện tử', 'A00', 34, 'ME-NUT', 23.25),
(95, 'BKA', 'Cơ điện tử', 'A01', 33, 'ME-NUT', 23.25),
(96, 'BKA', 'Cơ điện tử', 'D07', 33, 'ME-NUT', 23.25),
(97, 'BKA', 'Cơ khí Chế tạo máy', 'A00', 10, 'ME-GU', 0),
(98, 'BKA', 'Cơ khí Chế tạo máy', 'A01', 10, 'ME-GU', 0),
(99, 'BKA', 'Cơ khí Chế tạo máy', 'D07', 10, 'ME-GU', 0),
(100, 'BKA', 'Điện tử Viễn thông', 'A00', 14, 'ET-LUH', 22),
(101, 'BKA', 'Điện tử Viễn thông', 'A01', 13, 'ET-LUH', 22),
(102, 'BKA', 'Điện tử Viễn thông', 'D07', 13, 'ET-LUH', 22),
(103, 'BKA', 'Công nghệ thông tin', 'A00', 24, 'IT-LTU', 23.5),
(104, 'BKA', 'Công nghệ thông tin', 'A01', 23, 'IT-LTU', 23.5),
(105, 'BKA', 'Công nghệ thông tin', 'D07', 23, 'IT-LTU', 23.5),
(106, 'BKA', 'Công nghệ thông tin', 'A00', 20, 'IT-VUW', 22),
(107, 'BKA', 'Công nghệ thông tin', 'A01', 20, 'IT-VUW', 22),
(108, 'BKA', 'Công nghệ thông tin', 'D07', 20, 'IT-VUW', 22),
(109, 'BKA', 'Hệ thống thông tin', 'A00', 10, 'IT-GINP', 20),
(110, 'BKA', 'Hệ thống thông tin', 'A01', 10, 'IT-GINP', 20),
(111, 'BKA', 'Hệ thống thông tin', 'D07', 10, 'IT-GINP', 20),
(112, 'BKA', 'Hệ thống thông tin', 'D29', 10, 'IT-GINP', 20),
(113, 'BKA', 'Quản trị kinh doanh', 'A00', 13, 'EM-VUW', 21.25),
(114, 'BKA', 'Quản trị kinh doanh', 'D07', 13, 'EM-VUW', 21.25),
(115, 'BKA', 'Quản trị kinh doanh', 'A01', 12, 'EM-VUW', 21.25),
(116, 'BKA', 'Quản trị kinh doanh', 'D01', 12, 'EM-VUW', 21.25),
(117, 'BKA', 'Quản lý công nghiệp Logistics và quản lý chuỗi cung ứng', 'A00', 10, 'EM-NU', 20),
(118, 'BKA', 'Quản lý công nghiệp Logistics và quản lý chuỗi cung ứng', 'D07', 10, 'EM-NU', 20),
(119, 'BKA', 'Quản lý công nghiệp Logistics và quản lý chuỗi cung ứng', 'A01', 10, 'EM-NU', 20),
(120, 'BKA', 'Quản lý công nghiệp Logistics và quản lý chuỗi cung ứng', 'D01', 10, 'EM-NU', 20),
(121, 'BKA', 'Quản trị kinh doanh', 'A00', 10, 'TROY-BA', 21),
(122, 'BKA', 'Quản trị kinh doanh', 'D07', 10, 'TROY-BA', 21),
(123, 'BKA', 'Quản trị kinh doanh', 'A01', 10, 'TROY-BA', 21),
(124, 'BKA', 'Quản trị kinh doanh', 'D01', 10, 'TROY-BA', 21),
(125, 'BKA', 'Khoa học máy tính', 'A00', 10, 'TROY-IT', 21.25),
(126, 'BKA', 'Khoa học máy tính', 'D07', 10, 'TROY-IT', 21.25),
(127, 'BKA', 'Khoa học máy tính', 'A01', 10, 'TROY-IT', 21.25),
(128, 'BKA', 'Khoa học máy tính', 'D01', 10, 'TROY-IT', 21.25),
(135, 'SPH', 'Sư phạm Toán học', 'A00', 120, '7140209A', 26),
(136, 'SPH', 'Sư phạm Toán học (dạy Toán bằng tiếng Anh)', 'A00', 10, '7140209B', 26),
(137, 'SPH', 'Sư phạm Toán học (dạy Toán bằng tiếng Anh)', 'A01', 9, '7140209C', 27.75),
(138, 'SPH', 'Sư phạm Toán học (dạy Toán bằng tiếng Anh)', 'D01', 6, '7140209D', 27),
(139, 'SPH', 'Sư phạm Tin học', 'A00', 30, '7140210A', 19),
(140, 'SPH', 'Sư phạm Tin học', 'A01', 5, '7140210B', 17.75),
(141, 'SPH', 'Sư phạm Tin học(dạy Tin bằng tiếng Anh)', 'A00', 13, '7140210C', 23.5),
(142, 'SPH', 'Sư phạm Tin học(dạy Tin bằng tiếng Anh)', 'A01', 12, '7140210D', 20),
(143, 'SPH', 'Sư phạm Vật lí', 'A00', 55, '7140211A', 23),
(144, 'SPH', 'Sư phạm Vật lí', 'A01', 15, '7140211B', 22.75),
(145, 'SPH', 'Sư phạm Vật lí', 'C01', 10, '7140211C', 22.75),
(146, 'SPH', 'Sư phạm Vật Lí (dạy Lý bằng tiếng Anh)', 'A00', 5, '7140211D', 22.5),
(147, 'SPH', 'Sư phạm Vật Lí (dạy Lý bằng tiếng Anh)', 'A01', 15, '7140211E', 22.75),
(148, 'SPH', 'Sư phạm Vật Lí (dạy Lý bằng tiếng Anh)', 'C01', 5, '7140211G', 19),
(149, 'SPH', 'Sư phạm Hóa học', 'A00', 80, '7140212A', 23.75),
(150, 'SPH', 'Sư phạm Hóa học (dạy Hóa bằng tiếng Anh)', 'D07', 25, '7140212B', 21),
(151, 'SPH', 'Sư phạm Sinh học', 'A00', 10, '7140213A', 19.5),
(152, 'SPH', 'Sư phạm Sinh học', 'B00', 45, '7140213B', 22),
(153, 'SPH', 'Sư phạm Sinh học', 'B03', 5, '7140213C', 0),
(154, 'SPH', 'Sư phạm Sinh học (dạy Sinh bằng tiếng Anh)', 'D01', 3, '7140213D', 0),
(155, 'SPH', 'Sư phạm Sinh học (dạy Sinh bằng tiếng Anh)', 'D08', 18, '7140213F', 19.5),
(156, 'SPH', 'Sư phạm Sinh học (dạy Sinh bằng tiếng Anh)', 'D07', 4, '7140213E', 18),
(157, 'SPH', 'Sư phạm Công nghệ', 'A00', 50, '7140246A', 0),
(158, 'SPH', 'Sư phạm Công nghệ', 'A01', 50, '7140246B', 0),
(159, 'SPH', 'Sư phạm Công nghệ', 'C01', 50, '7140246C', 0),
(160, 'SPH', 'Sư phạm Ngữ Văn', 'C00', 90, '7140217C', 27),
(161, 'SPH', 'Sư phạm Ngữ Văn', 'D01', 19, '7140217D', 23.5),
(162, 'SPH', 'Sư phạm Ngữ Văn', 'D02', 18, '7140217D', 23.5),
(163, 'SPH', 'Sư phạm Ngữ Văn', 'D03', 18, '7140217D', 23.5),
(164, 'SPH', 'Sư phạm Lịch sử', 'C00', 65, '7140218C', 25.5),
(165, 'SPH', 'Sư phạm Lịch sử', 'D14', 2, '7140218D', 22),
(166, 'SPH', 'Sư phạm Lịch sử', 'D62', 2, '7140218D', 22),
(167, 'SPH', 'Sư phạm Lịch sử', 'D64', 1, '7140218D', 22),
(168, 'SPH', 'Sư phạm Địa lý', 'A00', 15, '7140219A', 18),
(169, 'SPH', 'Sư phạm Địa lý', 'C04', 15, '7140219B', 22.5),
(170, 'SPH', 'Sư phạm Địa lý', 'C00', 50, '7140219C', 25.5),
(171, 'SPH', 'Sư phạm Giáo dục công dân', 'C14', 20, '7140204A', 23.5),
(172, 'SPH', 'Sư phạm Giáo dục công dân', 'D66', 9, '7140204B', 21.25),
(173, 'SPH', 'Sư phạm Giáo dục công dân', 'D68', 8, '7140204B', 21.25),
(174, 'SPH', 'Sư phạm Giáo dục công dân', 'D70', 8, '7140204B', 21.25),
(175, 'SPH', 'Sư phạm Giáo dục công dân', 'D01', 12, '7140204D', 17),
(176, 'SPH', 'Sư phạm Giáo dục công dân', 'D02', 12, '7140204D', 17),
(177, 'SPH', 'Sư phạm Giáo dục công dân', 'D03', 11, '7140204D', 17),
(178, 'SPH', 'Sư phạm Giáo dục Chính trị', 'C14', 15, '7140205A', 21),
(179, 'SPH', 'Sư phạm Giáo dục Chính trị', 'D66', 7, '7140205B', 18.75),
(180, 'SPH', 'Sư phạm Giáo dục Chính trị', 'D68', 7, '7140205B', 18.75),
(181, 'SPH', 'Sư phạm Giáo dục Chính trị', 'D70', 6, '7140205B', 18.75),
(182, 'SPH', 'Sư phạm Giáo dục Chính trị', 'D01', 7, '7140205D', 17.5),
(183, 'SPH', 'Sư phạm Giáo dục Chính trị', 'D02', 7, '7140205D', 17.5),
(184, 'SPH', 'Sư phạm Giáo dục Chính trị', 'D03', 6, '7140205D', 17.5),
(185, 'SPH', 'Sư phạm tiếng Anh', 'D01', 60, '7140231', 25.75),
(186, 'SPH', 'Sư phạm tiếng Pháp', 'D01', 9, '7140233D', 19.5),
(187, 'SPH', 'Sư phạm tiếng Pháp', 'D02', 9, '7140233D', 19.5),
(188, 'SPH', 'Sư phạm tiếng Pháp', 'D03', 8, '7140233D', 19.5),
(189, 'SPH', 'Sư phạm tiếng Pháp', 'D15', 2, '7140233C', 21.5),
(190, 'SPH', 'Sư phạm tiếng Pháp', 'D42', 1, '7140233C', 21.5),
(191, 'SPH', 'Sư phạm tiếng Pháp', 'D44', 1, '7140233C', 21.5),
(192, 'SPH', 'Sư phạm Âm nhạc', 'N02', 25, '7140222', 17.5),
(193, 'SPH', 'Sư phạm Mỹ thuật', 'H07', 25, '7140222', 19),
(194, 'SPH', 'Giáo dục thể chất', '', 25, '7140206', 16),
(195, 'SPH', 'Giáo dục mầm non', 'M00', 40, '7140201A', 22.25),
(196, 'SPH', 'Giáo dục mầm non sư phạm tiếng Anh', 'M01', 15, '7140201B', 20.5),
(197, 'SPH', 'Giáo dục mầm non sư phạm tiếng Anh', 'M02', 15, '7140201B', 22),
(198, 'SPH', 'Giáo dục Tiểu học', 'D01', 12, '7140202A', 25.25),
(199, 'SPH', 'Giáo dục Tiểu học', 'D02', 12, '7140202A', 25.25),
(200, 'SPH', 'Giáo dục Tiểu học', 'D03', 12, '7140202A', 25.25),
(201, 'SPH', 'Giáo dục Tiểu học', 'D11', 2, '7140202B', 20.5),
(202, 'SPH', 'Giáo dục Tiểu học', 'D52', 2, '7140202B', 20.5),
(203, 'SPH', 'Giáo dục Tiểu học', 'D54', 1, '7140202B', 20.5),
(204, 'SPH', 'Giáo dục Tiểu học Sư phạm Tiếng Anh', 'D01', 25, '7140202D', 24.75),
(205, 'SPH', 'Giáo dục Tiểu học Sư phạm Tiếng Anh', 'D11', 5, '7140202C', 20.5),
(206, 'SPH', 'Giáo dục đặc biệt', 'B03', 10, '714203B', 19.25),
(207, 'SPH', 'Giáo dục đặc biệt', 'C00', 17, '714203C', 26.755),
(208, 'SPH', 'Giáo dục đặc biệt', 'D01', 3, '714203D', 23),
(209, 'SPH', 'Giáo dục đặc biệt', 'D02', 3, '714203D', 23),
(210, 'SPH', 'Giáo dục đặc biệt', 'D03', 2, '714203D', 23),
(211, 'SPH', 'Quản lý giáo dục', 'A00', 10, '7140114A', 20.25),
(212, 'SPH', 'Quản lý giáo dục', 'C00', 15, '7140114C', 23.75),
(213, 'SPH', 'Quản lý giáo dục', 'D01', 4, '7140114D', 20.5),
(214, 'SPH', 'Quản lý giáo dục', 'D02', 3, '7140114D', 20.5),
(215, 'SPH', 'Quản lý giáo dục', 'D03', 3, '7140114D', 20.5),
(216, 'SPH', 'Hóa học', 'A00', 100, '7440112', 23.75),
(217, 'SPH', 'Sinh học', 'A00', 15, '7420101A', 19),
(218, 'SPH', 'Sinh học', 'B00', 70, '7420101B', 19),
(219, 'SPH', 'Sinh học', 'C04', 15, '7420101C', 0),
(220, 'SPH', 'Toán học', 'A00', 50, '7460101B', 19.5),
(221, 'SPH', 'Toán học', 'A01', 20, '7460101C', 19.5),
(222, 'SPH', 'Toán học', 'D01', 30, '7460101D', 17.75),
(223, 'SPH', 'Công nghệ thông tin', 'A00', 90, '7480201A', 17.25),
(224, 'SPH', 'Công nghệ thông tin', 'A01', 90, '7480201B', 18),
(225, 'SPH', 'Việt Nam học', 'C04', 15, '7310630B', 18.5),
(226, 'SPH', 'Việt Nam học', 'C04', 45, '7310630C', 21.25),
(227, 'SPH', 'Việt Nam học', 'D01', 20, '7310630D', 17.25),
(228, 'SPH', 'Việt Nam học', 'D02', 20, '7310630D', 17.25),
(229, 'SPH', 'Việt Nam học', 'D03', 20, '7310630D', 17.25),
(230, 'SPH', 'Văn học', 'C00', 60, '7229030C', 24.25),
(231, 'SPH', 'Văn học', 'D01', 14, '7229030D', 20.25),
(232, 'SPH', 'Văn học', 'D02', 13, '7229030D', 20.25),
(233, 'SPH', 'Văn học', 'D03', 13, '7229030D', 20.25),
(234, 'SPH', 'Ngôn ngữ Anh', 'D01', 100, '7220201D', 23.25),
(235, 'SPH', 'Triết học', 'C03', 35, '7229001B', 20.5),
(236, 'SPH', 'Triết học', 'C00', 45, '7229001C', 19),
(237, 'SPH', 'Triết học', 'D01', 7, '7229001D', 18.5),
(238, 'SPH', 'Triết học', 'D02', 7, '7229001D', 18.5),
(239, 'SPH', 'Triết học', 'D03', 6, '7229001D', 18.5),
(240, 'SPH', 'Chính trị học', 'C14', 30, '7310201A', 17.25),
(241, 'SPH', 'Chính trị học', 'D84', 10, '7310201B', 21.75),
(242, 'SPH', 'Chính trị học', 'D86', 10, '7310201B', 21.75),
(243, 'SPH', 'Chính trị học', 'D87', 10, '7310201B', 21.75),
(244, 'SPH', 'Chính trị học', 'D01', 14, '7310201D', 18.25),
(245, 'SPH', 'Chính trị học', 'D02', 13, '7310201D', 18.25),
(246, 'SPH', 'Chính trị học', 'D03', 13, '7310201D', 18.25),
(247, 'SPH', 'Tâm lý học', 'C03', 20, '7310401A', 19.25),
(248, 'SPH', 'Tâm lý học', 'C00', 70, '7310401C', 21.75),
(249, 'SPH', 'Tâm lý học', 'D01', 10, '7310401D', 20.25),
(250, 'SPH', 'Tâm lý học', 'D02', 10, '7310401D', 20.25),
(251, 'SPH', 'Tâm lý học', 'D03', 10, '7310401D', 20.25),
(252, 'SPH', 'Tâm lý giáo dục', 'C03', 10, '7310403A', 17.5),
(253, 'SPH', 'Tâm lý giáo dục', 'C00', 20, '7310403C', 24.5),
(254, 'SPH', 'Tâm lý giáo dục', 'D01', 4, '7310403D', 22.75),
(255, 'SPH', 'Tâm lý giáo dục', 'D02', 4, '7310403D', 22.75),
(256, 'SPH', 'Tâm lý giáo dục', 'D03', 4, '7310403D', 22.75),
(257, 'SPH', 'Công tác xã hội', 'D14', 7, '7760101B', 17.25),
(258, 'SPH', 'Công tác xã hội', 'D62', 6, '7760101B', 17.25),
(259, 'SPH', 'Công tác xã hội', 'D64', 6, '7760101B', 17.25),
(260, 'SPH', 'Công tác xã hội', 'C00', 30, '7760101C', 19),
(261, 'SPH', 'Công tác xã hội', 'D01', 24, '7760101D', 17),
(262, 'SPH', 'Công tác xã hội', 'D02', 24, '7760101D', 17),
(263, 'SPH', 'Công tác xã hội', 'D03', 24, '7760101D', 17),
(264, 'TCT', 'Giáo dục tiểu học', 'A00', 9, '7140202', 22),
(265, 'TCT', 'Giáo dục tiểu học', 'D01', 9, '7140202', 22),
(266, 'TCT', 'Giáo dục tiểu học', 'C01', 9, '7140202', 22),
(267, 'TCT', 'Giáo dục tiểu học', 'D03', 8, '7140202', 22),
(268, 'TCT', 'Giáo dục Công dân', 'C00', 5, '7140204', 22.75),
(269, 'TCT', 'Giáo dục Công dân', 'D14', 5, '7140204', 22.75),
(270, 'TCT', 'Giáo dục Công dân', 'D15', 5, '7140204', 22.75),
(271, 'TCT', 'Giáo dục Công dân', 'C19', 5, '7140204', 22.75),
(272, 'TCT', 'Giáo dục Thể chất', 'T00', 10, '7140206', 17.75),
(273, 'TCT', 'Giáo dục Thể chất', 'T01', 10, '7140206', 17.75),
(274, 'TCT', 'Sư phạm Toán học', 'A00', 5, '7140209', 23.5),
(275, 'TCT', 'Sư phạm Toán học', 'A01', 5, '7140209', 23.5),
(276, 'TCT', 'Sư phạm Toán học', 'D07', 5, '7140209', 23.5),
(277, 'TCT', 'Sư phạm Toán học', 'D08', 5, '7140209', 23.5),
(278, 'TCT', 'Sư phạm Tin học', 'A00', 7, '7140210', 16.5),
(279, 'TCT', 'Sư phạm Tin học', 'A01', 6, '7140210', 16.5),
(280, 'TCT', 'Sư phạm Tin học', 'A02', 6, '7140210', 16.5),
(281, 'TCT', 'Sư phạm Tin học', 'D29', 6, '7140210', 16.5),
(282, 'TCT', 'Sư phạm Vật lí', 'A00', 5, '7140211', 21.75),
(283, 'TCT', 'Sư phạm Vật lí', 'A01', 5, '7140211', 21.75),
(284, 'TCT', 'Sư phạm Vật lí', 'A02', 5, '7140211', 21.75),
(285, 'TCT', 'Sư phạm Vật lí', 'D29', 5, '7140211', 21.75),
(286, 'TCT', 'Sư phạm Hóa học', 'A00', 5, '7140212', 23.25),
(287, 'TCT', 'Sư phạm Hóa học', 'B00', 5, '7140212', 23.25),
(288, 'TCT', 'Sư phạm Hóa học', 'D07', 5, '7140212', 23.25),
(289, 'TCT', 'Sư phạm Hóa học', 'D24', 5, '7140212', 23.25),
(290, 'TCT', 'Sư phạm Sinh học', 'B00', 10, '7140213', 21),
(291, 'TCT', 'Sư phạm Sinh học', 'D08', 10, '7140213', 21),
(292, 'TCT', 'Sư phạm Ngữ văn', 'C00', 7, '7140217', 25),
(293, 'TCT', 'Sư phạm Ngữ văn', 'D14', 7, '7140217', 25),
(294, 'TCT', 'Sư phạm Ngữ văn', 'D15', 6, '7140217', 25),
(295, 'TCT', 'Sư phạm Lịch sử', 'C00', 7, '7140218', 23.75),
(296, 'TCT', 'Sư phạm Lịch sử', 'D14', 7, '7140218', 23.75),
(297, 'TCT', 'Sư phạm Lịch sử', 'D64', 7, '7140218', 23.75),
(298, 'TCT', 'Sư phạm Địa lý', 'C00', 5, '7140219', 24),
(299, 'TCT', 'Sư phạm Địa lý', 'C04', 5, '7140219', 24),
(300, 'TCT', 'Sư phạm Địa lý', 'D15', 5, '7140219', 24),
(301, 'TCT', 'Sư phạm Địa lý', 'D44', 5, '7140219', 24),
(302, 'TCT', 'Sư phạm tiếng Anh', 'D01', 7, '7140231', 24.5),
(303, 'TCT', 'Sư phạm tiếng Anh', 'D14', 7, '7140231', 24.5),
(304, 'TCT', 'Sư phạm tiếng Anh', 'D15', 6, '7140231', 24.5),
(305, 'TCT', 'Sư phạm tiếng Pháp', 'D03', 5, '7140233', 16.25),
(306, 'TCT', 'Sư phạm tiếng Pháp', 'D01', 5, '7140233', 16.25),
(307, 'TCT', 'Sư phạm tiếng Pháp', 'D14', 5, '7140233', 16.25),
(308, 'TCT', 'Sư phạm tiếng Pháp', 'D64', 5, '7140233', 16.25),
(309, 'TCT', 'Việt Nam học', 'C00', 33, '7310630', 24.5),
(310, 'TCT', 'Việt Nam học', 'D01', 33, '7310630', 24.5),
(311, 'TCT', 'Việt Nam học', 'D14', 32, '7310630', 24.5),
(312, 'TCT', 'Việt Nam học', 'D15', 32, '7310630', 24.5),
(313, 'TCT', 'Văn học', 'C00', 37, '7229030', 22.75),
(314, 'TCT', 'Văn học', 'D14', 37, '7229030', 22.75),
(315, 'TCT', 'Văn học', 'D15', 36, '7229030', 22.75),
(316, 'TCT', 'Ngôn ngữ Anh', 'D01', 60, '7220201', 23.5),
(317, 'TCT', 'Ngôn ngữ Anh', 'D14', 60, '7220201', 23.5),
(318, 'TCT', 'Ngôn ngữ Anh', 'D15', 60, '7220201', 23.5),
(319, 'TCT', 'Ngôn ngữ Pháp', 'D03', 15, '7220203', 18),
(320, 'TCT', 'Ngôn ngữ Pháp', 'D01', 15, '7220203', 18),
(321, 'TCT', 'Ngôn ngữ Pháp', 'D14', 15, '7220203', 18),
(322, 'TCT', 'Ngôn ngữ Pháp', 'D64', 15, '7220203', 18),
(323, 'TCT', 'Triết học', 'C00', 20, '7229001', 21.5),
(324, 'TCT', 'Triết học', 'D14', 20, '7229001', 21.5),
(325, 'TCT', 'Triết học', 'D15', 20, '7229001', 21.5),
(326, 'TCT', 'Triết học', 'C19', 20, '7229001', 21.5),
(327, 'TCT', 'Chính trị học', 'C00', 20, '7310201', 23.5),
(328, 'TCT', 'Chính trị học', 'D14', 20, '7310201', 23.5),
(329, 'TCT', 'Chính trị học', 'D15', 20, '7310201', 23.5),
(330, 'TCT', 'Chính trị học', 'C19', 20, '7310201', 23.5),
(331, 'TCT', 'Xã hội học', 'A01', 20, '7310301', 22.75),
(332, 'TCT', 'Xã hội học', 'C00', 20, '7310301', 22.75),
(333, 'TCT', 'Xã hội học', 'D01', 20, '7310301', 22.75),
(334, 'TCT', 'Xã hội học', 'C19', 20, '7310301', 22.75),
(335, 'TCT', 'Thông tin thư viện', 'A01', 15, '7320201', 17.75),
(336, 'TCT', 'Thông tin thư viện', 'D01', 15, '7320201', 17.75),
(337, 'TCT', 'Thông tin thư viện', 'D29', 15, '7320201', 17.75),
(338, 'TCT', 'Thông tin thư viện', 'D03', 15, '7320201', 17.75),
(339, 'TCT', 'Quản trị kinh doanh', 'A00', 30, '7340101', 22.5),
(340, 'TCT', 'Quản trị kinh doanh', 'A01', 30, '7340101', 22.5),
(341, 'TCT', 'Quản trị kinh doanh', 'D01', 30, '7340101', 22.5),
(342, 'TCT', 'Quản trị kinh doanh', 'C02', 30, '7340101', 22.5),
(343, 'TCT', 'Kinh tế', 'A00', 30, '7310101', 21.25),
(344, 'TCT', 'Kinh tế', 'A01', 30, '7310101', 21.25),
(345, 'TCT', 'Kinh tế', 'D01', 30, '7310101', 21.25),
(346, 'TCT', 'Kinh tế', 'C02', 30, '7310101', 21.25),
(347, 'TCT', 'Quản trị dịch vụ du lịch và lữ hành', 'A00', 28, '7810103', 22.5),
(348, 'TCT', 'Quản trị dịch vụ du lịch và lữ hành', 'A01', 28, '7810103', 22.5),
(349, 'TCT', 'Quản trị dịch vụ du lịch và lữ hành', 'D01', 27, '7810103', 22.5),
(350, 'TCT', 'Quản trị dịch vụ du lịch và lữ hành', 'C02', 27, '7810103', 22.5),
(351, 'TCT', 'Marketing', 'A00', 20, '7340115', 22.25),
(352, 'TCT', 'Marketing', 'A01', 20, '7340115', 22.25),
(353, 'TCT', 'Marketing', 'D01', 20, '7340115', 22.25),
(354, 'TCT', 'Marketing', 'C02', 20, '7340115', 22.25),
(355, 'TCT', 'Kinh doanh quốc tế', 'A00', 33, '7340120', 22.25),
(356, 'TCT', 'Kinh doanh quốc tế', 'A01', 33, '7340120', 22.25),
(357, 'TCT', 'Kinh doanh quốc tế', 'D01', 32, '7340120', 22.25),
(358, 'TCT', 'Kinh doanh quốc tế', 'C02', 32, '7340120', 22.25),
(359, 'TCT', 'Kinh doanh thương mại', 'A00', 28, '7340121', 21.25),
(360, 'TCT', 'Kinh doanh thương mại', 'A01', 28, '7340121', 21.25),
(361, 'TCT', 'Kinh doanh thương mại', 'D01', 27, '7340121', 21.25),
(362, 'TCT', 'Kinh doanh thương mại', 'C02', 27, '7340121', 21.25),
(363, 'TCT', 'Tài chính - ngân hàng', 'A00', 30, '7340201', 21.75),
(364, 'TCT', 'Tài chính - ngân hàng', 'A01', 30, '7340201', 21.75),
(365, 'TCT', 'Tài chính - ngân hàng', 'D01', 30, '7340201', 21.75),
(366, 'TCT', 'Tài chính - ngân hàng', 'C02', 30, '7340201', 21.75),
(367, 'TCT', 'Kế toán', 'A00', 30, '7340301', 22.75),
(368, 'TCT', 'Kế toán', 'A01', 30, '7340301', 22.75),
(369, 'TCT', 'Kế toán', 'D01', 30, '7340301', 22.75),
(370, 'TCT', 'Kế toán', 'C02', 30, '7340301', 22.75),
(371, 'TCT', 'Kiểm toán', 'A00', 25, '7340302', 21),
(372, 'TCT', 'Kiểm toán', 'A01', 25, '7340302', 21),
(373, 'TCT', 'Kiểm toán', 'D01', 25, '7340302', 21),
(374, 'TCT', 'Kiểm toán', 'C02', 25, '7340302', 21),
(375, 'TCT', 'Luật', 'A00', 70, '7380101', 25.25),
(376, 'TCT', 'Luật', 'C00', 70, '7380101', 25.25),
(377, 'TCT', 'Luật', 'D01', 70, '7380101', 25.25),
(378, 'TCT', 'Luật', 'D03', 70, '7380101', 25.25),
(379, 'TCT', 'Sinh học', 'B00', 55, '7420101', 17.5),
(380, 'TCT', 'Sinh học', 'D08', 55, '7420101', 17.5),
(381, 'TCT', 'Công nghệ sinh học', 'A00', 34, '7420201', 22.75),
(382, 'TCT', 'Công nghệ sinh học', 'B00', 33, '7420201', 22.75),
(383, 'TCT', 'Công nghệ sinh học', 'D07', 33, '7420201', 22.75),
(384, 'TCT', 'Công nghệ sinh học', 'D08', 33, '7420201', 22.75),
(385, 'TCT', 'Sinh học ứng dụng', 'A00', 15, '7420203', 18.75),
(386, 'TCT', 'Sinh học ứng dụng', 'B00', 15, '7420203', 18.75),
(387, 'TCT', 'Sinh học ứng dụng', 'A01', 15, '7420203', 18.75),
(388, 'TCT', 'Sinh học ứng dụng', 'D08', 15, '7420203', 18.75),
(389, 'TCT', 'Hóa học', 'A00', 20, '7440112', 19.75),
(390, 'TCT', 'Hóa học', 'B00', 20, '7440112', 19.75),
(391, 'TCT', 'Hóa học', 'D07', 20, '7440112', 19.75),
(392, 'TCT', 'Hóa dược', 'A00', 20, '7720203', 24),
(393, 'TCT', 'Hóa dược', 'B00', 20, '7720203', 24),
(394, 'TCT', 'Hóa dược', 'D07', 20, '7720203', 24),
(395, 'TCT', 'Khoa học môi trường', 'A00', 37, '7440301', 17),
(396, 'TCT', 'Khoa học môi trường', 'B00', 37, '7440301', 17),
(397, 'TCT', 'Khoa học môi trường', 'D07', 37, '7440301', 17),
(398, 'TCT', 'Khoa học đất', 'B00', 20, '7620103', 15.5),
(399, 'TCT', 'Khoa học đất', 'A00', 20, '7620103', 15.5),
(400, 'TCT', 'Khoa học đất', 'D07', 20, '7620103', 15.5),
(401, 'TCT', 'Khoa học đất', 'D08', 20, '7620103', 15.5),
(402, 'TCT', 'Toán ứng dụng', 'A00', 20, '7460112', 15.5),
(403, 'TCT', 'Toán ứng dụng', 'A01', 20, '7460112', 15.5),
(404, 'TCT', 'Toán ứng dụng', 'B00', 20, '7460112', 15.5),
(405, 'TCT', 'Khoa học máy tính', 'A00', 60, '7480101', 16.5),
(406, 'TCT', 'Khoa học máy tính', 'A01', 60, '7480101', 16.5),
(407, 'TCT', 'Mạng máy tính và truyền thông dữ liệu', 'A00', 60, '7480102', 18.25),
(408, 'TCT', 'Mạng máy tính và truyền thông dữ liệu', 'A01', 60, '7480102', 18.25),
(409, 'TCT', 'Kỹ thuật phần mềm', 'A00', 70, '7480103', 20.5),
(410, 'TCT', 'Kỹ thuật phần mềm', 'A01', 70, '7480103', 20.5),
(411, 'TCT', 'Hệ thống thông tin', 'A00', 50, '7480104', 16.5),
(412, 'TCT', 'Hệ thống thông tin', 'A01', 50, '7480104', 16.5),
(413, 'TCT', 'Công nghệ thông tin', 'A00', 120, '7480201', 20.25),
(414, 'TCT', 'Công nghệ thông tin', 'A01', 120, '7480201', 20.25),
(415, 'TCT', 'Công nghệ hóa học', 'A00', 30, '7510401', 21.25),
(416, 'TCT', 'Công nghệ hóa học', 'B00', 30, '7510401', 21.25),
(417, 'TCT', 'Công nghệ hóa học', 'A01', 30, '7510401', 21.25),
(418, 'TCT', 'Công nghệ hóa học', 'D07', 30, '7510401', 21.25),
(419, 'TCT', 'Kỹ thuật vật liệu', 'A00', 15, '7520309', 15.5),
(420, 'TCT', 'Kỹ thuật vật liệu', 'B00', 15, '7520309', 15.5),
(421, 'TCT', 'Kỹ thuật vật liệu', 'A01', 15, '7520309', 15.5),
(422, 'TCT', 'Kỹ thuật vật liệu', 'D07', 15, '7520309', 15.5),
(423, 'TCT', 'Quản lý công nghiệp', 'A00', 40, '7510601', 18.75),
(424, 'TCT', 'Quản lý công nghiệp', 'A01', 40, '7510601', 18.75),
(425, 'TCT', 'Quản lý công nghiệp', 'D01', 40, '7510601', 18.75),
(426, 'TCT', 'Kỹ thuật cơ khí', 'A00', 125, '7520103', 20.5),
(427, 'TCT', 'Kỹ thuật cơ khí', 'A01', 125, '7520103', 20.5),
(428, 'TCT', 'Kỹ thuật cơ điện tử', 'A00', 55, '7520114', 20.5),
(429, 'TCT', 'Kỹ thuật cơ điện tử', 'A01', 55, '7520114', 20.5),
(430, 'TCT', 'Kỹ thuật điện', 'A00', 50, '7520201', 20),
(431, 'TCT', 'Kỹ thuật điện', 'A01', 50, '7520201', 20),
(432, 'TCT', 'Kỹ thuật điện', 'D07', 50, '7520201', 20),
(433, 'TCT', 'Kỹ thuật điện tử - viễn thông', 'A00', 55, '7520207', 18.25),
(434, 'TCT', 'Kỹ thuật điện tử - viễn thông', 'A01', 55, '7520207', 18.25),
(435, 'TCT', 'Kỹ thuật máy tính', 'A00', 60, '7480106', 16.5),
(436, 'TCT', 'Kỹ thuật máy tính', 'A01', 60, '7480106', 16.5),
(437, 'TCT', 'Kỹ thuật điều khiển và tự động hóa', 'A00', 55, '7520216', 19),
(438, 'TCT', 'Kỹ thuật điều khiển và tự động hóa', 'A01', 55, '7520216', 19),
(439, 'TCT', 'Kỹ thuật môi trường', 'A00', 30, '7520320', 16.5),
(440, 'TCT', 'Kỹ thuật môi trường', 'B00', 30, '7520320', 16.5),
(441, 'TCT', 'Kỹ thuật môi trường', 'D07', 30, '7520320', 16.5),
(442, 'TCT', 'Kỹ thuật môi trường', 'A01', 30, '7520320', 16.5),
(443, 'TCT', 'Vật lí kỹ thuật', 'A00', 17, '7520401', 15.5),
(444, 'TCT', 'Vật lí kỹ thuật', 'A01', 17, '7520401', 15.5),
(445, 'TCT', 'Vật lí kỹ thuật', 'A02', 16, '7520401', 15.5),
(446, 'TCT', 'Công nghệ thực phẩm', 'A00', 40, '7540101', 21.75),
(447, 'TCT', 'Công nghệ thực phẩm', 'B00', 40, '7540101', 21.75),
(448, 'TCT', 'Công nghệ thực phẩm', 'D07', 40, '7540101', 21.75),
(449, 'TCT', 'Công nghệ thực phẩm', 'A01', 40, '7540101', 21.75),
(450, 'TCT', 'Công nghệ sau thu hoạch', 'A00', 18, '7540104', 18),
(451, 'TCT', 'Công nghệ sau thu hoạch', 'B00', 18, '7540104', 18),
(452, 'TCT', 'Công nghệ sau thu hoạch', 'D07', 16, '7540104', 18),
(453, 'TCT', 'Công nghệ sau thu hoạch', 'A01', 16, '7540104', 18),
(454, 'TCT', 'Công nghệ chế biến thủy sản', 'A00', 23, '7540105', 19),
(455, 'TCT', 'Công nghệ chế biến thủy sản', 'B00', 23, '7540105', 19),
(456, 'TCT', 'Công nghệ chế biến thủy sản', 'D07', 22, '7540105', 19),
(457, 'TCT', 'Công nghệ chế biến thủy sản', 'A01', 22, '7540105', 19),
(458, 'TCT', 'Kỹ thuật xây dựng', 'A00', 80, '7580201', 19.25),
(459, 'TCT', 'Kỹ thuật xây dựng', 'A01', 80, '7580201', 19.25),
(460, 'TCT', 'Kỹ thuật xây dựng công trình thủy lợi', 'A00', 30, '7580202', 15.5),
(461, 'TCT', 'Kỹ thuật xây dựng công trình thủy lợi', 'A01', 30, '7580202', 15.5),
(462, 'TCT', 'Kỹ thuật xây dựng công trình giao thông', 'A00', 30, '7580202', 18),
(463, 'TCT', 'Kỹ thuật xây dựng công trình giao thông', 'A01', 30, '7580202', 18),
(464, 'TCT', 'Kỹ thuật tài nguyên nước', 'A00', 20, '7580212', 15.5),
(465, 'TCT', 'Kỹ thuật tài nguyên nước', 'A01', 20, '7580212', 15.5),
(466, 'TCT', 'Kỹ thuật tài nguyên nước', 'D07', 20, '7580212', 15.5),
(467, 'TCT', 'Chăn nuôi', 'A00', 30, '7620105', 16.25),
(468, 'TCT', 'Chăn nuôi', 'B00', 30, '7620105', 16.25),
(469, 'TCT', 'Chăn nuôi', 'A02', 30, '7620105', 16.25),
(470, 'TCT', 'Chăn nuôi', 'D08', 30, '7620105', 16.25),
(471, 'TCT', 'Nông học', 'B00', 20, '7620109', 20.25),
(472, 'TCT', 'Nông học', 'D08', 20, '7620109', 20.25),
(473, 'TCT', 'Nông học', 'D07', 20, '7620109', 20.25),
(474, 'TCT', 'Khoa học cây trồng', 'B00', 38, '7620110', 17.25),
(475, 'TCT', 'Khoa học cây trồng', 'A02', 38, '7620110', 17.25),
(476, 'TCT', 'Khoa học cây trồng', 'D07', 36, '7620110', 17.25),
(477, 'TCT', 'Khoa học cây trồng', 'D08', 36, '7620110', 17.25),
(478, 'TCT', 'Bảo vệ thực vật', 'B00', 47, '7620112', 20.75),
(479, 'TCT', 'Bảo vệ thực vật', 'D07', 47, '7620112', 20.75),
(480, 'TCT', 'Bảo vệ thực vật', 'D08', 46, '7620112', 20.75),
(481, 'TCT', 'Công nghệ rau quả và cảnh quan', 'B00', 15, '7620113', 15.5),
(482, 'TCT', 'Công nghệ rau quả và cảnh quan', 'D07', 15, '7620113', 15.5),
(483, 'TCT', 'Công nghệ rau quả và cảnh quan', 'D08', 15, '7620113', 15.5),
(484, 'TCT', 'Công nghệ rau quả và cảnh quan', 'A00', 15, '7620113', 15.5),
(485, 'TCT', 'Kinh tế nông nghiệp', 'A00', 30, '7620115', 18.5),
(486, 'TCT', 'Kinh tế nông nghiệp', 'A01', 30, '7620115', 18.5),
(487, 'TCT', 'Kinh tế nông nghiệp', 'D01', 30, '7620115', 18.5),
(488, 'TCT', 'Kinh tế nông nghiệp', 'C02', 30, '7620115', 18.5),
(489, 'TCT', 'Phát triển nông thôn', 'A00', 20, '7620116', 15.5),
(490, 'TCT', 'Phát triển nông thôn', 'B00', 20, '7620116', 15.5),
(491, 'TCT', 'Phát triển nông thôn', 'A01', 20, '7620116', 15.5),
(492, 'TCT', 'Phát triển nông thôn', 'D07', 20, '7620116', 15.5),
(493, 'TCT', 'Lâm sinh', 'A00', 15, '7620205', 15.5),
(494, 'TCT', 'Lâm sinh', 'A01', 15, '7620205', 15.5),
(495, 'TCT', 'Lâm sinh', 'B00', 15, '7620205', 15.5),
(496, 'TCT', 'Lâm sinh', 'D08', 15, '7620205', 15.5),
(497, 'TCT', 'Nuôi trồng thủy sản', 'B00', 35, '7620301', 17),
(498, 'TCT', 'Nuôi trồng thủy sản', 'A00', 35, '7620301', 17),
(499, 'TCT', 'Nuôi trồng thủy sản', 'D07', 35, '7620301', 17),
(500, 'TCT', 'Nuôi trồng thủy sản', 'D07', 35, '7620301', 17),
(501, 'TCT', 'Bệnh học thủy sản', 'B00', 15, '7620302', 16.25),
(502, 'TCT', 'Bệnh học thủy sản', 'A00', 15, '7620302', 16.25),
(503, 'TCT', 'Bệnh học thủy sản', 'D07', 15, '7620302', 16.25),
(504, 'TCT', 'Bệnh học thủy sản', 'D08', 15, '7620302', 16.25),
(505, 'TCT', 'Quản lý thủy sản', 'B00', 15, '7620305', 15.5),
(506, 'TCT', 'Quản lý thủy sản', 'A00', 15, '7620305', 15.5),
(507, 'TCT', 'Quản lý thủy sản', 'D07', 15, '7620305', 15.5),
(508, 'TCT', 'Quản lý thủy sản', 'D08', 15, '7620305', 15.5),
(509, 'TCT', 'Thú y', 'B00', 35, '7640101', 21.75),
(510, 'TCT', 'Thú y', 'A02', 35, '7640101', 21.75),
(511, 'TCT', 'Thú y', 'D07', 35, '7640101', 21.75),
(512, 'TCT', 'Thú y', 'D08', 35, '7640101', 21.75),
(513, 'TCT', 'Quản lý tài nguyên và môi trường', 'A00', 15, '7850101', 21),
(514, 'TCT', 'Quản lý tài nguyên và môi trường', 'A01', 15, '7850101', 21),
(515, 'TCT', 'Quản lý tài nguyên và môi trường', 'B00', 15, '7850101', 21),
(516, 'TCT', 'Quản lý tài nguyên và môi trường', 'D07', 15, '7850101', 21),
(517, 'TCT', 'Kinh tế tài nguyên thiên nhiên', 'A00', 15, '7850102', 18.75),
(518, 'TCT', 'Kinh tế tài nguyên thiên nhiên', 'A01', 15, '7850102', 18.75),
(519, 'TCT', 'Kinh tế tài nguyên thiên nhiên', 'D01', 15, '7850102', 18.75),
(520, 'TCT', 'Kinh tế tài nguyên thiên nhiên', 'C02', 15, '7850102', 18.75),
(521, 'TCT', 'Quản lý đất đai', 'A00', 23, '7850103', 19),
(522, 'TCT', 'Quản lý đất đai', 'A01', 23, '7850103', 19),
(523, 'TCT', 'Quản lý đất đai', 'B00', 23, '7850103', 19),
(524, 'TCT', 'Quản lý đất đai', 'D07', 23, '7850103', 19);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `fuzzy_set`
--
ALTER TABLE `fuzzy_set`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `khoi_nganh`
--
ALTER TABLE `khoi_nganh`
  ADD PRIMARY KEY (`Khoi_Nganh_ID`);

--
-- Chỉ mục cho bảng `khoi_thi`
--
ALTER TABLE `khoi_thi`
  ADD PRIMARY KEY (`Khoi_Thi_ID`);

--
-- Chỉ mục cho bảng `linh_vuc_dao_tao`
--
ALTER TABLE `linh_vuc_dao_tao`
  ADD PRIMARY KEY (`Linh_Vuc_Dao_Tao_ID`),
  ADD KEY `Khoi_Nganh_ID` (`Khoi_Nganh_ID`);

--
-- Chỉ mục cho bảng `nganh`
--
ALTER TABLE `nganh`
  ADD PRIMARY KEY (`Nganh_ID`),
  ADD KEY `Nhom_Nganh_ID` (`Nhom_Nganh_ID`);

--
-- Chỉ mục cho bảng `nhom_nganh`
--
ALTER TABLE `nhom_nganh`
  ADD PRIMARY KEY (`Nhom_Nganh_ID`),
  ADD KEY `Linh_Vuc_Dao_Tao_ID` (`Linh_Vuc_Dao_Tao_ID`);

--
-- Chỉ mục cho bảng `thuoc_tinh_bai_toan_1`
--
ALTER TABLE `thuoc_tinh_bai_toan_1`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `thuoc_tinh_bai_toan_2`
--
ALTER TABLE `thuoc_tinh_bai_toan_2`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `to_chuc_dao_tao`
--
ALTER TABLE `to_chuc_dao_tao`
  ADD PRIMARY KEY (`To_Chuc_Dao_Tao_ID`);

--
-- Chỉ mục cho bảng `trong_so`
--
ALTER TABLE `trong_so`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tuyen_sinh`
--
ALTER TABLE `tuyen_sinh`
  ADD PRIMARY KEY (`Tuyen_Sinh_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `khoi_nganh`
--
ALTER TABLE `khoi_nganh`
  MODIFY `Khoi_Nganh_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `khoi_thi`
--
ALTER TABLE `khoi_thi`
  MODIFY `Khoi_Thi_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT cho bảng `linh_vuc_dao_tao`
--
ALTER TABLE `linh_vuc_dao_tao`
  MODIFY `Linh_Vuc_Dao_Tao_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `nganh`
--
ALTER TABLE `nganh`
  MODIFY `Nganh_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT cho bảng `nhom_nganh`
--
ALTER TABLE `nhom_nganh`
  MODIFY `Nhom_Nganh_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT cho bảng `thuoc_tinh_bai_toan_2`
--
ALTER TABLE `thuoc_tinh_bai_toan_2`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `to_chuc_dao_tao`
--
ALTER TABLE `to_chuc_dao_tao`
  MODIFY `To_Chuc_Dao_Tao_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT cho bảng `tuyen_sinh`
--
ALTER TABLE `tuyen_sinh`
  MODIFY `Tuyen_Sinh_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=525;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `linh_vuc_dao_tao`
--
ALTER TABLE `linh_vuc_dao_tao`
  ADD CONSTRAINT `linh_vuc_dao_tao_ibfk_1` FOREIGN KEY (`Khoi_Nganh_ID`) REFERENCES `khoi_nganh` (`Khoi_Nganh_ID`);

--
-- Các ràng buộc cho bảng `nganh`
--
ALTER TABLE `nganh`
  ADD CONSTRAINT `nganh_ibfk_1` FOREIGN KEY (`Nhom_Nganh_ID`) REFERENCES `nhom_nganh` (`Nhom_Nganh_ID`);

--
-- Các ràng buộc cho bảng `nhom_nganh`
--
ALTER TABLE `nhom_nganh`
  ADD CONSTRAINT `nhom_nganh_ibfk_1` FOREIGN KEY (`Linh_Vuc_Dao_Tao_ID`) REFERENCES `linh_vuc_dao_tao` (`Linh_Vuc_Dao_Tao_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

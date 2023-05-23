-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 23, 2023 lúc 05:28 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `btth02`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendance`
--

CREATE TABLE `attendance` (
  `id_attendance` int(11) NOT NULL,
  `day` date NOT NULL DEFAULT current_timestamp(),
  `id_class` int(11) NOT NULL,
  `id_sv` int(11) NOT NULL,
  `status` enum('attend','absent','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `attendance`
--

INSERT INTO `attendance` (`id_attendance`, `day`, `id_class`, `id_sv`, `status`) VALUES
(1, '2023-05-20', 1, 1, 'attend'),
(2, '2023-05-20', 2, 1, 'attend'),
(3, '2023-05-20', 2, 2, 'attend');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `id_class` int(11) NOT NULL,
  `class code` int(11) NOT NULL,
  `classname` varchar(100) NOT NULL,
  `id_instructor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `classes`
--

INSERT INTO `classes` (`id_class`, `class code`, `classname`, `id_instructor`) VALUES
(1, 0, 'Công nghệ Web', 1),
(2, 0, 'Nền tảng phát triển Web', 1),
(3, 0, 'Phát triển ứng dụng cho các thiết bị di động', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `instructors`
--

CREATE TABLE `instructors` (
  `id_instructor` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact info` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `instructors`
--

INSERT INTO `instructors` (`id_instructor`, `id_user`, `name`, `email`, `contact info`) VALUES
(1, 5, 'Kiều Tuấn Dũng', 'dungkt@gmail.com', 'ĐHTL'),
(2, 6, 'Nguyễn Văn Nam', 'namnv@gmail.com', 'ĐHTL');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `id_sv` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `birth` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact info` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `students`
--

INSERT INTO `students` (`id_sv`, `id_user`, `name`, `birth`, `email`, `contact info`) VALUES
(1, 2, 'Phạm Thu Hằng', '2002-12-27', 'hangpt@gmail.com', 'ĐHTL'),
(2, 3, 'Nguyễn Đức Tuấn ', '2002-08-24', 'tuannd@gmail.com', 'ĐHTL'),
(3, 4, 'Phan Văn Hiệp ', '2002-09-15', 'hiepvp@gmail.com', 'ĐHTL');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('0','1','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `role`) VALUES
(2, 'phamthuhang', '123', '1'),
(3, 'nguyenductuan', '123', '1'),
(4, 'phanvanhiep', '123', '1'),
(5, 'kieutuandung', '123', '0'),
(6, 'nguyenvannam', '123', '0');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id_attendance`),
  ADD KEY `id_class` (`id_class`),
  ADD KEY `id_sv` (`id_sv`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id_class`),
  ADD KEY `id_instructor` (`id_instructor`);

--
-- Chỉ mục cho bảng `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id_instructor`),
  ADD KEY `instructors_ibfk_1` (`id_user`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id_sv`),
  ADD KEY `students_ibfk_1` (`id_user`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `classes` (`id_class`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`id_sv`) REFERENCES `students` (`id_sv`);

--
-- Các ràng buộc cho bảng `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`id_instructor`) REFERENCES `instructors` (`id_instructor`);

--
-- Các ràng buộc cho bảng `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `instructors_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Các ràng buộc cho bảng `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

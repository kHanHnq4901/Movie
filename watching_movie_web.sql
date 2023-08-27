-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 07, 2023 at 05:53 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `watching_movie_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `created_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `publisher_id`, `movie_id`, `created_at`) VALUES
(16, 4, 68, '2023-07-03 14:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `status`, `slug`) VALUES
(8, 'Phim Bộ', 'Phim bộ mới cập nhật', 1, 'phim-bo'),
(16, 'Phim Lẻ', 'phim lẻ mới cập nhật', 1, 'phim-le');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `title`, `description`, `status`, `slug`) VALUES
(7, 'Việt Nam', 'VN', 1, 'viet-nam'),
(9, 'Mỹ', 'Mỹ', 1, 'my'),
(10, 'Hồng Kông', 'Hồng Kông', 1, 'hong-kong'),
(11, 'Nhật Bản', 'Nhật Bản', 1, 'nhat-ban'),
(12, 'Trung Quốc', 'Trung Quốc', 1, 'trung-quoc'),
(13, 'Hàn Quốc', 'Hàn Quốc', 1, 'han-quoc'),
(14, 'Đài Loan', 'Đài Loan', 1, 'dai-loan'),
(31, 'Anh', 'Anh', 1, 'anh'),
(32, 'Ấn Độ', 'Ấn Độ', 1, 'an-do');

-- --------------------------------------------------------

--
-- Table structure for table `episodes`
--

CREATE TABLE `episodes` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `movie_link` text NOT NULL,
  `episode` int(11) NOT NULL,
  `link` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `episodes`
--

INSERT INTO `episodes` (`id`, `movie_id`, `movie_link`, `episode`, `link`) VALUES
(19, 61, '<iframe width=\"640\" height=\"360\" src=\"https://kd.opstream3.com/share/d83a3b7c173b00c655629bc5bde5bb9c\" frameborder=\"0\" scrolling=\"0\" allowfullscreen></iframe>', 1, 0),
(20, 62, '<iframe width=\"640\" height=\"360\" src=\"https://1080.opstream4.com/share/565f25dc30f2dcc716b610cbc31dbab9\" frameborder=\"0\" scrolling=\"0\" allowfullscreen></iframe>', 1, 0),
(21, 62, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/2d89c85b46ff0fc0e249569c71d98385\"></iframe>', 2, 0),
(22, 62, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/3953e20c5314a7773feba5489c97d84b\"></iframe>', 3, 0),
(23, 63, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/c2bb2199cb1cff125e02122597fbfb29\"></iframe>', 1, 0),
(24, 63, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/003d859bbd84a526b9e06340ce7d185f\"></iframe>', 2, 0),
(25, 63, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/0d786ca032d3de26beac81f7848f21bb\"></iframe>', 3, 0),
(26, 63, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/a3118fa8703d93a510ea9bd337a4d144\"></iframe>', 4, 0),
(27, 63, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/829bf4536948fd0c9635813701126e3a\"></iframe>', 5, 0),
(28, 63, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/25d3f9e66474e753d561436cf847d76c\"></iframe>', 6, 0),
(29, 63, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/b3a39b89a52050b28386e5ef833878a1\"></iframe>', 7, 0),
(30, 64, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://vie.opstream1.com/share/b928c4fa4fc95fd7e83a96fa48c76418\"></iframe>', 1, 0),
(31, 64, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://kd.opstream3.com/share/2c0f42a1d01e356647ce4f248a341c86\"></iframe>', 2, 0),
(32, 64, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://kd.opstream3.com/share/2b2050eb04c8bf0965fd4f153767c64b\"></iframe>', 3, 0),
(33, 66, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://kd.opstream3.com/share/dfcfbb196720bb3febac626b8b9d082d\"></iframe>', 1, 0),
(34, 70, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/499d9afe5b4f88f2585fbff224d8c0f5\"></iframe>', 1, 6),
(35, 70, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/02c29fad5f164d62227212fbb95e02f1\"></iframe>', 2, 6),
(36, 70, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/1b4ea86404d0b479c4a73e55dfd8b0b7\"></iframe>', 3, 6),
(38, 62, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/73f5e089655480ef8e9190a79253940d\"></iframe>', 4, 0),
(39, 81, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://kd.opstream3.com/share/b1562246c02be63bac86a26684cdce58\"></iframe>', 1, 1),
(41, 79, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/a75aa7d6160524eaef78d011e48f6c5c\"></iframe>', 1, 6),
(42, 79, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://1080.opstream4.com/share/e66292f43e32d3b92d2c00229a6afe55\"></iframe>', 2, 1),
(43, 81, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://vie2.opstream7.com/share/0584ce565c824b7b7f50282d9a19945b\"></iframe>', 1, 6),
(44, 79, '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" src=\"https://vie2.opstream7.com/share/5ef698cd9fe650923ea331c15af3b160\"></iframe>', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `title`, `description`, `status`, `slug`) VALUES
(6, 'Tâm Lý', 'Tâm Lý', 1, 'tam-ly'),
(7, 'Hành động', 'Hành động', 1, 'hanh-dong'),
(8, 'Viễn Tưởng', 'Viễn Tưởng', 1, 'vien-tuong'),
(9, 'Hoạt Hình', 'Hoạt Hình', 1, 'hoat-hinh'),
(10, 'Kinh Dị', 'Kinh Dị', 1, 'kinh-di'),
(11, 'Hài Hước', 'Hài Hước', 1, 'hai-huoc'),
(12, 'Hình Sự', 'Hình Sự', 1, 'hinh-su'),
(13, 'Võ Thuật', 'Võ Thuật', 1, 'vo-thuat'),
(14, 'Cổ Trang', 'Cổ Trang', 1, 'co-trang'),
(15, 'Tình Cảm', 'Tình Cảm', 1, 'tinh-cam'),
(16, 'Thần Thoại', 'Thần Thoại', 1, 'than-thoai'),
(17, 'Tài Liệu', 'Tài Liệu', 1, 'tai-lieu'),
(18, 'Phiêu Lưu', 'Phiêu Lưu', 0, 'phieu-luu'),
(19, 'Gia Đình', 'Gia Đình', 0, 'gia-dinh'),
(55, 'Chiến Tranh', 'Chiến Tranh', 1, 'chien-tranh'),
(56, 'Bí Ẩn', 'Bí Ẩn', 1, 'bi-an');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `logo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `title`, `description`, `logo`) VALUES
(1, 'Phimmoi | Phimmoi.net | Xem phim mới | Phim hay | Phim chiếu rạp', 'Trang xem phim Online với giao diện mới được bố trí và thiết kế thân thiện với người dùng. Nguồn phim được tổng hợp từ các website lớn với đa dạng các đầu phim và thể loại vô cùng phong phú.', 'Netflix_2015_logo412.png');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `name`, `description`, `status`) VALUES
(1, 'Link Thường', 'Link có quảng cáo', 1),
(6, 'Link Vip', 'Không quảng cáo', 1),
(9, 'Link Okru', 'link xem free', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `status` tinyint(4) NOT NULL,
  `image` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `hot_movie` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `quality` int(11) NOT NULL DEFAULT 0,
  `subtitle` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` varchar(50) DEFAULT NULL,
  `update_movie_day` varchar(50) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `topview` int(11) DEFAULT NULL,
  `number_episode` int(11) NOT NULL DEFAULT 1,
  `eng_name` varchar(100) DEFAULT NULL,
  `views` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `status`, `image`, `slug`, `hot_movie`, `category_id`, `country_id`, `quality`, `subtitle`, `date_created`, `update_movie_day`, `year`, `time`, `tags`, `topview`, `number_episode`, `eng_name`, `views`) VALUES
(61, 'CHIẾN BINH KHỔNG LỒ XUẤT HIỆN Ở TOKYO', 'Đoạn phim ngắn tập trung vào Chiến binh Thần từ Nausicaa của Thung lũng gió (1984). Vũ khí sinh học siêu năng lực trong bộ giáp gốm bắt đầu tấn công Tokyo, hủy diệt nền văn minh nhân loại.', 1, 'poster270.jpg', 'chien-binh-khong-lo-xuat-hien-o-tokyo', 1, 16, 11, 0, 0, '2023-06-23 09:44:44', '2023-06-24 11:08:34', '2012', '10 Phút', NULL, 0, 1, 'Giant God Warrior Appears in Tokyo', 6),
(62, 'TÔI LÀ XỬ NỮ', 'Một trò vui dành cho lứa tuổi mới lớn về Cootie, một thanh niên da đen cao 13 ft ở Oakland, CA. Lớn lên ở ẩn, Cootie sớm trải nghiệm vẻ đẹp và những mâu thuẫn của thế giới lần đầu tiên. Anh kết bạn, tìm thấy tình yêu, vượt qua những tình huống khó xử và gặp thần tượng của mình, một siêu anh hùng ngoài đời thực tên là The Hero.', 1, 'toi-la-xu-nu-x5004523.webp', 'toi-la-xu-nu', 1, 8, 9, 0, 0, '2023-06-23 09:51:50', '2023-06-24 11:08:52', NULL, '30 phút/tập', NULL, 2, 7, 'I\'m a Virgo', 7),
(63, 'VỤNG TRỘM KHÔNG THỂ GIẤU', 'Xoay quanh câu chuyện diễn ra vào thời trung học, Tang Trĩ thường xuyên bị mời phụ huynh, để giải quyết phiền toái này cô quyết định nhờ anh trai đi hộ. Nhưng anh em ruột hễ gặp nhau là cà khịa, không thể làm gì khác hơn là phải nhờ người bạn cùng phòng thường đến nhà chơi của anh trai là Đoàn Gia Hứa. Dưới sự nhờ vả và uy hiếp của Tang Trĩ, Đoàn Gia Hứa giúp Tang Trĩ đến trường gặp giáo viên, vì vậy mà hai người cũng kết duyên, từ đây Đoàn Gia Hứa càng yêu mến và che chở Tang Trĩ như em gái ruột mình. Đoàn Gia Hứa tốt nghiệp đại học, hai người chia cách hai nơi, bởi vì một vài hiểu lầm mà quan hệ hời hợt. Cho đến khi Tang Trĩ trưởng thành, thi được vào trường học ở thành phố có Đoàn Gia Hứa như cô mong muốn, hai người mới gặp lại nhau. Tiếp xúc ngày càng thân mật, Tang Trĩ dần phát hiện cội nguồn áp lực của Đoàn Gia Hứa, cô muốn bảo vệ người anh trai luôn đối xử rất tốt với mình này, nhặt lại tình cảm thầm mến đã chôn giấu từ lâu. Bằng sự bầu bạn của Tang Trĩ, Đoàn Gia Hứa dần dần tháo gỡ khúc mắc, anh đã thật tâm yêu thích Tang Trĩ. Câu chuyện thầm mến hồn nhiên cuối cùng cũng nở ra một đoá hoa tình yêu xinh đẹp.', 1, 'vung-trom-khong-the-giau-thumb242.avif', 'vung-trom-khong-the-giau', 1, 8, 12, 0, 0, '2023-06-23 10:52:50', '2023-06-24 11:09:06', '2023', '45 phút/tập', NULL, 1, 25, 'Hidden Love', 65152),
(64, 'TRẬN CHIẾN HẠNH PHÚC', 'Một bộ phim hồi hộp mô tả các bà mẹ tham gia vào một trận chiến khốc liệt trên mạng xã hội để phá hủy hạnh phúc của nhau vì chính họ, để giải phóng bản thân khỏi sự áp bức, tổn thương và bí mật, đồng thời lấy lại con người thật của họ.', 1, 'tran-chien-hanh-phuc-thumb3309.avif', 'tran-chien-hanh-phuc', 1, 8, 13, 0, 0, '2023-06-23 11:00:27', '2023-06-24 11:09:20', '2013', '60 phút/tập', NULL, 1, 3, 'Battle for Happiness (Happiness Battle)', 8965),
(65, '88 MINUTES', 'Một giáo sư đại học, người ngoài giờ làm bác sĩ tâm thần pháp y cho FBI, nhận được một lời đe dọa tử vong tuyên bố rằng anh ta chỉ còn 88 phút để sống.', 1, '88-minutes-thumb8527.avif', '88-minutes', 1, 16, 9, 0, 0, '2023-06-23 11:28:15', '2023-06-24 11:09:40', '2007', '108 Phút', NULL, 0, 1, NULL, 79860),
(66, 'A BETTER TOMORROW', 'Hai anh em ở hai phe khác nhau đối đầu nhau.', 1, 'a-better-tomorrow-thumb5495.avif', 'a-better-tomorrow', 1, 16, 13, 0, 0, '2023-06-23 11:31:08', '2023-06-23 11:31:08', '2010', '124 Phút', NULL, 2, 1, NULL, 54781),
(67, 'VƯỢT BIÊN', 'Một nữ phóng viên người Mỹ tìm kiếm người anh trai mất tích của mình trong bối cảnh bạo lực và buôn lậu người qua biên giới Hoa Kỳ/Mexico.', 1, 'vuot-bien-thumb2743.avif', 'vuot-bien', 1, 16, 9, 1, 1, '2023-06-23 11:39:52', '2023-06-24 11:10:12', '2001', '96 Phút', NULL, 0, 1, 'Border Run', 74676),
(68, 'CHÀNG TRAI CÔ GÁI VÀ BỨC TƯỜNG', 'Khi Ryo, một phóng viên tạp chí trẻ, chuyển đến một căn hộ mới, anh được chào đón bởi những âm thanh say đắm của cô hàng xóm xinh đẹp đáng kinh ngạc Satsuki. Nhận ra bức tường ngăn cách căn hộ của họ mỏng như tờ giấy, nhà báo bị quyến rũ bắt đầu nghe lén mọi chi tiết về cuộc sống của cô gái hàng xóm: những cuộc trò chuyện của cô ấy, bồn tắm bong bóng của cô ấy... tiếng khóc khó thở của cô ấy.', 1, 'chang-trai-co-gai-va-buc-tuong-thumb8605.avif', 'chang-trai-co-gai-va-buc-tuong', 1, 16, 7, 2, 1, '2023-06-23 11:42:24', '2023-06-24 11:10:32', '2010', '84 Phút', NULL, 0, 1, 'Man, Woman & the Wall', 6619),
(69, 'NAM DƯƠNG NỮ NHI TÌNH', '\"Tình Nữ Nhi Nam Dương\" là bộ phim truyền hình sử thi đấu tranh truyền cảm hứng cho phụ nữ Trung Quốc của đạo diễn bởi Quách Thế Dân, với sự tham gia của các diễn viên Tiêu Yến và Đới Tương Vũ Tiêu Yến và Đới Hướng Vũ lại đóng phim cùng nhau, tiếp tục số phận của vai chính trong \"Chuyện tình cô bé Lọ Lem \", kể về câu chuyện tình yêu ở Nam Dương. Một truyền thuyết về thời đại đầy cảm hứng, một tác phẩm mới đầy sức sống tập trung vào một nhân vật nữ. Một câu chuyện khắc họa tinh thần đấu tranh của Hoa kiều, đề cao trọn vẹn nét đẹp văn hóa Trung Hoa giữa những đổi thay của cuộc sống. Một huyền thoại đẹp sẽ được chia sẻ trên toàn thế giới.', 1, 'nam-duong-nu-nhi-tinh-thumb9802.avif', 'nam-duong-nu-nhi-tinh', 1, 8, 12, 1, 1, '2023-06-23 11:44:49', '2023-06-24 11:10:44', '2011', '45 phút/tập', NULL, 0, 40, 'Sisterhood', 65270),
(70, 'TRƯỜNG PHONG ĐỘ', '\\\"Trường Phong Đô\\\" là bộ phim cổ trang do Doãn Đào đạo diễn với sự tham gia của Bạch Kính Đình và Tống Dật.\\nBộ phim được chuyển thể từ tiểu thuyết cùng tên của Mặc Thư Bạch, kể về câu chuyện của Liễu Ngọc Như con gái của một thương gia buôn vải ở Dương Châu, người đã bị bạo hành từ khi còn nhỏ, và Cố Cửu Tư một tay chơi nổi tiếng ở địa phương. Đó là câu chuyện cảm động về hai con người với những tính cách rất khác nhau trong một cuộc hôn nhân đặt nhầm chỗ, từ xung đột lẫn nhau đến hỗ trợ lẫn nhau và hàn gắn lẫn nhau.\\nNgọc Như con gái của một thương gia buôn vải ở Dương Châu, mẹ ruột bị bệnh nặng, người vợ lẽ đối xử tệ bạc với cô từ khi còn nhỏ.Cô đã bị gia đình sắp đặt để kết hôn với Cửu Tư - một tay chơi nổi tiếng ở Dương Châu. Cửu Tư cho rằng cô kết hôn với anh ta vì anh ta có quyền lực, nên rất khinh thường cô. Ngọc Như chợt nhận ra rằng số phận của cô không thể bị ràng buộc bởi cuộc hôn nhân với người khác, vì vậy cô quyết định học cách kinh doanh, để độc lập và tìm ra giá trị bản thân. Sau khi làm việc chăm chỉ, Ngọc Như đã xuất sắc vượt qua bài kiểm tra của mẹ Cố và dần trở nên thành thạo trong kinh doanh, trong quá trình đó, cô đã thay đổi cách nhìn về Cửu Tư và khám phá ra khía cạnh tốt đẹp của đối phương. Tuy nhiên, vào thời điểm này, sứ thần Dương Châu Vương Thiện Tuyền độc ác và ngang ngược, khiến người dân phải di dời, và Cố Gia cũng phải di dời đi. Để chấm dứt tình trạng hỗn loạn và để người dân được sống trong hòa bình, Cửu Tư bắt đầu hành động, quét sạch những tệ nạn và giảm nhẹ thuế. Ngọc Như đã xây dựng các hội trường từ thiện và giao lưu thương mại với bên ngoài, điều này làm cho vật tư thịnh vượng và người dân khỏe mạnh, hai người cùng nhau viết nên một câu chuyện về một cuộc sống tươi đẹp.', 1, 'truong-phong-do-thumb4999.avif', 'truong-phong-do', 1, 8, 12, 1, 1, '2023-06-23 11:47:29', '2023-06-24 11:08:21', '2004', '45 phút/tập', NULL, 0, 40, 'Destined', 88946),
(71, 'Tình Yêu Của Ma Nữ', 'Phim Tình Yêu Của Ma Nữ - Witch\'s Love 2018: Trong bối cảnh đồng bằng ở Seoul nhộn nhịp, ba thế hệ phù thủy đã sống dưới mọi người xung quanh. Kang Cho Hong điều hành một nhà hàng với các phù thủy của cô, Maeng Ye Soon và Jo Aeng Doo. Họ cố gắng để giữ một hồ sơ thấp, nhưng vẻ đẹp trẻ trung Cho Hong thu hút sự chú ý của một anh chàng khu phố, Hwang Jae Wook, người luôn luôn cố gắng để có được gần gũi với cô ấy. Cho Hong và cuộc sống yên tĩnh của phù thủy trở nên phức tạp khi chủ nhà của họ, Ma Sung Tae, xuất hiện một ngày. Sung Tae muốn đối mặt với một sự cố đau thương xảy ra với anh trong tòa nhà đó khi anh còn là một cậu bé. Với việc Sung Tae định cư quanh công việc của họ một cách thường xuyên, liệu Cho Hong có thể giữ bí mật thực sự của cô một bí mật với anh?', 1, 'tinh-yeu-cua-ma-nu-thumb8400.avif', 'tinh-yeu-cua-ma-nu', 1, 8, 13, 2, 0, '2023-06-23 12:00:51', '2023-06-24 11:08:10', '2014', '70 phút / tập', NULL, 0, 12, 'Witch\'s Love', 98245),
(72, 'Quái vật bàn bên', 'Nữ sinh chăm chỉ Shizuku chẳng có hứng thú với chuyện giao lưu kết bạn. Nhưng cô lại bất ngờ trở thành bạn của Haru – cậu bạn học sáng nắng chiều mưa.', 1, 'quai-vat-ban-ben-thumb9100.avif', 'quai-vat-ban-ben', 1, 8, 7, 0, 0, '2023-06-23 12:03:49', '2023-06-24 11:07:58', '2015', '24phút /tập', NULL, 1, 13, 'My Little Monster', 10366),
(73, 'Người Yêu Bé Nhỏ', 'Giới thiệu: Horikiri Chiyomi học lớp 12 (Yamamoto Maika đóng) và chàng trang nhà hàng xóm Shunichi Minami (Nakagawa Taishi đóng) là thanh mai trúc mã đã bên nhau từ nhỏ. Một ngày nọ, Chiyomi nhìn thấy Minami và cô gái khác ở bên nhau, trong lòng dấy lên cảm giác ghen tỵ và ngưỡng mộ. Đêm đó, Chiyomi và gia đình xảy ra tranh cãi, không ngờ chuyện ngoài ý muốn sau đó lại khiến cô ấy biến thành hình dáng 15cm. Dưới tình huống nằm ngoài dự đoán, Chiyomi và Minami đã bắt đầu cuộc sống chung nhà ly kỳ.', 1, 'nguoi-yeu-be-nho-thumb8856.avif', 'nguoi-yeu-be-nho', 1, 8, 11, 0, 1, '2023-06-23 12:08:27', '2023-06-24 11:07:47', '2000', '43 phút/ 1 tập', NULL, 2, 10, 'My Little Lover', 59163),
(74, 'Phương Pháp Khám Phá Tình Yêu', 'Nữ tiến sĩ địa chất học Tô Kỷ Thời vì bố mẹ ly hôn từ khi cô còn nhỏ nên thiếu thốn tình thương gia đình, do đó trong lòng cô rất xem trọng tình cảm gia đình. Sau khi trưởng thành, cô chọn chuyên ngành địa chất học và để bảo vệ ước mơ của người thân, cô bắt đầu thử học các chuyên ngành khác nhau, trải nghiệm những cuộc sống khác nhau. Trong quá trình này, Tô Kỷ Thời có duyên làm quen với Mục Hưu Luân, một doanh nhân trẻ cũng đam mê địa chất. Mục Hưu Luân tuy là trẻ mồ côi nhưng cha mẹ nuôi của anh lại coi anh như con ruột, chỉ có điều doanh nghiệp do Mục Hưu Luân quản lý vẫn giữ lối tư duy truyền thống, những ý tưởng đổi mới của anh luôn bị các nhà lãnh đạo cấp cao phản đối, trong đó đứng đầu là chú hai. Việc thúc đẩy nghiên cứu khoáng vật mới cũng gặp nhiều khó khăn, nhưng Tô Kỷ Thời vẫn luôn cung cấp những kiến thức chuyên môn về khoáng vật để giúp Mục Hưu Luân. Trong quá trình quen biết, Tô Kỷ Thời và Mục Hưu Luân dần bước vào trái tim của nhau, hai người nương tựa lẫn nhau, giúp nhau chữa lành tâm hồn, đồng thời thúc đẩy nghiên cứu khoáng vật mới, cùng nhau bắt đầu hành trình mới trong cuộc đời.', 1, 'phuong-phap-kham-pha-tinh-yeu-thumb7692.avif', 'phuong-phap-kham-pha-tinh-yeu', 1, 8, 12, 2, 0, '2023-06-23 12:28:05', '2023-06-24 11:07:38', '2001', '45 phút/tập', NULL, 2, 22, 'Exploration Method of Love', 21000),
(77, 'Đấu Phá Thương Khung Ngoại Truyện', 'Sau hợp đồng ba năm, Xiao Yan cuối cùng đã gặp Xuan\'er tại Học viện Jianan, sau đó anh kết bạn thân và thành lập Pan Sect; Để tiếp tục nâng cao sức mạnh của mình và trả thù Vân Lan phái cho cha mình, anh ta đã đi sâu vào Tháp khí đốt thiên đường để nuốt chửng Fallen Heart Yan bằng sự mạo hiểm của chính mình ...', 1, 'dau-pha-thuong-khung-ngoai-truyen-thumb2444.avif', 'dau-pha-thuong-khung-ngoai-truyen', 1, 8, 12, 1, 0, '2023-06-23 13:25:59', '2023-06-24 11:07:00', '2009', '25 phút/tập', NULL, 0, 52, 'Fights Break Sphere S5', 78416),
(78, 'Đảo Hải Tặc', 'Monkey D. Luffy, 1 cậu bé rất thích Đảo hải tặc có ước mơ tìm được kho báu One Piece và trở thành Vua hải tặc - Pirate King. Lúc nhỏ, Luffy tình cờ ăn phải trái quỉ (Devil Fruit) Gomu Gomu, nó cho cơ thể cậu khả năng co dãn đàn hồi như cao su nhưng đổi lại cậu sẽ không bao giờ biết bơi. Sau đó Luffy lại được Shank cứu thoát tuy nhiên ông ta bị mất 1 cánh tay. Sau đấy Shank chia tay Luffy và để lại cho cậu cái mũ rơm (Straw Hat) và nói rằng: Sau này bao giờ thành cướp biển hãy gặp ta và trả lại nó. Chính lời nói này đã thúc đầy Luffy trở thành 1 cướp biển thật sự.\r\n\r\nHãy cùng theo dõi xem liệu Luffy có thể trở thành đạt được kho báu One Piece và trở thành Vua Hải Tặc không nhé.', 1, 'one-piece-thumb9833.avif', 'dao-hai-tac', 1, 8, 11, 1, 0, '2023-06-23 13:31:52', '2023-06-24 11:06:50', '2000', '25 phút/1 tập', NULL, 2, 2000, 'One Piece (Luffy)', 11208),
(79, 'CẠM BẪY', 'Trong phim , Bobby đóng vai Chai Foon Chung là một người rất lanh và thông minh , nhưng mà không biết tận dụng trí thông minh của mình , khi gia đình anh qua đời , Foon Chung có trách nhiệm phải chăm sóc em trai mình là Chai Foon Lok Bosco nhưng tại tính vô trách nhiệm của mình mà đã làm thất lạc mất em rất . Bobby tự trách bản thân mình rất nhiều , chính vì anh mà em trai mình mất tính , tại anh sống buông tha , không lo cho em trai .Nhân vật của Bobby là một người rất nghiện cờ bạc mặc dù đánh lần nào là thua lần đó , cuối cùng phải trốn nợ sang Phillipines.', 1, 'cam-bay-1-thumb1758.avif', 'cam-bay', 1, 8, 14, 1, 1, '2023-06-23 16:46:17', '2023-06-24 10:02:12', '2000', '45 phút/tập', NULL, 1, 35, 'Dicey Business', 40490),
(81, 'BỐ GIÀ', 'Câu chuyện về Ba Sang - con thứ hai trong 4 anh em ồn ào: Giàu, Sang, Phú, Quý. Ba Sang là một người ga lăng, “quá” tốt bụng và luôn hy sinh vì người khác dù họ có muốn hay không. Quân - Ba Sang’s son là một Youtuber trẻ hiện đại.', 1, 'bo-gia-2021-thumb5801.avif', 'bo-gia', 1, 16, 7, 1, 0, '2023-06-29 18:05:10', '2023-06-29 18:05:10', NULL, '128 Phút', NULL, NULL, 1, 'Dad, I\'m Sorry', 74986),
(82, 'VỤ CƯỚP KIM CƯƠNG', 'A former MMA fighter and his brothers must rescue their kidnapped family from a dangerous crime syndicate after $50M of illegal diamonds gets stolen.', 1, 'vu-cuop-kim-cuong-thumb3771.avif', 'vu-cuop-kim-cuong', 1, 16, 9, 0, 0, '2023-07-01 14:38:00', '2023-07-01 14:38:00', NULL, '100 Phút', NULL, NULL, 1, 'Mojave Diamonds', 48497);

-- --------------------------------------------------------

--
-- Table structure for table `movie_genre`
--

CREATE TABLE `movie_genre` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_genre`
--

INSERT INTO `movie_genre` (`id`, `movie_id`, `genre_id`) VALUES
(74, 61, 7),
(75, 61, 8),
(76, 61, 10),
(77, 62, 7),
(78, 62, 8),
(79, 62, 11),
(80, 62, 18),
(81, 63, 6),
(82, 63, 15),
(83, 64, 6),
(84, 64, 15),
(85, 65, 7),
(86, 65, 12),
(87, 66, 6),
(88, 66, 7),
(89, 66, 52),
(90, 67, 8),
(91, 67, 12),
(92, 68, 7),
(93, 68, 15),
(94, 68, 18),
(95, 69, 15),
(96, 69, 19),
(97, 70, 14),
(98, 70, 15),
(99, 71, 6),
(100, 71, 15),
(101, 72, 11),
(102, 73, 6),
(103, 73, 7),
(104, 73, 19),
(105, 74, 6),
(106, 74, 8),
(107, 74, 11),
(108, 75, 8),
(109, 75, 11),
(110, 75, 36),
(111, 76, 11),
(112, 76, 52),
(113, 77, 7),
(114, 77, 9),
(115, 77, 13),
(116, 77, 14),
(117, 78, 6),
(118, 78, 7),
(119, 78, 8),
(120, 78, 9),
(121, 78, 18),
(122, 79, 6),
(123, 79, 15),
(127, 81, 11),
(128, 81, 19),
(129, 82, 7),
(130, 82, 12);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `levels_acc` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `email`, `phone`, `username`, `password`, `created_at`, `levels_acc`) VALUES
(4, 'Trần Quang Thiện', 'tranquangthientqt1@gmail.com', '0392782962', 'tranquangthientqt', 'da71acf0e32b013f72f6fbfdc7d9fdef', '2023-06-26 15:53:02', 0),
(5, 'Trần Quang Thiện', 'kubidepzaj2108@gmail.com', '0392782961', 'tranquangthie', 'da71acf0e32b013f72f6fbfdc7d9fdef', '2023-06-28 17:49:06', 0),
(6, 'Trần Quang Thiện', 'tranquangthientqt1@g', '0392782942', 'tranquangthient', 'da71acf0e32b013f72f6fbfdc7d9fdef', '2023-06-28 18:46:48', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Trần Quang Thiện', 'tranquangthientqt1@gmail.com', NULL, '$2y$10$8XZI/4NEptjg6xPGhmprnOWcStdbLA7ycRJEwqVSWuuX2GwbUQ7rO', 'Fa3T4yJwzHod5qFdElWBSllk7BCAK6S7ZkXlTUV6PWYgI2WomXxG6yQ0oGm6', '2023-05-16 16:42:33', '2023-05-16 16:42:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `episodes`
--
ALTER TABLE `episodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `movie_genre`
--
ALTER TABLE `movie_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

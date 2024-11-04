-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 04, 2024 lúc 03:12 PM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_specialty`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Món ăn chính', '2024-05-01 09:43:53', '2024-05-04 19:45:05'),
(2, 'Món ăn vặt', '2024-05-01 09:43:53', '2024-05-04 19:45:17'),
(3, 'Trái cây', '2024-05-01 09:43:53', '2024-05-04 19:45:32'),
(4, 'Món ăn kèm', '2024-05-01 09:43:53', '2024-05-04 19:45:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `food_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `comment`, `food_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hello', 3, 4, 0, '2024-11-04 04:12:57', '2024-11-04 04:12:57'),
(2, 'ngon quá đi', 21, 4, 0, '2024-11-04 04:13:56', '2024-11-04 04:13:56'),
(3, 'heho', 8, 4, 0, '2024-11-04 04:36:00', '2024-11-04 04:36:00'),
(4, 'xin chào bạn', 3, 4, 0, '2024-11-04 04:55:01', '2024-11-04 04:55:01'),
(5, 'bạn làm gì á', 3, 4, 0, '2024-11-04 04:55:15', '2024-11-04 04:55:15'),
(6, 'hehe', 16, 4, 0, '2024-11-04 05:22:06', '2024-11-04 05:22:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment_contact`
--

CREATE TABLE `comment_contact` (
  `id` int UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comment_contact`
--

INSERT INTO `comment_contact` (`id`, `content`, `comment_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'hi bạn', 1, 4, 0, '2024-11-04 05:55:21', '2024-11-04 05:55:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `food`
--

CREATE TABLE `food` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_category` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `food`
--

INSERT INTO `food` (`id`, `name`, `price`, `unit`, `description`, `id_category`, `created_at`, `updated_at`) VALUES
(1, 'Bún Nước Lèo', '20.000 - 25.000', 'tô', '<div>Là một đặc sản ẩm thực xuất xứ từ người Khmer, trong quá trình cộng cư của các dân tộc Khmer, Việt, Hoa và sự giao thoa trong ẩm thực, bún nước lèo trở thành món ăn chung của các dân tộc miền Nam Việt Nam với nguyên liệu, quy trình chế biến và thưởng thức, khẩu vị về cơ bản là giống nhau.</div><div>Nước lèo được nấu từ một số loại mắm thông thường như mắm cá sặc, mắm cá linh, riêng người Khmer thường nấu bằng mắm bò hóc (pro-hốk) cá kèo, cá lóc hoặc lươn. Mắm bò hóc xuất xứ từ người Khmer đã lan rộng đến văn hóa ẩm thực của cộng đồng người Việt miền Nam Việt Nam. Các loại cá nước ngọt nhỏ như cá lóc, cá rô, cá sặc, cá kèo đều có thể làm mắm và quy trình làm mắm về cơ bản là giống nhau: cá để cho chết và hơi ươn, ủ muối theo tỷ lệ nhất định, sấy khô theo cách để vào bao vải và dằn cho ráo nước. Nước chảy có nồng độ muối và đạm cao, có thể dùng làm nước mắm, còn xác cá cho vào hũ phơi chừng ba tháng là thành con mắm ăn được.</div><div>Những con mắm cá được rã trong nước, gia thêm củ sả đập dập, ớt băm nhuyễn để lấy hương vị, ngải bún (một loại củ giống củ nghệ, màu hơi đậm hơn nghệ) dùng để khử mùi tanh của mắm và nêm đường, bột ngọt cho vừa ăn. Có thể dùng nước dừa xiêm, thậm chí cả một chút nước cốt dừa, gia thêm vào nồi nước lèo thay thế cho đường.</div><div><br></div>', 1, '2024-05-01 18:45:50', '2024-05-05 06:53:08'),
(2, 'Chù Ụ Rang Me', '100.000 - 120.000', '500g', '<p style=\"scrollbar-width: thin; scrollbar-color: var(--pdl-bg-muted) var(--pdl-bg-base); padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: calc(1em + 0.4375rem); color: rgb(0, 0, 0); font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 18px; background-color: rgb(247, 247, 247);\">Trà Vinh là miền đất không chỉ thu hút nhiều du khách bốn phương, vì cảnh đẹp thơ mộng. Mà nơi đây cũng biết đến từ những món ăn ngon đặc sắc, mang đậm hương vị của vùng quê sông nước. Nếu Bà khía được biết là đặc sản của Bến Tre thì Trà Vinh chú ụ rang me là một trong những món \"hot\", hầu hết các nhà hàng tại đây đều có trong menu.</p><p style=\"scrollbar-width: thin; scrollbar-color: var(--pdl-bg-muted) var(--pdl-bg-base); padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: calc(1em + 0.4375rem); color: rgb(0, 0, 0); font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 18px; background-color: rgb(247, 247, 247);\">Chù ụ là một động vật giáp xác thuộc họ nhà cua. Nếu nhìn lần đầu, chúng ta thường nhầm lẫn nó là con Bà khía. Nhưng thân hình chú ụ lại cục mịch và khả năng di chuyển của nó chậm chạp hơn con Bà khía rất nhiều. Ghé thăm Trà Vinh, được tham quan, trải nghiệm ở các bãi bồi nước lợ, hay chèo thuyền đi dọc rừng ven biển, bạn sẽ bắt gặp chú ụ khắp nơi.</p>', 4, '2024-05-01 18:45:50', '2024-05-04 20:00:54'),
(3, 'Bánh Canh Bến Có', '25.000 - 35.000', 'cái', '<span style=\"color: rgb(0, 0, 0); font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 18px; background-color: rgb(247, 247, 247);\">Bánh canh là một món ăn Việt Nam. Bánh canh có nguồn gốc từ Đông Nam Bộ, sau đó phổ biến khắp Việt Nam. Bánh canh bao gồm nước lèo được nấu từ tôm, cá và giò heo thêm gia vị tùy theo từng loại bánh canh. Sợi bánh canh có thể được làm từ bột gạo, bột mì, bột năng hoặc bột sắn hoặc bột gạo pha bột sắn. Bánh được làm từ bột được cán thành tấm và cắt ra thành sợi bự và ngắn hoặc se tròn thành cọng. Bánh được bỏ vào nồi nước đun đủ độ và đợi cho chín tới. Gia vị cho bánh canh thay đổi tùy theo món bánh canh và theo khẩu vị mỗi vùng. Bánh canh có nhiều cách chế biến với cá đã rọc xương, cua/ghẹ, bột lọc, chả cá, tôm/thịt nhưng phổ biến nhất là bánh canh giò heo.</span>', 1, '2024-05-01 18:45:50', '2024-05-04 19:59:32'),
(6, 'Bánh Tét Trà Cuôn', '40.000', 'đòn', 'Bánh tét là món ăn đặc trưng của người miền Nam trong ngày Tết lẫn ngày thường và cả ngày giỗ chạp. Ở miền Tây bánh tét có nhiều loại: bánh tét truyền thống làm từ nhân đậu xanh và thịt mỡ, bánh tét lá cẩm, bánh tét nhân sâm,... đặc biệt nhất phải kể đến bánh tét Trà Cuôn - đặc sản vùng đất Trà Vinh. Bánh tét Trà Cuôn xuất phát từ một ấp tên gọi Trà Cuôn thuộc xã Kim Hòa, huyện Cầu Ngang, Trà Vinh, một địa phương có đông đồng bào Khmer sinh sống.<br>', 2, '2024-05-04 20:06:40', '2024-05-04 20:06:40'),
(7, 'Dừa Sáp', '100.000', 'trái', 'Dừa sáp, còn gọi là dừa đặc ruột, dừa kem, makapuno (Philippines) là một phân loài dừa có quả đặc ruột, cơm dừa dày, mềm dẻo và béo hơn trái dừa thường, nước dừa đặc lại trong veo như sương sa. Là đặc sản duy nhất chỉ có ở Trà Vinh, Việt Nam, dừa được trồng nhiều ở giồng Cây Xanh, cách thị trấn Cầu Kè (Trà Vinh) khoảng 4 km.', 3, '2024-05-04 20:08:13', '2024-05-04 20:08:13'),
(8, 'Bún Suông', '35.000 - 40.000', NULL, 'Bún suông còn được gọi là bún đuông. Món ăn có xuất xứ từ Trà Vinh. Sở dĩ món ăn này có tên gọi như vậy là xuất phát từ chả tôm vừa tươi ngon và mềm mịn được tạo hình như những con đuông. Sự hấp dẫn của món này chính là nước lèo mang đậm chất Trà Vinh. Nước lèo không trong mà có màu nâu đậm, bởi được thêm một ít me và tương hạt vừa tạo nên vị ngọt thanh lại vừa thoang thoảng hương thơm của tương rất hấp dẫn. Món này hiện đang được ưa chuộng ở các tỉnh miền Nam, đặc biệt là Thành phố Hồ Chí Minh. Là một trong 10 món ngon được Tổ chức kỷ lục Việt Nam đề cử đạt giá trị ẩm thực châu Á lần thứ 2 năm 2013.', 1, '2024-05-04 20:17:16', '2024-05-04 20:18:38'),
(9, 'Tôm Khô Vinh Kim', '1.300.000', 'kg', '<p class=\"MsoNormal\">Nhắc\r\nđến thực phẩm được chế biến thành đồ khô thì Tôm Khô từ lâu đã nổi tiếng và trở\r\nthành một trong những đặc sản. Đặc biệt Tôm Khô Vinh Kim hay thương hiệu Tôm\r\nKhô Vinh Kim dì Hai Khâm rất nổi tiếng ở Trà Vinh cũng như trong nước và là Đặc\r\nSản Trà Vinh. Tôm khô Vinh Kim được chế biến từ con\r\ntôm bạc đất được đánh bắt bằng lú, đáy, xà ngôm,… ở các cánh đồng ở Vinh Kim,\r\nhuyện Cầu Ngang, Tỉnh Trà Vinh. Tôm khô Vinh Kim được\r\nchế biến qua nhiều công đoạn: Chọn con tôm, luộc đúng lửa, phơi đúng cách và\r\nđúng độ nắng. Để phơi tôm khô đạt yêu cầu, sân phơi phải tráng bằng xi măng, đổ\r\ntôm trên sân nên tôm khô giữ nguyên màu đỏ, không bị bủn, gãy đây cũng là bí\r\nquyết của làng nghề Tôm khô Vinh Kim, tạo được hương vị thơm ngon rất riêng và\r\nđậm đà đặc trưng có chất lượng vượt trội so với sản phẩm tôm khô cùng loại từ\r\ncác địa phương khác.<o:p></o:p></p>', 4, '2024-05-04 20:26:56', '2024-05-04 20:28:32'),
(10, 'Trái Quách', '50.000', 'trái', '<p class=\"MsoNormal\">Quách là\r\nloại cây cao khoảng 7-8m, lá nhỏ và thân giống như cây cần thăng, trồng khoảng\r\n7 năm thì cho trái. Lá dài 25-35mm và rộng 10-20mm. Trái có đường kính 5–9 cm,\r\ncơm có vị chua ngọt. Khi chín Quách tự rụng, do có vỏ cứng nên nó khó đập vỡ\r\nkhi rụng. Quách có hình cầu, màu xám loang lổ kiểu hạt li ti nhìn giống trái\r\ndây cám, phần thịt bên trong có nhiều sợi cứng và các hạt bám trên đó. Khi\r\ntrái chưa chín phần thịt có màu trắng, khi chín phần thịt chuyển sang màu nâu sậm\r\nđến đen. Nếu để quá chín sẽ bị lên men như mật. Trái\r\nquách làm thức uống giải khát, theo y học dân gian trái quách còn xanh xắt mỏng\r\nphơi khô dùng để chữa trị tiêu chảy, trái chín chống táo bón, giúp điều hòa\r\ntiêu hóa. Trái quách chín có thể dầm nước đá đường và để ngâm rượu. Loại dầm đá\r\nđường có tác dụng giải nhiệt.<o:p></o:p></p>', 3, '2024-05-04 20:29:41', '2024-05-04 20:29:41'),
(11, 'Nước Mắm Rươi', '110.000', 'lít', '<p class=\"MsoNormal\">Trà\r\nVinh vốn nổi tiếng với nhiều đặc sản lạ miệng hấp dẫn. Ai đã từng một lần đến\r\nđây sẽ nghe người dân nơi đây kháo nhau về một loại nước mắm đặc trưng của vùng\r\nnày. Đó chính là đặc sản nước mắm rươi. Công thức làm\r\nmắm rươi cũng đơn giản như nước mắm cá cơm hoặc cá linh, trung bình cứ một đôi\r\nrươi bằng 40 lít khi mới vớt lên pha với muối hột cùng nước theo liều lượng nhất\r\nđịnh, ủ hỗn hợp này trong lu để ngoài trời. Ngoài\r\nrươi làm mắm cho các bữa ăn chính trong ngày, còn được chế biến thành món ăn độc\r\nđáo như chả rươi, bột rươi. Vì mỗi năm chỉ mua được rươi trong một mùa lại được\r\nxem như sản vật nên người dân ở đây vô cùng trân trọng, chỉ khi nhà có khách\r\nquý mới đưa ra tiếp đãi.<o:p></o:p></p>', 4, '2024-05-04 20:30:51', '2024-05-04 20:30:51'),
(12, 'Chuối Tá Quạ', '25.000', 'kg', '<p class=\"MsoNormal\">Chuối táo\r\nquạ hay Chuối tá quạ, chuối nấu, chuối nấu ăn là giống chuối trong chi chuối\r\nMusa, có quả thường được dùng để nấu ăn. Giống chuối này thường chứa nhiều tinh\r\nbột, có thể được ăn chín hoặc ăn sống. Nhiều loại chuối táo quạ được gọi là chuối\r\ntrồng hay chuối xanh. Trong thực vật học, thuật ngữ \"chuối trồng\" chỉ\r\nđược sử dụng cho các loại chuối trồng thật, trong khi các giống trồng giàu tinh\r\nbột khác được sử dụng để nấu ăn được gọi là \"chuối nấu ăn\".True plantains\r\nlà giống cây trồng thuộc Nhóm AAB, trong khi chuối nấu ăn là bất kỳ giống chuối\r\nnào thuộc nhóm AAB, AAA, ABB hoặc BBB. Tên khoa học hiện được chấp nhận cho tất\r\ncả các giống cây trồng trong các nhóm này là Musa × paradisiaca. Chuối Fe\'i\r\n(Musa × troglodytarum) từ các đảo ở Thái Bình Dương, thường được ăn rang hoặc\r\nluộc, và do đó thường được gọi một cách không chính thức là \"chuối\r\nnúi\", nhưng chúng không thuộc về bất kỳ loài nào từ tất cả giống chuối hiện\r\nđại.<o:p></o:p></p>', 3, '2024-05-04 20:42:02', '2024-05-04 20:42:02'),
(13, 'Chả Hoa Năm Thụy', '75.000 - 110.000', NULL, '<p class=\"MsoNormal\">Chả hoa Năm Thụy là một trong những đặc sản của đất Trà Vinh. Khác với\r\nchả lụa truyền thống, chả hoa khi cắt ra tương tự như bông hoa, ở giữa là trứng\r\nmuối, xung quanh là nấm mèo, chả, cuối cùng là lớp trứng gà đánh tan chiên\r\nthành tấm cuộn bên ngoài. Hương vị thơm ngon, tinh tế đặc trưng, phù hợp khẩu vị\r\nnhiều người. Chả có thể được gói bằng lá chuối hoặc cho vào túi nhựa hút chân\r\nkhông. Nguyên liệu chính để làm Chả Hoa Trứng Muối\r\nNăm Thụy bao gồm da heo, chả, trứng muối, trứng chiên và nấm mèo. Phần quan trọng\r\ngóp phần thêm hương vị của Chả Hoa Năm Thụy là công đoạn chế biến chả, chả được\r\nlàm bằng thịt heo tươi, sau đó xay nhuyễn nhiều lần cùng với các gia vị. Công\r\nđoạn phết chả phụ thuộc vào kinh nghiệm của người chế biến, thì chả hoa năm thuỵ\r\nlàm ra mới dai ngon và đậm đà, mang đậm hương vị của đặc sản Trà\r\nVinh.<o:p></o:p></p>', 4, '2024-05-04 21:50:23', '2024-05-04 21:50:23'),
(14, 'Củ Cải Muối Chịt Sa', '160.000', 'kg', '<p class=\"MsoNormal\">Xái Pấu là tên gọi theo người Triều Châu, còn người Việt gọi là “củ cải\r\nmuối”, một đặc sản tại vùng đất Cầu Kè, tỉnh Trà\r\nVinh. Để có được Xái Pấu thơm ngon, nguyên liệu chính\r\nlà củ cải trắng được lấy từ vùng đất giồng Cầu Ngang hay huyện Duyên Hải ven biển,\r\ncủ cải mới chắc thịt nhưng quan trọng nhất là bí quyết “muối cải” có mùi thơm đặc\r\ntrưng, ăn giòn, hương vị đậm đà.<o:p></o:p></p>', 4, '2024-05-04 21:51:44', '2024-05-04 21:51:44'),
(15, 'Bánh Ú Đa Lộc', '20.000', 'cái', '<p class=\"MsoNormal\">Bánh ú ở\r\nĐa Lộc có nguồn gốc ở ấp Hương Phụ, xã Đa Lộc, huyện Châu Thành, tỉnh Trà Vinh.\r\nBánh ú Đa Lộc có truyền thống lâu đời, trở thành một món ăn quen thuộc của người\r\ndân địa phương. Để có cái bánh ú đẹp và ngon đòi hỏi sự nhọc công cũng như sự\r\nkhéo léo của người làm, nguyên liệu chính làm bánh ú là từ hạt nếp mộc mạc dân\r\ndã, lá ngót để bánh có màu xanh tự nhiên, lòng đỏ trứng hột vịt muối, thịt mỡ\r\nvà nhân bánh được làm từ loại đậu xanh nấu chín, nghiền nhuyễn. Người\r\nĐa Lộc chuyên gói bánh ú bằng lá chuối, dáng hình và màu sắc của bánh rất quan\r\ntrọng. Vì vậy, kỹ thuật gói bánh đòi hỏi phải chuẩn từ hình khối lẫn góc cạnh,\r\nsao cho bánh thật khít, thật đều và cân đối. Chính bàn tay khéo léo và nguyên\r\nliệu chọn lọc rất kỹ đã làm cho Bánh ú khi luộc chín có màu xanh lá, cái bánh dẻo\r\nquánh để lại trên da bánh chút xanh phơn phớt rất đẹp chỉ cần cắn một miếng\r\nthôi mà như tận hưởng cả mùi thơm đặc trưng của quê hương.<o:p></o:p></p>', 2, '2024-05-04 21:52:47', '2024-05-04 21:52:47'),
(16, 'Cốm Dẹp', '15.000 - 20.000', NULL, '<p class=\"MsoNormal\">Cốm dẹp là\r\nmột món ăn độc đáo của người Khmer. Không chỉ là món ăn dân dã, đây còn là món\r\năn mang ý nghĩa tâm linh. Đậm nét văn hóa truyền thống của dân tộc Khmer. Nếu\r\ncó dịp về Trà Vinh, Sóc Trăng, An Giang trước mùa gặt, bạn hãy thưởng thức cốm\r\ndẹp để biết thêm hương vị cốm mới của người Khmer. Nếu\r\nở Hà Nội nổi tiếng với cốm làng Vòng thì người Khmer ở Trà Vinh, Sóc Trăng, An\r\nGiang cũng có món cốm dẹp mời khách phương xa. Lúa nếp trước khi thu hoạch khoảng\r\n10 ngày còn chưa già sẽ được gặt về. Tuốt lấy hạt ngâm nước nửa ngày rồi vớt ra\r\nđể ráo. Nếp không ngâm quá lâu sẽ làm cốm nhão, ngâm thời gian ngắn thì hạt nếp\r\nsẽ khô cứng.<o:p></o:p></p>', 2, '2024-05-04 21:57:09', '2024-05-04 21:57:09'),
(17, 'Cháo Ám', '15.000 - 20.000', NULL, '<p class=\"MsoNormal\">Nói về\r\ncháo thì ẩm thực Việt Nam đã rất phong phú với cháo lòng, cháo hàu,… nhưng có lẽ\r\ncháo ám là món ăn mà nhiều người lần đầu nghe qua. Đây là món ngon ở Trà Vinh\r\nđược người dân địa phương và các tỉnh lân cận rất yêu thích. Thực ra, cháo ám\r\nlà món cháo cá lóc – món ăn khá quen thuộc với người Sài Gòn và các tỉnh Nam Bộ.\r\nTuy nhiên ở Trà Vinh, món cháo này lại có cái tên đặc biệt là cháo ám. Nhiều\r\nngười địa phương kể lại rằng, tên gọi thú vị kia là do món ăn này có cách chế\r\nbiến cầu kỳ, công phu mới ngon, mới hấp dẫn. Với những cô gái ngày đầu về nhà\r\nchồng còn bỡ ngỡ mà phải nấu cháo này thì quả thực là điều ám ảnh. Có lẽ vì thế\r\nmà cháo cá lóc được gọi tên cháo ám như một cách “nhắc khéo” đến tài nấu ăn của\r\nngười nội tướng trong mỗi gia đình. Món cháo cá lóc\r\nnày vốn dĩ không có quá nhiều bước chế biến. Nhưng để nấu được một nồi cháo\r\nngon, đòi hỏi người nấu phải có kinh nghiệm trong việc chọn gạo, chọn cá và cả\r\ncách kết hợp những gia vị, tạo nên được vị ngọt thanh đặc trưng chỉ có ở món\r\nngon Trà Vinh này mà thôi.&nbsp;<o:p></o:p></p>', 1, '2024-05-04 21:58:09', '2024-05-04 21:58:09'),
(18, 'Chôm Chôm', '20000 - 30000', 'kg', '<p class=\"MsoNormal\">Chôm chôm là loài cây thường xanh có thể\r\nphát triển đến chiều cao 12–20 m. Các lá mọc so le với nhau, dài 10–30 cm, lá\r\ncó hình lông chim với 3 đến 11 lá rời. Những bông hoa có kích thước nhỏ 2,5–5\r\nmm. Cây chôm chôm có thể là cây đực (chỉ sản sinh túi phấn hoa do đó không đậu\r\nquả) hoặc cây cái (chỉ có hoa với chức năng giống cái) hoặc lưỡng tính (sản xuất\r\nhoa cái với một tỷ lệ nhỏ hoa đực). Quả hình tròn hoặc\r\nhình bầu dục, dài 3–6 cm (hiếm khi đến 8 cm) và rộng 3–4 cm, quả được kết và lớn\r\ndần trong một chùm có 10–20 quả. Vỏ có màu hơi đỏ (hiếm khi có màu cam hoặc\r\nvàng) và được bao phủ bởi các gai thịt mềm dẻo, do đó có tên \'lông\'. Các gai thịt\r\ngóp phần vào quá trình thoát hơi nước của quả, có thể ảnh hưởng đến chất lượng\r\ncủa quả. Phần thịt quả là vỏ mềm bao bọc hạt, trong mờ,\r\nhơi trắng hoặc hồng nhạt, có vị ngọt, chua nhẹ.Hạt đơn dài 1–1,3 cm, có vết nứt\r\nđôi màu trắng ở đáy hạt. Hạt mềm và chứa các phần chất béo bão hòa và không bão\r\nhòa bằng nhau,[10] hạt có thể được nấu chín và ăn. Quả đã bốc vỏ có thể dùng để\r\năn sống hoặc nấu chín.<o:p></o:p></p>', 3, '2024-05-04 21:59:35', '2024-05-04 21:59:35'),
(19, 'Bánh Tráng Trà Vinh', '6.000', 'cái', '<p class=\"MsoNormal\">Chắc\r\nhẳn nhiều người đã quá quen thuộc với các món ăn được chế biến kết hợp với bánh\r\ntráng bởi ở bất cứ đâu món bánh này đều được ưa chuộng. Bánh Tráng Trà Vinh có\r\nnguồn góc từ làng nghề làm bánh nổi tiếng ở xóm Trà Vi với hơn 70 hộ gia đình sống\r\nbằng nghề làm bánh tráng. Bánh Tráng Trà Vi chủ yếu\r\nlàm bằng gạo trắng, bánh được làm theo phương pháp thủ công nên có màu hơi ngà,\r\nmỏng, ngon, dẻo. Bánh tráng Trà Vi có mặt trong bữa ăn của người dân Trà Vinh\r\nvà các tỉnh thành khác, không những thế bánh tráng còn có mặt khắp các nhà\r\nhàng, quán ăn lớn ở trên toàn lãnh thổ Việt Nam. Bánh\r\nTráng có thể chế biến thành nhiều món ăn như: bánh tráng cuốn thịt heo, bánh\r\ntráng nướng, bánh tráng trộn,...bảo đảm chỉ cần thưởng thức một lần là bạn có\r\nthể nhớ ngay đến hương vị của từng món bánh tráng.<o:p></o:p></p>', 2, '2024-05-04 22:01:03', '2024-05-04 22:01:03'),
(20, 'Bánh Mì', '10.000 - 15.000', 'ổ', '<p class=\"MsoNormal\">Không còn bàn cãi gì thêm, bánh mì chính là một trong những \"món\r\năn quốc dân\" của người Việt Nam chúng ta từ rất lâu vì chứa đầy đủ chất\r\ndinh dưỡng lại rất dễ ăn. Tuỳ mỗi vùng miền khác nhau lại có những phiên bản\r\nbánh mì khác nhau, không ít trong số đó khiến người xứ khác ngạc\r\nnhiên.&nbsp;<o:p></o:p></p>', 1, '2024-05-04 22:02:25', '2024-05-04 22:02:25'),
(21, 'Bánh Xèo', '20.000 - 30.000', NULL, '<p class=\"MsoNormal\">Hương vị\r\ndân dã, đậm chất quê hương, bánh to ráo dầu và có màu vàng rất dễ chịu. Vỏ bánh\r\ngiòn rụm thơm ngon, nhiều nhân. Bánh ăn cùng đĩa rau to, xanh mướt mơn mởn nhìn\r\nthật thích mắt. Bánh của quán có hương vị beo béo của nước dừa vị bùi bùi của đậu\r\ncùng vị giòn ngọt của những giá. Cùng với nước mắm chua ngọt cộng thêm rau sống\r\ncác loại đã tạo nên cho món bánh một hương vị khác biệt. Bánh\r\nxèo được làm từ bột gạo loại ngon, đổ thật mỏng trong chảo nhôm, đốt trên lò củi\r\nvới nhân là giá đỗ, thịt và tôm. Bánh chiên vàng ươm được mang ra nóng hổi, chấm\r\nvới nước mắm chua ngọt được pha theo công thức đặc biệt của quán hấp dẫn du\r\nkhách ngay từ miếng đầu tiên.<o:p></o:p></p>', 1, '2024-05-04 22:03:31', '2024-05-04 22:03:31'),
(22, 'Loi Choi Sả Ớt', '100.000 - 150.000', 'phần', '<p class=\"MsoNormal\">Món ăn với cái tên độc lạ, loi choi thường sinh sống tại vùng đất bùn\r\nven sông hoặc bãi bồi, đất mới nổi. Chúng thường có hình dáng thẳng và dài khoảng\r\nhơn 20cm, thân tròn, màu trắng. Sau khi loi choi được bắt lên sẽ đem đi phơi\r\nkhô, nướng sơ qua lửa than để có độ giòn, vị bùi và thơm phức hấp dẫn.<o:p></o:p></p>', 4, '2024-05-04 22:04:32', '2024-05-04 22:04:32'),
(23, 'Cháo Cá Khoai', '20.000 - 25.000', 'phần', '<p class=\"MsoNormal\">Cháo cá khoai với hương vị ngọt thơm của thịt cá, kết hợp với cháo mềm\r\nkhiến cho món ăn trở nên hấp dẫn hơn bao giờ hết. Để cháo ngon hơn, bạn có thể\r\năn kèm với rau mồng tơi, giá hoặc một số rau tùy thích của mỗi người.<o:p></o:p></p>', 1, '2024-05-04 22:05:23', '2024-05-04 22:05:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `id` int UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_food` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`id`, `image`, `id_food`, `created_at`, `updated_at`) VALUES
(21, 'banhcanh.jpg', 3, NULL, NULL),
(22, '1714886611.jpg', 15, '2024-05-04 22:23:31', '2024-05-04 22:23:31'),
(23, '1714886708.jpg', 1, '2024-05-04 22:25:08', '2024-05-04 22:25:08'),
(24, '1714886735.jpg', 14, '2024-05-04 22:25:35', '2024-05-04 22:25:35'),
(25, '1714886760.jpg', 12, '2024-05-04 22:26:00', '2024-05-04 22:26:00'),
(26, '1714886779.jpg', 2, '2024-05-04 22:26:19', '2024-05-04 22:26:19'),
(27, '1714887115.jpg', 7, '2024-05-04 22:31:55', '2024-05-04 22:31:55'),
(28, '1714887134.jpg', 13, '2024-05-04 22:32:14', '2024-05-04 22:32:14'),
(29, '1714887160.jpg', 11, '2024-05-04 22:32:40', '2024-05-04 22:32:40'),
(30, '1714887189.jpg', 10, '2024-05-04 22:33:09', '2024-05-04 22:33:09'),
(31, '1714887416.jpg', 8, '2024-05-04 22:36:56', '2024-05-04 22:36:56'),
(32, '1714887450.jpg', 6, '2024-05-04 22:37:30', '2024-05-04 22:37:30'),
(33, '1714887472.jpg', 9, '2024-05-04 22:37:52', '2024-05-04 22:37:52'),
(34, '1714887492.jpg', 16, '2024-05-04 22:38:12', '2024-05-04 22:38:12'),
(35, '1714887524.jpg', 17, '2024-05-04 22:38:44', '2024-05-04 22:38:44'),
(36, '1714887570.jpg', 18, '2024-05-04 22:39:30', '2024-05-04 22:39:30'),
(37, '1714887592.jpg', 19, '2024-05-04 22:39:52', '2024-05-04 22:39:52'),
(38, '1714887609.jpg', 20, '2024-05-04 22:40:09', '2024-05-04 22:40:09'),
(39, '1714887805.jpg', 21, '2024-05-04 22:43:25', '2024-05-04 22:43:25'),
(40, '1714887837.jpg', 22, '2024-05-04 22:43:57', '2024-05-04 22:43:57'),
(41, '1714887858.jpg', 23, '2024-05-04 22:44:18', '2024-05-04 22:44:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_food` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`, `id_food`, `created_at`, `updated_at`) VALUES
(1, 'Cá lóc đồng', 1, '2024-05-04 22:47:55', '2024-05-04 22:47:55'),
(2, 'Mắm bò hóc', 1, '2024-05-04 22:48:18', '2024-05-04 22:48:18'),
(3, 'Sả cây', 1, '2024-05-04 22:48:33', '2024-05-04 22:48:33'),
(4, 'Bắp chuối', 1, '2024-05-04 22:48:44', '2024-05-04 22:48:44'),
(5, 'Thịt ba chỉ', 8, '2024-05-04 22:49:36', '2024-05-04 22:49:36'),
(6, 'Củ cải trắng', 8, '2024-05-04 22:50:46', '2024-05-04 22:50:46'),
(7, 'Giò heo', 8, '2024-05-04 22:51:01', '2024-05-04 22:51:01'),
(8, 'Tôm sú', 8, '2024-05-04 22:51:11', '2024-05-04 22:51:11'),
(9, 'Bánh canh làm từ bột gạo', 3, '2024-05-04 22:51:43', '2024-05-04 22:51:43'),
(10, 'Xương heo', 3, '2024-05-04 22:52:01', '2024-05-04 22:52:01'),
(11, 'Lòng heo (tim, gan, cật, ...)', 3, '2024-05-04 22:52:19', '2024-05-04 22:52:19'),
(12, 'Nếp sáp', 6, '2024-05-04 22:52:46', '2024-05-04 22:52:46'),
(13, 'Thịt nạc, mỡ heo', 6, '2024-05-04 22:53:15', '2024-05-04 22:53:15'),
(14, 'Lòng đỏ trứng vịt muối', 6, '2024-05-04 22:53:39', '2024-05-04 22:53:39'),
(15, 'Gạo nếp', 15, '2024-05-04 22:54:12', '2024-05-04 22:54:12'),
(16, 'Đậu xanh đãi vỏ', 15, '2024-05-04 22:54:30', '2024-05-04 22:54:30'),
(17, 'Vỏ bông gòn', 15, '2024-05-04 22:54:50', '2024-05-04 22:54:50'),
(18, 'Con chù ụ', 2, '2024-05-04 22:55:18', '2024-05-04 22:55:18'),
(19, 'Nước cốt me', 2, '2024-05-04 22:55:30', '2024-05-04 22:55:30'),
(20, 'Cá lóc', 17, '2024-05-04 22:56:06', '2024-05-04 22:56:06'),
(21, 'Rau đắng', 17, '2024-05-04 22:56:20', '2024-05-04 22:56:20'),
(22, 'Gạo rang', 17, '2024-05-04 22:56:57', '2024-05-04 22:56:57'),
(23, 'Cốm dẹp', 16, '2024-05-04 22:57:26', '2024-05-04 22:57:26'),
(24, 'Nước cốt dừa', 16, '2024-05-04 22:57:57', '2024-05-04 22:57:57'),
(25, 'Dừa khô', 16, '2024-05-04 22:58:11', '2024-05-04 22:58:11'),
(26, 'Gạo trắng', 19, '2024-05-04 22:59:27', '2024-05-04 22:59:27'),
(27, 'Bột mì', 20, '2024-05-04 23:02:42', '2024-05-04 23:02:42'),
(28, 'Men nở', 20, '2024-05-04 23:02:54', '2024-05-04 23:02:54'),
(29, 'Sữa tươi', 20, '2024-05-04 23:03:18', '2024-05-04 23:03:18'),
(30, 'Giấm', 20, '2024-05-04 23:03:28', '2024-05-04 23:03:28'),
(31, 'Bột bánh xèo cốt dừa', 21, '2024-05-04 23:03:55', '2024-05-04 23:03:55'),
(32, 'Tôm', 21, '2024-05-04 23:04:11', '2024-05-04 23:04:11'),
(33, 'Hành lá', 21, '2024-05-04 23:04:23', '2024-05-04 23:04:23'),
(34, 'Thịt heo', 21, '2024-05-04 23:04:33', '2024-05-04 23:04:33'),
(35, 'Giá', 21, '2024-05-04 23:04:41', '2024-05-04 23:04:41'),
(36, 'Cá loi choi', 22, '2024-05-04 23:07:17', '2024-05-04 23:07:17'),
(37, 'Sả', 22, '2024-05-04 23:07:34', '2024-05-04 23:07:34'),
(38, 'Ớt', 22, '2024-05-04 23:07:43', '2024-05-04 23:07:43'),
(39, 'Gạo tẻ', 23, '2024-05-04 23:08:05', '2024-05-04 23:08:05'),
(40, 'Cá khoai', 23, '2024-05-04 23:08:17', '2024-05-04 23:08:17'),
(41, 'Rau đắng', 23, '2024-05-04 23:08:33', '2024-05-04 23:08:33'),
(42, 'Nấm rơm', 23, '2024-05-04 23:08:53', '2024-05-04 23:08:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_04_16_004054_create_danh_muc_mon_an_table', 1),
(3, '2024_04_16_004324_create_mon_an_table', 1),
(4, '2024_04_16_010428_create_hinh_anh_table', 1),
(5, '2024_04_16_011733_create_nguyen_lieu_table', 1),
(6, '2024_04_16_012105_create_diem_phuc_vu_table', 1),
(7, '2024_05_01_160814_create_users_table', 1),
(8, '2024_11_04_082246_add_remember_token_to_users_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service_point`
--

CREATE TABLE `service_point` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_time` time NOT NULL,
  `close_time` time NOT NULL,
  `id_food` int UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `service_point`
--

INSERT INTO `service_point` (`id`, `name`, `description`, `address`, `open_time`, `close_time`, `id_food`, `image`, `phone`, `created_at`, `updated_at`) VALUES
(21, 'Quán Cây Sung', 'Quán Cây Sung - Bún Nước Lèo là một địa điểm được sắp xếp trong danh mục Món Ăn và Quán Cây Sung - Bún Nước Lèo nằm ở địa chỉ 676, Võ Nguyên Giáp, Phường 8, Trà Vinh. Ngoài ra bạn cũng có thể tìm kiếm thông tin của doanh nghiệp trong khu vực từ các liên kết. Đây là một trang web rất hữu ích giúp bạn tìm kiếm thông tin chi tiết của một địa điểm và chỉ dẫn đường đi đến Quán Cây Sung - Bún Nước Lèo.', '676 Võ Nguyên Giáp, Phường 8, Trà Vinh.', '07:00:00', '19:00:00', 1, 'caysung.jpg', NULL, '2024-05-04 23:20:30', '2024-05-04 23:20:30'),
(22, 'Quán Ngọc Tiền', 'Quán Ăn Ngọc Tiền là một địa điểm được sắp xếp trong danh mục quán ăn gia đình Ngọc Tiền nằm ở địa chỉ Trà Cú. Ngoài ra bạn cũng có thể tìm kiếm thông tin của doanh nghiệp trong khu vực từ các liên kết. Đây là một trang web rất hữu ích giúp bạn tìm kiếm thông tin chi tiết của một địa điểm và chỉ dẫn đường đi đến quán ăn gia đình Ngọc Tiền.\', \'08:00:00\', 2, \'22:20:00\', \'ngoctien.jpg\', \'\')', 'Hàm Tân, Trà Cú, Trà Vinh', '08:00:00', '22:20:00', 2, 'ngoctien.jpg', NULL, '2024-05-04 23:27:01', '2024-05-04 23:27:01'),
(23, 'Út Hảo', 'Đến với Trà Vinh thì chắc chắn bạn sẽ nghe nhắc ngay đến món bánh canh Bến Có, một trong những món ăn đặc sản tạo nên thương hiệu của vùng đất tỉnh Trà Vinh. Bánh được làm từ bột gạo, màu trắng, thơm mùi dịu và ăn rất dai, nước lèo ngọt thanh. Khi ăn, trong tô bánh canh còn có nhiều thứ hấp dẫn như lòng, ruột, tim heo, giò heo và một ít rau thơm. Bánh Canh Bến Có Út Hảo là một trong những quán được yêu thích nhất của thực khách khi đến với Trà Vinh. Hương vị nước lèo nấu từ thịt heo đậm đà. Sợi bánh canh được làm nguyên chất từ bột gạo, nhờ đó mà có được độ dai mềm, vị bùi, mùi thơm của gạo. Nước lèo nhìn trong vắt nhưng có vị thanh ngọt từ xương heo. Ngoài ra, đội ngũ nhân viên nhiệt tình, tận tâm và chu đáo sẽ mang đến cho thực khách những giây phút thư giãn tuyệt vời và hoàn toàn hài lòng về Bánh Canh Bến Có Út Hảo. Quán có không gian rộng rãi, luôn tấp nập khách ra vào, không chỉ khách địa phương mà còn du khách tỉnh khác lẫn nước ngoài. Quán còn bán thêm bánh tết Trà Cuôn ngon nức tiếng của đất Trà Vinh.', 'QL53, Nguyệt Hoá, Châu Thành, Trà Vinh', '06:00:00', '18:00:00', 3, 'uthao.jpg', '0972652653', '2024-05-04 23:31:50', '2024-05-04 23:35:08'),
(24, 'Bún suông Hùi Yến', 'Muốn thưởng thức thêm món bún Suông đậm vị Trà Vinh thì bạn hãy ghé ngay đến quán Bún Suông Hùi Yến - Đặc Sản Trà Vinh. Bún, tôm và thịt ba chỉ là thành phần chủ yếu của bún suông khiến thực khách ăn hoài không chán. Những miếng chả dài được nặn từ con tôm mà là tôm tươi, mập, trông rất ngon cùng vài lát thịt ba chỉ luộc kèm giá trụng, rau xà lách và bắp cải trắng bào sợi. Tương xay và ớt xay là hỗn hợp nước chấm rất ngon khi ăn bún suông.', '56 Hùng Vương, Phường 3, Trà Vinh', '06:00:00', '20:03:00', 8, 'huiyen.jpg', '0907861571', '2024-05-04 23:34:12', '2024-05-04 23:34:12'),
(25, 'Dừa sáp Duy Nhất', 'Trái dừa Sáp, cơ bản phân thành 05 loại: trái tròn, trái dài, trái có cạnh, trái vỏ xanh và trái vỏ vàng. Nếu chỉ nhìn hình dạng và màu sắc bên ngoài của trái thì cũng sẽ không phân biệt được dừa Sáp và dừa thường. Cách duy nhất để nhận dạng trái dừa đặc ruột là lắc trái dừa khi gặp. Tại đây, người mua có thể được hướng dẫn và chọn mua đúng theo ý muốn.', 'Ấp Vĩnh Trường, Châu Thành, Trà Vinh.', '06:00:00', '23:00:00', 7, 'duynhat.jpg', '0915569152', '2024-05-04 23:39:13', '2024-05-04 23:39:13'),
(26, 'Dừa sáp Thi Thi', 'Chuyên cung cấp sỉ và lẻ Dừa Sáp và Mứt Dừa Sáp trên toàn quốc\" Dừa sáp được chia ra 3 loại chính: - Dừa sáp loại 1 (Sáp đặc) - Dừa sáp loại 2 (Sáp lỡ) - Dừa sáp loại 3 (Sáp lỏng) Mứt dừa sáp bên Shop có 2 vị: Vị lá Cẩm và vị lá Dứa. Mứt được chia ra làm 3 loại: - Mứt dừa sáp loại 1: Mứt dài - Mứt dừa sáp loại 2: Mứt ngắn - Mứt dừa sáp loại 3: Mứt vụng Mứt loại 1, mứt loại 2 và mứt loại 3 chất lượng như nhau, chỉ khác nhau về độ dài. Hiện tại shop luôn tuyển sỉ, CTV, đại lý và nhà phân phối trên toàn quốc.', 'Số 171 Quốc lộ 60, khóm 3, Trà Vinh', '06:00:00', '23:00:00', 7, 'thithi.jpg', '0393551575', '2024-05-04 23:41:27', '2024-05-04 23:41:27'),
(27, 'Dì Hai Khâm', 'Do nguồn tếp tự nhiên (nguyên liệu làm tôm khô) ngày càng ít (môi trường ô nhiễm, điều kiện sinh thái thay đổi) nên số hộ làm tôm khô ngày càng ít đi. Hiện xã Vinh Kim chỉ còn vài hộ làm từ 30-40kg tôm khô/ngày (10kg tếp tươi làm ra được 1kg tôm khô). Sản phẩm làm ra không đủ bán, vì vậy khách muốn mua thường phải đặt hàng trước. Tôm khô đỏ hồng Vinh Kim được bán với giá khá cao. Cụ thể, mỗi kg tôm khô có giá 1,3 triệu đồng đối với loại 1, 1 triệu đồng đối với loại 2 và 800.000 đồng đối với loại 3.', 'Ấp Chà Và, xã Vinh Kim, huyện Cầu Ngang, tỉnh Trà Vinh', '06:00:00', '23:00:00', 9, 'diahai.jpg', '02943827097', '2024-05-04 23:44:09', '2024-05-04 23:44:09'),
(28, 'CSSX Hai Lý', 'Bánh tết Trà Cuôn Hai Lý là cơ sở nấu bánh tết lâu đời nhất tại Trà Cuôn, khách hàng có thể an tâm khi lựa chọn bánh tết cơ sở chúng tôi nấu với đảm bảo: Nguyên liệu hoàn toàn tự nhiên không sử dụng phẩm màu thay thế như các cơ sở khác, chúng tôi dùng hoàn toàn bằng Nước Lá Bồ Ngót kết hợp với Lá Dứa tạo cho Bánh Tết của chúng tôi thơm ngon hơn và có mùi nếp đặc trưng so với các cơ sở khác.', '72/4 đường Phạm Ngũ Lão, phường 1, Trà Vinh', '06:00:00', '22:00:00', 6, 'haily.jpg', '0913826002', '2024-05-04 23:46:45', '2024-05-04 23:46:45'),
(29, 'Long Vinh', 'Nước mắm rươi Long Vinh là đặc sản Trà Vinh tuy không ồn ào như nước mắm nhĩ cá cơm, Trà Vinh có nước mắm Rươi là loại thủy sản sạch, thường được chế biến làm chả, kho, nay được làm nước mắm. Nghe có vẻ lạ tai nhưng đây là đặc sản của Trà Vinh. Với hương vị đằm thắm, dịu nhẹ, hậu ngọt, không mặn như loại nước mắm cá cơm, nước mắm Rươi Long Vinh khiến thực khách sảng điệu nếm qua một lần thì sẽ nhớ mãi.', 'Phường 1, TX, Duyên Hải, Trà Vinh', '06:00:00', '19:00:00', 11, 'longvinh.jpg', '0974288781', '2024-05-04 23:48:49', '2024-05-04 23:48:49'),
(30, 'Đặc sản Việt', 'ĐẶC SẢN VIỆT ra đời từ ý tưởng đem lại một địa chỉ cung cấp những đặc sản uy tín, chất lượng, đúng phong vị đặc trưng từ quê nhà của bạn. Có nhiều đặc sản nổi tiếng, gắn liền với địa danh vùng miền. Đặc sản được làm từ những nhà sản xuất, những nghệ nhân ẩm thực tên tuổi, chất lượng và hương vị đã được nhiều người khen ngon. Các đặc sản được làm từ nguyên liệu tự nhiên, vị ngon đậm đà, quy trình chế biến đảm bảo ATVSTP. Đóng gói với bao bì đạt tiêu chuẩn đi nước ngoài, có nhãn mác, thương hiệu, xuất xứ rõ ràng.', '97 Lê Quốc Hưng, P.12, Q.4, Tp.HCM', '07:00:00', '21:00:00', 10, 'viet.jpg', '0909190875', '2024-05-04 23:52:05', '2024-05-04 23:52:05'),
(31, 'Diễm Châu', 'Chuyên bán các loại trái cây, đặc biệt là món trái cây đặc sản của tỉnh là chuối tà quạ khổng lồ. Đến đây thực khách có thể chọn mua được những loại trái cây vừa ngon và giá cả còn hợp lý.', 'Lê Lợi, Phường 1, Trà Vinh', '06:00:00', '22:00:00', 12, 'mitchuoi.jpg', '0933716911', '2024-05-04 23:55:40', '2024-05-04 23:55:40'),
(32, 'Chả hoa Năm Thụy', 'Trà Vinh lâu nay nổi tiếng với món chả hoa, chả lụa nhưng đa phần làm theo phương pháp thủ công nên số lượng ít và khó kiểm soát vệ sinh an toàn thực phẩm. Trước thực trạng đó, Nguyễn Trường Chinh – ông chủ của Chả hoa Năm Thụy đã quyết định đầu tư công nghệ hiện đại với tham vọng nâng cao chất lượng, đưa sản phẩm đặc sản quê hương tiếp cận thị trường rộng lớn trong và ngoài nước.', 'Số 44 Phạm Thái Bường, Phường 3, thành phố Trà Vinh', '06:00:00', '21:00:00', 13, 'namthuy.jpg', '0918758358', '2024-05-04 23:58:04', '2024-05-04 23:58:04'),
(33, 'Cô Hường 2', 'Chuyên bán các loại bánh tét bánh ú nổi tiếng đặc sản của tỉnh Trà Vinh, luôn hoàn thiện chất lượng, mẫu mã, bao bì và luôn đặt tâm quyết phục vụ tốt nhất cho khách hàng.', 'Số 37, ấp Hương Phụ A, Đa Lộc, Châu Thành, Trà Vinh', '05:00:00', '20:00:00', 6, 'cohuong2.jpg', '0977441767', '2024-05-05 00:01:42', '2024-05-05 00:01:42'),
(34, 'Quán Vân Anh', 'Chuyên phục vụ món cháo ấm được nấu từ nguyên liệu chính là cá lóc theo phương pháp chế biến đặc trưng mang đậm dấu ấn Trà Vinh. Chế biến từ những con cá lóc tươi sống đem đi nấu cháo trải qua các công đoạn đơn giản nhưng lại mang đậm vị ngọt từ thịt cá.', 'Thạch Thị Thanh, Trà Vinh', '08:00:00', '21:00:00', 17, 'vananh.jpg', '0354053182', '2024-05-05 00:03:54', '2024-05-05 00:03:54'),
(35, 'CSSX Hùng Tuyền', 'Chuyên bán món cốm dẹp độc đáo, người dùng có thể mua về và tự chế biến tùy theo sở thích của mình. Được làm từ loại nếp vừa đỏ đuôi, chưa chín rộ, hạt còn mềm, đem giã bằng cối bồng. Cốm dẹp thường được làm vào khoảng tháng 10 hoặc 11, là thời điểm người dân làng mừng mùa vụ mới.', 'Số 2 Lý Tự Trọng, phường 1, TP. Trà Vinh, T. Trà Vinh', '07:00:00', '21:00:00', 16, 'hungtuyen.jpg', '0969411663', '2024-05-05 00:06:03', '2024-05-05 00:06:03'),
(36, 'Cù lao Tân Quy', 'Tại đây có các vườn trồng trái cây đặc biệt là chôm chôm, du khách có thể chọn mua tại vườn theo ý muốn. Du khách cũng có thể trải nghiệm, tham quan vườn trái cây, tại đây cũng có trồng các loại trái cây khác cũng không kém phần đặc biệt.', 'Cù lao Tân Quy, An Phú Tân, Cầu Kè, Trà Vinh', '06:00:00', '21:00:00', 18, 'culao.jpg', NULL, '2024-05-05 00:07:46', '2024-05-05 00:07:46'),
(37, 'Bún nước lèo Cô Ba', 'Lần đầu tiên đặc sản bún nước lèo Trà Vinh được đưa vào không gian sang trọng, rộng rãi, thoáng mát, an toàn vệ sinh thực phẩm!\". Kính mời du khách đến thưởng thức tại quán Bún Nước Lèo Cô Ba trên đường Mười Chín Tháng Năm, Phường 1, thành phố Trà Vinh. Bún nước lèo Trà Vinh là một món ăn dân dã của địa phương, với hương vị đặc biệt.', 'Đường Mười Chín Tháng Năm, Phường 1, Trà Vinh', '06:30:00', '19:30:00', 1, 'coba.jpg', '0898333398', '2024-05-05 00:09:24', '2024-05-05 00:09:24'),
(38, 'Bánh tráng Thi', 'Chuyên bán các loại bánh tráng, món ăn vặt ở Trà Vinh bao gồm cả món bánh tráng Trà Vi nổi tiếng gần xa. Bánh tráng Trà Vi cũng được dùng để chế biến thành các món ăn vặt khác góp phần tăng thêm hương vị, kích thích vị giác.', '163 Nguyễn Thị Minh Khai, Phường 7, Trà Vinh', '07:00:00', '22:00:00', 19, 'thienhuynh.jpg', '0925590189', '2024-05-05 00:11:26', '2024-05-05 00:11:26'),
(39, 'Nguyên Minh Trí', 'Chuyên bán tất cả các loại bánh mì, với đa dạng hình dạng, kích thước, hương vị. Giúp cho người mua có thể có thêm sự lựa chọn, phù hợp với khẩu vị và sở thích của mỗi cá nhân.', 'Hoà Lợi, Châu Thành, Trà Vinh', '06:00:00', '23:00:00', 20, 'minhtri.jpg', '0967005013', '2024-05-05 00:12:59', '2024-05-05 00:12:59'),
(40, 'Cháo cá 64', 'Cháo cá khoai Trà Vinh là một món ăn giàu dinh dưỡng với các thành phần chính như cá, gạo nếp và rau củ. Cá là nguồn cung cấp protein và axit béo omega-3, giúp tăng cường sức khỏe tim mạch và hệ miễn dịch. Gạo nếp cũng là nguồn cung cấp carbohydrate và chất xơ, giúp duy trì năng lượng và hỗ trợ tiêu hóa. Rau củ cung cấp nhiều vitamin và khoáng chất, giúp cân bằng dinh dưỡng và tăng cường sức đề kháng.', '64 Điện Biên Phủ, Phường 6, Trà Vinh', '06:00:00', '18:00:00', 23, '64.jpg', NULL, '2024-05-05 00:58:50', '2024-05-05 00:58:50'),
(41, 'Ẩm thực Sao Biển', 'Nhà hàng có không gian thoáng mát, rộng rãi chuyên phục vụ các món ăn được chế biến đa dạng đáp ứng nhu cầu thưởng thức ẩm thực của mỗi thực khách. Tại đây thực khách có thể có cơ hội thưởng thức các món ăn đặc trưng nổi tiếng được chế biến một cách độc đáo và mang hương vị đặc biệt.', 'Trường Long Hoà, Duyên Hải, Trà Vinh', '06:00:00', '23:00:00', 22, 'saobien.png', '0947433666', '2024-05-05 01:01:31', '2024-05-05 01:01:31'),
(42, 'Long Bình 2', 'Được xem như một trong những món ăn đặc sản miền Tây Nam Bộ nói riêng, cũng như đặc sản ẩm thực Việt Nam nói chung, món bánh xèo từ lâu đã nhận được sự ưa chuộng, yêu thích từ thực khách mọi miền trên đất nước, cũng như bạn bè quốc tế.', 'Mậu Thân, Phường 6, Trà Vinh', '09:00:00', '21:00:00', 21, 'longbinh.jpg', '0939946116', '2024-05-05 01:03:19', '2024-05-05 01:03:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `google_id`, `password`, `email`, `address`, `role`, `created_at`, `updated_at`, `remember_token`) VALUES
(2, 'user2', NULL, '$2y$10$Lv6dchFcyrFyGQ/l2BjyZukxIyGESic4KGiOwNqf6Z8QfqRq2/1xm', 'user2@example.com', 'Địa chỉ 2', 0, NULL, NULL, NULL),
(3, 'Võ Thị Diểm', NULL, '$2y$10$KsP1/LYJ.B4cTW2GL1sU5.w1aX7fmn0YH.ntBdZBkfNZUN3V13f.6', 'vodiem3002@gmail.com', NULL, 1, '2024-11-03 20:10:35', '2024-11-03 20:10:35', 'XwNoeAhCIIPWbYrPUtOtwiqKCVZeUlDv4BpY0CNI9lIJg6ttVSXF3ygQmtow'),
(4, 'Võ Diểm', NULL, '$2y$10$p2qCIuhMUFUqGU3sjoT1OOZEkZRxhNj2mD9qX774J1Lr/OhhYbiq.', 'vodiem3979@gmail.com', NULL, 0, '2024-11-03 20:15:41', '2024-11-03 20:15:41', 'rwkWcUKjcrxLCgP2G18ncu1sSQ1DVYj5ZIHXlO66m2a2Y2OLIFszaKgy6zcz'),
(5, 'chinchin', NULL, '$2y$10$zXycUwHyLObk5OVohcsnzeKG27s4vB1ql5KF8XnoquJo1S1ZUQ4.e', 'vodiem2003@gmail.com', NULL, 0, '2024-11-04 06:58:31', '2024-11-04 06:58:31', NULL),
(6, 'chinchin', NULL, '$2y$10$/pfWYktEQg9zrBf7RaY8Z.AAgfxlotn/K5QYND0eZz8n1E.IZYu0y', 'chinchin@gmail.com', NULL, 0, '2024-11-04 07:00:15', '2024-11-04 07:00:15', NULL),
(7, 'min', NULL, '$2y$10$pmfAo5ChJMwiEv5FfIYw0u6Qoi3ZCwPvTtoh.gadXXXMU7bDczPmy', 'a@gmail.com', NULL, 0, '2024-11-04 07:04:07', '2024-11-04 07:04:07', NULL),
(8, 'b', NULL, '$2y$10$ATxkN.JImyx/yi5kgRmmi.sdZEGb3L8Z1F2Bdy6ZXjDYdQujbhoKK', 'b@gmail.com', NULL, 0, '2024-11-04 07:05:10', '2024-11-04 07:05:10', NULL),
(9, 'd', NULL, '$2y$10$SJcmChRMvVG9tMFjlTAM1.nH8dvQ5dX86sRdEIkRCbYO1o6pQonES', 'd@gmail.com', NULL, 0, '2024-11-04 07:06:27', '2024-11-04 07:06:27', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_food_id` (`food_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `comment_contact`
--
ALTER TABLE `comment_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_comment_id` (`comment_id`);

--
-- Chỉ mục cho bảng `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id_category_foreign` (`id_category`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_id_food_foreign` (`id_food`);

--
-- Chỉ mục cho bảng `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_id_food_foreign` (`id_food`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `service_point`
--
ALTER TABLE `service_point`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_point_id_food_foreign` (`id_food`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `comment_contact`
--
ALTER TABLE `comment_contact`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `food`
--
ALTER TABLE `food`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `service_point`
--
ALTER TABLE `service_point`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_food_id` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `comment_contact`
--
ALTER TABLE `comment_contact`
  ADD CONSTRAINT `fk_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_id_category_foreign` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_id_food_foreign` FOREIGN KEY (`id_food`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_id_food_foreign` FOREIGN KEY (`id_food`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `service_point`
--
ALTER TABLE `service_point`
  ADD CONSTRAINT `service_point_id_food_foreign` FOREIGN KEY (`id_food`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 16, 2025 at 04:42 AM
-- Server version: 8.0.39
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bird-database`
--

-- --------------------------------------------------------

--
-- Table structure for table `birds`
--

CREATE TABLE `birds` (
  `bird_id` bigint NOT NULL,
  `conservation_status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `diet` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `habitat` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `birds`
--

INSERT INTO `birds` (`bird_id`, `conservation_status`, `created_at`, `description`, `diet`, `habitat`, `image_path`, `name`) VALUES
(2, 'Least Concern', '2025-04-16 00:01:01.418386', 'The bald eagle (Haliaeetus leucocephalus) is a bird of prey found in North America.', 'fish comprised 56% of the diet of nesting eagles, birds 28%, mammals 14% and other prey 2%.', 'American wetland habitat such as seacoasts, rivers, large lakes or marshes or other large bodies of open water with an abundance of fish. ', '/uploads/birds/4267fad9-f25a-4eee-b2c5-7be838c8ce7c_bald-eagle.jpg', 'Bald Eagle'),
(3, 'Near Threatened', '2025-04-16 00:02:26.314380', 'Owls are birds from the order Strigiformes[1] (/ˈstrɪdʒəfɔːrmiːz/), which includes over 200 species of mostly solitary and nocturnal birds of prey.', 'All owls are carnivorous birds of prey and live on diets of insects, small rodents and lagomorphs. Some owls are also specifically adapted to hunt fish.', 'Woodlands', '/uploads/birds/fa95f77e-ff46-4a84-adc9-a1a668c5bb7e_owl.JPG', 'Owl'),
(4, 'Least Concern', '2025-04-16 00:03:31.687273', 'The blue jay (Cyanocitta cristata) is a passerine bird in the family Corvidae, native to eastern North America. It lives in most of the eastern and central United States.', 'Blue jays are omnivorous, but the Audubon Society estimates that 75% of their diet is vegetable matter.', 'The blue jay occurs from southern Canada and throughout the eastern and central United States south to Florida and northeastern Texas.', '/uploads/birds/7d417f9a-242a-4583-9f25-6e02bad7854c_bluejay.jpg', 'Blue Jay'),
(5, 'Vulnerable', '2025-04-16 00:06:43.354009', 'Macaws are a group of New World parrots that are long-tailed and often colorful, in the tribe Arini.', 'Macaws eat a variety of foods including seeds, nuts, fruits, palm fruits, leaves, flowers, and stems.', 'Most species are associated with forests, but others prefer woodland or savannah-like habitats.', '/uploads/birds/8923e2cd-76fd-4389-8c62-b368165bd809_macaw.jpg', 'Macaw'),
(6, 'Near Threatened', '2025-04-16 00:09:27.312919', 'Hummingbirds are birds native to the Americas and comprise the biological family Trochilidae. ', 'All hummingbirds are overwhelmingly nectarivorous.', 'Dozens of hummingbird species live year-round in tropical mountain habitats at high altitudes, such as in the Andes over ranges of 1,500 metres.', '/uploads/birds/18f7a0de-a65a-4836-b76c-2276d1b60e90_hummingbird.jpg', 'Humming Bird'),
(7, 'Least Concern', '2025-04-16 00:12:26.487871', 'The peregrine falcon (Falco peregrinus), also known simply as the peregrine,[3] is a cosmopolitan bird of prey (raptor) in the family Falconidae.', 'The peregrine falcon\'s diet varies greatly and is adapted to available prey in different regions. However, it typically feeds on medium-sized birds ', 'It is often seen around wetland habitats.', '/uploads/birds/e9b72300-9062-47e7-86fc-28d5a5d6368f_peregrine-falcon.webp', 'Peregrine Falcon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `birds`
--
ALTER TABLE `birds`
  ADD PRIMARY KEY (`bird_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `birds`
--
ALTER TABLE `birds`
  MODIFY `bird_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

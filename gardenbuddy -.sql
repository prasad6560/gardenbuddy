-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2025 at 04:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gardenbuddy`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`id`, `email`, `password`) VALUES
(1, 'vineethaberi@gmail.com', '12345678'),
(2, 'admin2@example.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `doubtschat`
--

CREATE TABLE `doubtschat` (
  `id` int(11) NOT NULL,
  `register_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `overall_experience` varchar(255) DEFAULT NULL,
  `user_friendly` varchar(255) DEFAULT NULL,
  `helpful_features` text DEFAULT NULL,
  `tips_accuracy` varchar(255) DEFAULT NULL,
  `recommendation_rating` int(255) DEFAULT NULL,
  `feedback` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `overall_experience`, `user_friendly`, `helpful_features`, `tips_accuracy`, `recommendation_rating`, `feedback`, `created_at`) VALUES
(1, '5', '4', 'UI, Tips', '5', 5, 0, '2025-07-23 06:10:20'),
(2, 'Good', 'Yes', 'Planting Guides', 'Very helpful', 4, 0, '2025-07-23 08:41:01'),
(4, 'Good', 'Yes', 'Planting Guides', 'Very helpful', 4, 0, '2025-07-23 08:42:09'),
(5, 'Excellent', 'Somewhat', 'Watering and care', 'Somewhat helpful', 2, 0, '2025-07-23 08:42:27'),
(6, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:06:49'),
(7, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:21'),
(8, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:22'),
(9, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:22'),
(10, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:23'),
(11, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:23'),
(12, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:23'),
(13, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:23'),
(14, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:23'),
(15, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:24'),
(16, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:24'),
(17, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:24'),
(18, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:24'),
(19, 'Good', 'Yes', 'Watering and care', 'Very helpful', 5, 0, '2025-07-25 08:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'janu', 'janu1@gmail.com', '123', '2025-04-11 09:54:09'),
(2, 'Beri Vinitha', 'berivinitha@gmail.com', '1245', '2025-04-11 10:24:35'),
(3, 'Beri Vinitha', 'vineethaberi@gmail.com', '1234', '2025-04-11 10:25:14'),
(4, 'Beri Vinitha', 'vineethaberi02@gmail.com', '425277', '2025-04-11 10:29:20'),
(5, 'vinitha', 'vinnu@gmail.com', '3638', '2025-04-12 06:23:35'),
(6, 'vineethaberi', 'vinnu16@gmail.com', '45272', '2025-05-02 04:47:39'),
(7, 'vineethaberi', 'vinnu16@gmail.com', '45272', '2025-05-02 04:47:39'),
(8, 'sunny', 'sunny@gmail.com', '526282901', '2025-05-02 04:49:40'),
(9, 'bunny', 'bunny@gmail.com', '17282', '2025-05-02 04:50:12'),
(10, 'John Doe', 'johndoe@example.com', 'secret123', '2025-07-09 05:14:55'),
(11, 'janu3', 'janu12@gmail.com', '1234', '2025-07-09 05:16:55'),
(12, 'janu3', 'janu126@gmail.com', '12345', '2025-07-09 05:18:04'),
(13, 'janu3', 'janu1426@gmail.com', '1234', '2025-07-11 08:44:13'),
(14, 'trisha', 'trisha@gmail.com', '1234', '2025-07-11 09:19:51'),
(15, 'john', 'john@gmail.com', '12345', '2025-07-12 08:55:39'),
(16, 'john', 'john4@gmail.com', '12345', '2025-07-14 02:53:35'),
(17, 'johnb', 'john56@gmail.com', '123', '2025-07-14 06:26:43'),
(18, 'sathya', 'sathya@gmail.com', '123', '2025-07-17 08:08:57'),
(19, 'hari', 'hari@gamil.com', '1234', '2025-07-17 08:17:47'),
(20, 'priya', 'priya@gmail.com', '1234', '2025-07-17 08:46:06'),
(21, 'priy', 'priy@gmail.com', '1111', '2025-07-17 08:50:13'),
(22, 'ali', 'ali@gmail.com', '123', '2025-07-22 04:31:07'),
(23, 'ali', 'ali1@gmail.com', '1234', '2025-07-22 04:45:30'),
(24, 'ali', 'ali3@gmail.com', '12345', '2025-07-22 04:51:09'),
(25, 'prasad', 'prasad@gmail.com', '12345', '2025-07-22 05:07:20'),
(26, 'trisha', 'trisha1@gmail.com', '12345', '2025-07-22 10:10:08'),
(27, 'Trisha', 'trisha56@gmail.com', '123456', '2025-07-22 10:12:26'),
(28, 'priya', 'priya1@gmail.com', '1234', '2025-07-23 03:00:19'),
(29, 'Lakshmi', 'lakshmi@gmail.com', '1234', '2025-07-23 03:00:54'),
(30, 'prasad', 'prasadtirumala96@gmail.com', '12345', '2025-07-25 08:08:07'),
(31, 'prasanna', 'prasanna@gnail.com', '123456', '2025-07-25 08:09:19'),
(32, 'prasad', 'prasad1@gmail.com', '123456', '2025-07-25 08:11:12'),
(33, 'sathya priya', 'priya2@gmail.com', '12345', '2025-07-25 08:27:46'),
(34, 'prasad', 'priya3@gmail.com', '123', '2025-07-25 08:30:06'),
(35, 'somu', 'somu@gmail.com', '123', '2025-07-25 08:31:20');

-- --------------------------------------------------------

--
-- Table structure for table `vegetable`
--

CREATE TABLE `vegetable` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vegetable`
--

INSERT INTO `vegetable` (`id`, `name`, `image_path`, `created_at`) VALUES
(2, 'beetroot', '67f93e51c5781_beetroot.png', '2025-04-11 16:07:45'),
(3, 'brocolli', '67f93e82bf119_brocolli.png', '2025-04-11 16:08:34'),
(4, 'capsicum', '67f93ea0cbfa1_capsicum.png', '2025-04-11 16:09:04'),
(5, 'cauliflower', '67f93eb92b80e_cauliflower.png', '2025-04-11 16:09:29'),
(6, 'celery', '67f93ec8dfdde_celery.png', '2025-04-11 16:09:44'),
(7, 'fenugreek', '67f93efba74b3_fenugreek.png', '2025-04-11 16:10:35'),
(8, 'garlic', '67f93f18a161b_garlic.png', '2025-04-11 16:11:04'),
(9, 'ginger', '67f93f30f156c_ginger.png', '2025-04-11 16:11:28'),
(10, 'green chilly', '67f93f4906238_green chilly.png', '2025-04-11 16:11:53'),
(11, 'ladys finger', '67f93f62042eb_ladys finger.png', '2025-04-11 16:12:18'),
(12, 'lettuce', '67f93f7339174_lettuce.png', '2025-04-11 16:12:35'),
(13, 'mint', '67f93f953ed62_mint.png', '2025-04-11 16:13:09'),
(14, 'spinach', '67f93fb51c424_spinach.png', '2025-04-11 16:13:41'),
(15, 'radish', '67f93fcdded47_radish.png', '2025-04-11 16:14:05'),
(16, 'carrot', '67f93fe5956f5_carrot.png', '2025-04-11 16:14:29'),
(17, 'tomato', '67f940038eef1_tomato.png', '2025-04-11 16:14:59'),
(18, 'cabbage', '67f94029d087e_cabbage.png', '2025-04-11 16:15:37'),
(19, 'cucumber', '67f940403ede8_cucumber.png', '2025-04-11 16:16:00'),
(20, 'potato', '67f9405a7cc64_potato.png', '2025-04-11 16:16:26'),
(21, 'peas', '67f9406bab74f_peas.png', '2025-04-11 16:16:43'),
(22, 'bitter gourd', '67f940aaf130c_bittergaurd.png', '2025-04-11 16:17:46'),
(23, 'beans', '67f940bdcf897_beans.png', '2025-04-11 16:18:05'),
(24, 'brinjal', '67f940cf71336_brinjal.png', '2025-04-11 16:18:23');

-- --------------------------------------------------------

--
-- Table structure for table `vegetabledetails`
--

CREATE TABLE `vegetabledetails` (
  `id` int(11) NOT NULL,
  `vegetable_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `container_image` text NOT NULL,
  `soil_image` text NOT NULL,
  `planting_image` text NOT NULL,
  `container_liters` text NOT NULL,
  `typeofsoil` text NOT NULL,
  `soil_preparation` text NOT NULL,
  `planting` text NOT NULL,
  `watering_schedule` text NOT NULL,
  `nutrients_for_soil` text NOT NULL,
  `disease` text NOT NULL,
  `harvest_time` text NOT NULL,
  `benefits` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vegetabledetails`
--

INSERT INTO `vegetabledetails` (`id`, `vegetable_id`, `name`, `container_image`, `soil_image`, `planting_image`, `container_liters`, `typeofsoil`, `soil_preparation`, `planting`, `watering_schedule`, `nutrients_for_soil`, `disease`, `harvest_time`, `benefits`) VALUES
(1, 1, 'brinjal', 'For growing beetroots at home, a container should be at least 6–8 inches deep with good drainage. This allows the roots to develop properly and prevents waterlogging.', 'Beetroot grows best in loamy, well-draining soil that is loose, fertile, and rich in organic matter. The soil should have a pH between 6.0 and 7.0, which helps prevent nutrient deficiencies and diseases.Sandy loam or silty soil is ideal, as it retains moisture while still allowing excess water to drain.', 'Begin by loosening the soil to a depth of 10 to 12 inches to ensure the roots can expand freely. Mix in compost or well-rotted manure to improve soil texture and boost fertility. If your soil is too acidic, apply lime to raise the pH to the optimal range. Refrain from using fertilizers high in nitrogen, as they encourage leaf growth rather than root development. Apply mulch like straw, leaves, or compost to maintain moisture, suppress weeds, and regulate temperature.', 'Beetroot is a cool-season crop that performs best when planted in early spring or late summer. Sow beet seeds ½ inch deep and 1–2 inches apart in rows spaced 12 inches apart. Thin the seedlings to about 3–4 inches apart once they grow a few inches tall to allow ample space for the roots to mature. Beets need at least 4–6 hours of sunlight daily, and the soil should be kept consistently moist but not soggy. Avoid disturbing the roots during thinning or weeding.', 'Beetroot needs about 1 to 1.5 inches of water per week, depending on the climate. Water deeply 2–3 times weekly to promote deeper root growth and healthy bulb formation. Always check the top inch of soil before watering—if it’s dry, it’s time to water. Water in the morning to prevent fungal issues and avoid wetting the foliage. Mulching around the base of the plants will help maintain consistent moisture levels and reduce water evaporation.', 'To support healthy beetroot development, enrich the soil with organic compost or aged manure prior to planting. Use bone meal or rock phosphate to increase phosphorus content, which encourages strong root formation. Add a small amount of wood ash to boost potassium, helping with disease resistance and overall vitality. Epsom salt, applied occasionally, can provide magnesium essential for photosynthesis. Avoid nitrogen-heavy fertilizers to keep growth focused on the roots rather than excessive foliage. Regularly top up with mulch or compost to maintain nutrient levels and improve soil structure throughout the growing period.', 'Beetroot is generally hardy, but it can be affected by a few common diseases. Downy mildew may appear in humid conditions, causing yellow spots and gray mold on leaves—ensure good air circulation and water at the base of plants. Cercospora leaf spot, characterized by round brown or purple spots with a reddish halo, can stunt growth and reduce yield; remove infected leaves and avoid overhead watering. Root rot occurs from overwatering or poorly drained soil, so ensure proper drainage and avoid standing water. Flea beetles and leaf miners may also attack leaves—use neem oil or insecticidal soap to manage infestations naturally.', '90 days', 'Rich in vitamins', 'uploads/1744366655_beetrootpot.png', 'uploads/1744366655_soil image.png', 'uploads/1744366655_beetrootgrowth.png'),
(3, 3, 'brocolli', 'uploads/1744390579_widepot.png', 'uploads/1744390579_sandyloamsoils.png', 'uploads/1744390579_brocolligroth1.png', 'To grow broccoli successfully at home, choose a container that is at least 12 to 16 inches deep and wide. Broccoli develops a deep root system, so adequate space is essential for healthy growth. Ensure the container has good drainage to avoid waterlogging, which can damage the roots and lead to poor head development.', 'Broccoli prefers well-draining, fertile loamy soil that is rich in organic matter. The ideal soil pH ranges between 6.0 and 7.0. The soil should retain moisture without becoming soggy. Avoid overly sandy or clay-heavy soils, as they either dry out too quickly or cause water stagnation. Adding compost improves soil structure, enhances nutrient content, and supports steady root and head growth.', 'Prepare the soil by loosening it up to 12 inches deep to encourage strong root penetration. Mix in compost or aged manure to enrich the soil with essential nutrients. If your soil is too acidic, apply lime to adjust the pH. Avoid high-nitrogen fertilizers as they promote excessive leaf growth at the expense of broccoli heads. Apply mulch, such as straw or dry leaves, around the base to conserve moisture and reduce weed competition.', 'Broccoli is a cool-season crop, best planted in early spring or fall. Sow seeds about ¼ to ½ inch deep in moist soil, or transplant seedlings once they are a few inches tall. Space plants 12 to 18 inches apart in rows 24 inches apart. Ensure the plants receive at least 6 to 8 hours of sunlight daily. Keep the soil consistently moist but not waterlogged. Thin out weaker seedlings to give stronger ones room to grow and form healthy heads.', 'Broccoli requires about 1.5 inches of water per week. Water deeply 2 to 3 times a week to promote deep root growth and steady development. Always check the topsoil—if it feels dry, it’s time to water. Water early in the morning to prevent fungal infections and avoid getting the leaves wet. Mulching around the plants helps retain soil moisture and regulate temperature.', 'Incorporate compost or aged manure into the soil for a slow and steady nutrient supply. Use bone meal or rock phosphate to boost phosphorus levels, supporting root and head formation. Add wood ash to supply potassium, which strengthens the plant and improves pest resistance. Occasionally mix in Epsom salt for magnesium, important for chlorophyll production. Avoid high nitrogen levels to prevent overly leafy growth. Maintain soil pH between 6.0 and 7.0, adjusting with lime or sulfur if necessary.', 'Broccoli is prone to several diseases, such as downy mildew, which causes yellow patches on leaves. To prevent this, avoid overhead watering and ensure good airflow between plants. Black rot is another common issue, marked by yellow leaves with dark veins; use disease-free seeds and promptly remove infected plants. Clubroot, which causes swollen roots and stunted growth, can be managed by maintaining soil pH above 6.5 and rotating crops. Pests like aphids and cabbage worms can be controlled using neem oil or insecticidal soap.', '60–90 days', 'Benefits:- Broccoli is a nutrient-dense vegetable loaded with vitamins A, C, and K, along with fiber, folate, and antioxidants. Regular consumption supports heart health, strengthens bones, and boosts immunity.'),
(5, 5, 'cauliflower', 'uploads/1744391483_widepot.png', 'uploads/1744391483_sandyloamsoils.png', 'uploads/1744391483_cauliflowergroth.png', 'Cauliflower grows best in containers that are at least 12 to 16 inches deep and wide. This size allows the roots to expand fully and supports healthy head development.', 'Cauliflower prefers fertile, well-draining loamy soil rich in organic matter.The soil should retain moisture without becoming soggy and must be loose enough for root penetration.', 'To prepare the soil for cauliflower, loosen it to a depth of 12 inches and mix in compost or well-rotted manure to enrich fertility. Maintain a slightly acidic to neutral pH between 6.0 and 7.0 by adjusting with lime or sulfur. Avoid soils with excessive nitrogen, as it leads to large leaves but smaller heads. Mulch the soil surface to retain moisture, suppress weeds, and stabilize soil temperature during cooler seasons.', 'Cauliflower is a cool-season crop best planted in early spring or fall. Start seeds indoors 4–6 weeks before transplanting or sow directly when temperatures are mild. Space plants 18–24 inches apart in rows 24–30 inches apart. Cauliflower requires 6–8 hours of full sun daily and consistent moisture. Avoid transplanting shock by hardening seedlings before moving them outdoors. Protect young plants from extreme temperatures using row covers or shade netting.', 'Cauliflower requires consistent and deep watering—about 1.5 inches per week. Water deeply 2–3 times weekly, allowing moisture to reach the root zone. Keep the soil evenly moist, especially during head formation, to prevent issues like bolting or poor curd development. Water early in the morning to reduce evaporation and minimize the risk of fungal infections. Use mulch to maintain soil moisture and regulate temperature.', 'Before planting, enrich the soil with compost or aged manure to boost fertility. Add bone meal or rock phosphate to support root and head development. Use a balanced fertilizer with more phosphorus and potassium and moderate nitrogen levels. Epsom salt can be applied occasionally to provide magnesium, aiding in chlorophyll formation. Maintain a pH between 6.0–7.0 for optimal nutrient uptake, adjusting as needed with lime or sulfur.', 'Common diseases affecting cauliflower include clubroot, black rot, and downy mildew. Clubroot causes distorted roots and stunted growth—prevent it by maintaining a soil pH above 6.5 and rotating crops. Black rot appears as yellow V-shaped lesions on leaves; control it by using clean tools and disease-free seeds. Downy mildew causes yellowing and mold on leaf undersides—avoid overhead watering and provide good airflow. Regularly inspect plants for aphids and cabbage worms, using neem oil or insecticidal soap as needed.', '70 to 100 days', 'Benefits:- Cauliflower is packed with nutrients and low in calories, making it a powerful addition to a healthy diet. It is rich in vitamin C, vitamin K, folate, and antioxidants, supporting immune function and reducing inflammation.'),
(6, 6, 'celery', 'uploads/1744391912_similarpot.png', 'uploads/1744391912_sandyloamsoils.png', 'uploads/1744391912_celerygrowth.png', 'Celery grows best in containers that are at least 8 to 12 inches deep and wide.Make sure the container has proper drainage to avoid root rot while maintaining evenly moist soil.', 'Celery thrives in rich, moisture-retentive, well-draining soil with a slightly acidic to neutral pH of 6.0 to 7.0. A mix of loam and compost or well-rotted manure ensures nutrient density and structure.', 'Prepare the soil by loosening it up to 10–12 inches deep and incorporating plenty of organic matter like compost or aged manure. Maintain soil fertility by mixing in a balanced organic fertilizer before planting. To ensure even moisture retention, add coco peat or well-decomposed leaf mold. Keep the pH between 6.0–7.0 and avoid excess nitrogen, which may cause hollow stems.', 'Celery is a cool-season crop that grows best in spring or fall. Start seeds indoors 8–10 weeks before the last frost and transplant outdoors when seedlings are 5–6 inches tall and the temperature is consistently above 10°C. Space plants about 8 inches apart in rows that are 12–18 inches apart. Celery prefers full sun but can tolerate partial shade, especially in hotter climates. Consistent moisture and stable temperatures are key for good stalk development.', 'Celery requires consistent watering—at least 1.5 to 2 inches per week. Water deeply 2–3 times a week, ensuring the soil stays evenly moist but not waterlogged. Avoid letting the soil dry out, as it can lead to tough, bitter stalks. Water early in the day and avoid overhead watering to reduce disease risks. Use mulch around the base of the plants to retain moisture and regulate temperature.', 'Celery is a heavy feeder and needs fertile soil for optimal growth. Incorporate compost, well-rotted manure, and balanced organic fertilizer into the soil before planting. Supplement with liquid feed high in potassium every few weeks during growth. Bone meal can boost root development, while Epsom salt provides magnesium for healthy green leaves. Maintain consistent feeding to ensure crisp and flavorful stalks.', 'Celery is susceptible to several diseases, including early blight, bacterial blight, and fusarium wilt. These often present as yellowing leaves, brown spots, or wilted stems. Ensure good air circulation, avoid overcrowding, and use disease-free seeds. Practice crop rotation and avoid watering the foliage to reduce the risk of fungal diseases. Slugs and aphids can also be problematic—use neem oil or natural deterrents to control infestations.', '100 to 130 days', 'Benefits:- Celery is low in calories but high in vitamins and minerals, making it an ideal addition to a healthy diet. It\\\'s a great source of vitamin K, vitamin C, potassium, and dietary fiber.'),
(7, 7, 'fenugreek', 'uploads/1744392281_widepot.png', 'uploads/1744392281_sandyloamsoils.png', 'uploads/1744392281_fenugreekgrowth.png', 'Fenugreek grows well in moderately sized containers that are at least 6 to 8 inches deep. Because it has a shallow root system, the width of the container matters more than the depth.', 'Fenugreek thrives in well-draining, loamy soil enriched with organic matter.Avoid overly compacted or clay-heavy soil, which can lead to poor root development and stunted growth.', 'Loosen the top 6–8 inches of the soil before planting and incorporate compost or well-rotted manure to enrich the soil with nutrients. A well-prepared soil bed ensures healthy root growth and lush green foliage. Avoid adding high-nitrogen fertilizers as they can result in overly leafy plants with less flavor.', 'Fenugreek is a fast-growing, cool-weather herb that can be planted from seeds directly into the container or garden bed. Sow seeds about ¼ inch deep and 1 inch apart in rows. Lightly cover with soil and water gently. It prefers full sun but can tolerate partial shade. Germination usually occurs within 3–7 days, and seedlings emerge quickly, making it ideal for successive planting every 2–3 weeks for a continuous harvest.', 'Fenugreek requires moderate but consistent watering. Water 2–3 times a week, depending on weather conditions. Ensure the soil stays moist, especially during germination and early growth. Overwatering can cause root rot, so let the topsoil dry slightly between waterings. Always water early in the morning to promote strong, healthy growth.', 'Being a legume, fenugreek enriches the soil naturally by fixing nitrogen. However, it still benefits from compost or vermicompost mixed into the soil before planting. Adding bone meal provides phosphorus for root development. Avoid excess chemical fertilizers, especially nitrogen-heavy ones, to maintain its flavor and medicinal properties.', 'Fenugreek is generally pest-resistant but can occasionally suffer from damping-off, powdery mildew, or aphid attacks. To prevent disease, ensure proper spacing and air circulation. Avoid overhead watering and remove any affected leaves immediately. Neem oil spray or organic insecticidal soap can help manage pests naturally.', '20 to 30 days', 'Benefits:- Fenugreek is rich in iron, fiber, and antioxidants. Its leaves are known for aiding digestion, reducing inflammation, and regulating blood sugar levels.'),
(8, 8, 'garlic', 'uploads/1744392658_widepot.png', 'uploads/1744392658_sandyloamsoils.png', 'uploads/1744392658_garlicgrowth.png', 'Garlic can be successfully grown in containers that are at least 8–10 inches deep with good drainage holes.Shallow containers limit root development and may result in smaller bulbs.', 'Garlic prefers loose, well-draining loamy soil.The soil should be rich in organic matter and slightly sandy for improved drainage.', 'Prepare the soil by loosening it to a depth of 8–10 inches. Mix in plenty of compost or well-rotted manure to enrich fertility. Adding bone meal supports root and bulb development. Avoid using fresh manure as it can introduce pathogens. Raised beds or containers with compost-rich soil provide the ideal growing medium.', 'Garlic is usually planted in the fall or early winter. Break apart a garlic bulb into individual cloves, leaving the papery skin intact. Plant cloves pointy side up, about 2 inches deep and 4–6 inches apart. Ensure the soil is firm around the clove but not compacted. Garlic needs 6–8 hours of sunlight daily for proper growth.', 'Garlic requires moderate watering. Water deeply once or twice a week, depending on rainfall and temperature. Keep the soil moist but never waterlogged. Reduce watering once the leaves begin to yellow near harvest time. Watering in the morning helps avoid fungal problems.', 'Incorporate compost and well-rotted manure into the soil before planting. During growth, apply a balanced organic fertilizer or fish emulsion every 3–4 weeks. Avoid excessive nitrogen, as it encourages leaf growth over bulb formation. Potassium and phosphorus-rich feeds are ideal for bulb development.', 'Garlic can be affected by white rot, downy mildew, and rust. To prevent diseases, rotate crops annually and avoid overwatering. Use disease-free planting material and ensure good air circulation. Remove and discard any infected plants. Neem oil or copper-based sprays can help manage fungal infections.', '7–9 months', 'Benefits:- Garlic is known for its potent medicinal properties.Garlic is also used in natural remedies to treat colds and digestive issues and is a staple in cuisines worldwide for its strong, pungent flavor.'),
(9, 9, 'ginger', 'uploads/1744392982_widepot.png', 'uploads/1744392982_sandyloamsoils.png', 'uploads/1744392982_gingergrowth.png', 'To grow ginger at home, use a wide container that is at least 12 inches deep and 12–14 inches wide. Ginger grows horizontally, so the container should allow the rhizomes to spread sideways.', 'Ginger thrives in rich, loose, well-draining loamy soil.The soil should be high in organic matter to support rhizome development.', 'Before planting, loosen the soil and mix in compost or well-rotted manure. This improves drainage, aeration, and nutrient availability. Add sand if the soil is too dense. Avoid chemical fertilizers early on, and opt for organic matter to build healthy microbial activity in the soil.', 'Plant ginger in early spring or just before the rainy season in warm climates. Use healthy rhizomes with visible \\\"eyes\\\" or buds. Cut them into 1–2 inch pieces with at least one bud each, and let them dry for a day before planting. Place them horizontally 1–2 inches deep in the soil with the buds facing up. Space pieces 6–8 inches apart.', 'Ginger needs consistent moisture but dislikes waterlogged soil. Water lightly but frequently to keep the soil evenly moist, especially during the early growth phase. Increase watering as the plant matures. Reduce watering once the leaves begin to yellow near harvest time. Always water in the morning to prevent fungal infections.', 'Feed ginger with compost tea or a balanced organic fertilizer every few weeks. High phosphorus and potassium content support rhizome growth. Avoid high nitrogen feeds, which promote excessive leafy growth. Apply mulch to conserve moisture and enrich the soil as it decomposes.', 'Ginger may be affected by root rot, bacterial wilt, and leaf spot. Prevent issues by ensuring proper drainage, rotating crops, and avoiding overwatering. Use disease-free rhizomes and sterilized tools. Neem oil or natural fungicides can help control fungal problems. Remove infected plants immediately to prevent spread.', '8–10 months', 'Benefits:- Ginger is widely valued for its medicinal and culinary properties.Ginger also supports heart health, lowers blood sugar, and boosts immunity. It’s commonly used in teas, curries, juices, and natural remedies.'),
(10, 10, 'green chilly', 'uploads/1744393292_similarpot.png', 'uploads/1744393292_sandyloamsoils.png', 'uploads/1744393292_greenchillygrowth.png', 'Green chilly plants grow well in containers that are at least 10–12 inches deep and wide.Ensure good drainage holes to prevent water stagnation, which can harm the roots.', 'Green chilly prefers well-draining, loamy or sandy soil that is rich in organic matter.Adding compost or cocopeat helps improve soil texture and nutrient content.', 'Prepare the soil by loosening it to about 8–10 inches deep. Mix in well-decomposed compost, farmyard manure, or vermicompost to enrich the soil. If the soil is clayey, add sand or cocopeat to improve drainage. Avoid water-retentive soils to prevent root rot. Let the soil rest for a day before planting.', 'Green chilly is a warm-season crop, best planted in late spring or early summer. Sow seeds ¼ inch deep in moist soil and keep in a warm place. Transplant seedlings once they have 4–6 leaves into the final container or garden bed, spacing each plant about 12–15 inches apart. Choose a sunny location that gets 6–8 hours of sunlight daily.', 'Water the plant when the top inch of soil feels dry. Avoid overwatering—chilly plants prefer slightly dry conditions between waterings. In general, watering 2–3 times a week is enough, depending on weather. Ensure water reaches the root zone without waterlogging the pot. Mulching helps retain moisture and reduce weed growth.', 'Use compost or organic manure at planting time. Supplement with balanced liquid fertilizers every 15–20 days during active growth. Phosphorus and potassium-rich feeds support flowering and fruiting. Avoid excess nitrogen, as it leads to lush leaves with fewer fruits. Banana peel compost or wood ash can also be used for potassium.', 'Green chilly is prone to fungal issues like powdery mildew, bacterial wilt, and pests like aphids or whiteflies. Prevent diseases by ensuring good airflow, avoiding wetting the foliage, and rotating crops. Neem oil spray or soap solution can be used for pest control. Remove infected leaves or plants immediately to avoid spreading.', '60–80 days', 'Benefits:- Green chillies are rich in Vitamin C, A, and antioxidants that boost immunity and improve skin health. Capsaicin, the compound responsible for heat, has metabolism-boosting, anti-inflammatory, and pain-relieving properties.'),
(11, 11, 'ladys finger', 'uploads/1744393620_similarpot.png', 'uploads/1744393620_sandyloamsoils.png', 'uploads/1744393620_ladysfingergrowth.png', 'To grow lady’s finger at home, use a container that is at least 12–14 inches deep and wide.A 15-liter pot is ideal for supporting strong and productive okra growth.', 'Lady’s finger thrives in well-draining, loamy soil that is rich in organic matter.Mixing compost or aged manure enhances the nutrient content and improves texture.', 'Start by loosening the soil to a depth of about 10–12 inches. Mix in compost, vermicompost, or aged manure thoroughly to boost fertility. If the soil is heavy or clayey, add sand or cocopeat to improve drainage. Ensure there are no clumps or stones that can hinder root growth. Let the prepared soil sit for a day before sowing.', 'Okra is a warm-season vegetable, best planted in spring or early summer. Soak seeds overnight to improve germination. Sow them directly into the container about ½ to 1 inch deep and 12–15 inches apart. Ensure the spot gets full sunlight (6–8 hours a day). Once the seedlings develop 4–5 leaves, thin out the weaker ones to promote healthy growth.', 'Water the plant regularly, keeping the soil consistently moist but not soggy. During hot weather, water 3–4 times a week. Deep watering promotes strong roots. Water at the base of the plant to avoid wetting leaves, which helps prevent fungal issues. Mulching can help maintain moisture and control weeds.', 'Mix compost or well-rotted manure into the soil before planting. Apply a balanced organic fertilizer every 15–20 days during the growing season. Potassium-rich fertilizers enhance fruiting, while phosphorus supports root and flower development. Avoid overuse of nitrogen to prevent excessive leafy growth with fewer pods.', 'Common pests include aphids, mites, and whiteflies. Fungal diseases like powdery mildew or leaf spot may also occur in humid conditions. To prevent these, ensure good air circulation, avoid overhead watering, and remove infected parts. Use neem oil or insecticidal soap to control pests organically.', '50–60 days', 'Benefits:- Lady’s finger is packed with fiber, Vitamin C, Vitamin K, and antioxidants. It aids in digestion, supports heart health, and helps regulate blood sugar levels.'),
(12, 12, 'lettuce', 'uploads/1744393959_widepot.png', 'uploads/1744393959_sandyloamsoils.png', 'uploads/1744393959_lettucegrowth.png', 'Lettuce can be grown in containers that are at least 6–8 inches deep and 10–12 inches wide. A container of about 8–10 liters works well for leaf varieties, while heading types may require slightly larger pots for optimal growth.', 'Lettuce thrives in well-draining, loose, and fertile soil rich in organic matter.Adding compost, peat moss, or vermicompost improves both the texture and nutrient profile of the soil, ensuring healthy growth.', 'Before planting, loosen the soil to at least 6 inches and incorporate compost or aged manure to boost fertility. Avoid using fresh manure, as it may burn young plants. Mix in sand or perlite if the soil is too compact. Maintain a fine, crumbly texture to support shallow root development and good air circulation in the soil.', 'Lettuce is a cool-season crop best grown in early spring or fall. Sow seeds about ¼ inch deep and lightly cover them with soil. Space seedlings 6–12 inches apart, depending on the variety. Ensure the container is placed in a spot that receives 4–6 hours of sunlight daily. For warmer climates, partial shade during peak heat helps prevent bolting. Keep the soil consistently moist for better germination.', 'Lettuce requires consistent moisture to prevent bitterness and promote tender leaves. Water lightly but frequently—about 1 inch of water per week is ideal. Avoid overwatering, which can lead to root rot. Morning watering is best to allow the foliage to dry and reduce the risk of disease. Mulching helps conserve moisture and cool the soil.', 'Incorporate well-decomposed compost before planting. Lettuce benefits from nitrogen-rich fertilizers, which promote leafy growth. You can use liquid seaweed extract, compost tea, or a balanced organic fertilizer every 10–15 days. Avoid excess nitrogen near harvest time to maintain flavor and texture. Keep the soil pH stable and enriched with trace elements like magnesium and calcium.', 'Lettuce is prone to fungal issues such as downy mildew and leaf spot, especially in damp conditions. Avoid overhead watering and overcrowding, which limit air circulation. Aphids and slugs can also damage the crop—use neem oil sprays, copper tape, or organic pest barriers. Crop rotation and clean soil practices help minimize disease recurrence.', '30–40 days', 'Benefits:- Lettuce is low in calories and high in water content, making it excellent for hydration and weight management. It’s a good source of Vitamins A, K, and folate, supporting eye health, bone strength, and cell growth.'),
(13, 13, 'mint', 'uploads/1744394255_similarpot.png', 'uploads/1744394255_sandyloamsoils.png', 'uploads/1744394255_mintgrowth.png', 'Mint is best grown in containers of 10–12 inches deep and wide, which helps contain its vigorous root spread. A 6–8 liter pot is sufficient for a single plant.', 'Mint grows well in moist, well-draining soil rich in organic matter.Mixing compost or well-rotted manure helps enrich the soil and supports lush leaf development.', 'Before planting, loosen the soil and mix in plenty of organic compost. The soil should be soft and airy to allow easy root expansion. If growing in a pot, use a high-quality potting mix with good drainage. Adding cocopeat or perlite can help improve aeration and prevent sogginess. Avoid compact or clay-heavy soil.', 'Mint can be planted through stem cuttings or root divisions. Choose a healthy stem and place it in moist soil or water until roots form. Then transplant it into the container or bed. Plant it about 1–2 inches deep, spacing multiple plants 10–12 inches apart. Mint prefers partial shade to full sun, but too much direct sunlight can scorch the leaves in hot climates.', 'Mint thrives in consistently moist soil. Water once every 2–3 days, depending on the temperature and humidity. Avoid letting the soil dry out completely. During hot weather, increase watering frequency, and reduce it slightly during cooler months. Morning watering is ideal to reduce fungal risks and keep the foliage fresh.', 'Feed mint with a balanced organic fertilizer once a month. Adding compost, vermicompost, or liquid seaweed improves leaf production. Avoid heavy nitrogen fertilizers, as they may result in excessive growth with less flavor. Regularly replenish the topsoil with compost to maintain fertility and keep the plant vigorous.', 'Mint can be affected by powdery mildew, rust, and leaf blight, especially in humid conditions. Ensure proper spacing and air circulation to reduce fungal risks. Avoid overhead watering. Use neem oil or a homemade garlic spray to deter common pests like aphids and spider mites. Remove any yellow or diseased leaves promptly.', '60–70 days', 'Benefits:- Mint is rich in antioxidants, menthol, and vitamin C, which aid digestion and soothe respiratory issues. Its cooling properties help relieve headaches and improve skin health.'),
(14, 14, 'spinach', 'uploads/1744394496_widepot.png', 'uploads/1744394496_sandyloamsoils.png', 'uploads/1744394496_spinachgrowth.png', 'To grow spinach successfully at home, use a container that is at least 6–8 inches deep and 10–12 inches wide. A 4–6 liter container is sufficient for a few spinach plants.', 'Spinach thrives in loamy, well-draining soil rich in organic matter.Adding compost or aged manure improves fertility and supports leaf production.', 'Before planting, loosen the soil to at least 8 inches deep to encourage root growth. Mix in plenty of compost or vermicompost to boost nutrients and improve texture. Avoid compact or heavy clay soils. If the soil is too acidic, add lime to balance the pH. Mulch the soil surface with straw or leaves to retain moisture and reduce weed growth.', 'Spinach is a cool-season crop, ideal for early spring or fall. Sow seeds ½ inch deep directly into the soil and space them about 2–3 inches apart, with rows 12 inches apart. If transplanting seedlings, keep a gap of 4–6 inches between them. Ensure the spot receives at least 4–6 hours of sunlight daily, preferably morning sun.', 'Spinach requires consistent moisture for healthy growth. Water the plant 2–3 times a week, ensuring the top inch of soil stays moist. Avoid overhead watering to reduce the risk of fungal diseases. Water in the morning and use mulch to retain moisture and reduce temperature fluctuations in the soil.', 'Spinach is a heavy feeder of nitrogen. Add compost, vermicompost, or a nitrogen-rich organic fertilizer like blood meal or fish emulsion to the soil every 3–4 weeks. Bone meal helps support strong root growth. Maintain soil fertility by top-dressing with compost and rotating crops to avoid nutrient depletion.', 'Common spinach issues include downy mildew, leaf spot, and damping-off in seedlings. Ensure proper spacing and good air circulation to prevent fungal infections. Avoid wetting the foliage and remove any infected leaves. Natural remedies like neem oil or garlic spray can help deter aphids and caterpillars.', '35–45 days', 'Benefits:- Spinach is a powerhouse of nutrients, rich in iron, calcium, vitamin K, and fiber. It supports bone health, boosts immunity, and improves digestion.'),
(15, 15, 'radish', 'uploads/1744394733_widepot.png', 'uploads/1744394733_sandyloamsoils.png', 'uploads/1744394733_radishgrowth.png', 'Radishes grow well in containers that are at least 6–8 inches deep. A 3–5 liter container is sufficient for growing several radish plants, as they don\\\'t require much space.', 'Radishes prefer loose, sandy loam soil that drains well and is rich in organic matter.Incorporating compost improves soil structure and boosts fertility.', 'To prepare the soil, loosen it to a depth of 8–10 inches to allow the radish roots to expand freely. Mix in well-rotted compost or aged manure to enrich the soil. Avoid adding too much nitrogen, as this promotes leaf growth over root formation. Mulching with straw or dried leaves helps retain moisture and reduce weed competition.', 'Radish is a cool-season crop and can be planted in early spring or fall. Sow the seeds directly into the soil about ½ inch deep and 1 inch apart. Thin the seedlings to 2–3 inches apart once they sprout to avoid overcrowding. Ensure the container or bed receives at least 4–6 hours of sunlight daily for best growth.', 'Radishes need consistent moisture to grow properly and avoid becoming woody or bitter. Water deeply 2–3 times a week, depending on the weather. Keep the soil evenly moist but not waterlogged. Morning watering is ideal, and mulch can help maintain steady moisture levels.', 'Radishes don’t require heavy feeding. Enrich the soil with compost or organic matter before planting. If needed, apply a balanced fertilizer (e.g., 10-10-10) every couple of weeks. Avoid excessive nitrogen, which can cause lush foliage and small roots. Phosphorus and potassium are more beneficial for root development.', 'Common radish issues include root maggots, downy mildew, and clubroot. Practice crop rotation and ensure proper spacing for airflow. Avoid overhead watering to prevent fungal diseases. Use neem oil or insecticidal soap for pest control. Remove affected plants to stop the spread of disease.', '25–40 days', 'Benefits:- Radish is a low-calorie, high-fiber vegetable rich in vitamin C, potassium, and antioxidants. It helps with digestion, supports liver health, and can regulate blood pressure.'),
(16, 16, 'carrot', 'uploads/1744394977_widepot.png', 'uploads/1744394977_sandyloamsoils.png', 'uploads/1744394977_carrotgrowth.png', 'Carrots grow best in deep containers that are at least 10–12 inches deep, with a capacity of 8–10 liters or more, depending on the variety. Deep, loose soil allows proper development of long, straight roots.', 'Carrots prefer loose, well-drained sandy loam soil that is free of stones and debris, which can deform the roots. The soil should be rich in organic matter but not overly fertilized.', 'To prepare the soil, loosen it to a depth of at least 12 inches. Remove any rocks or hard clumps that may obstruct root growth. Mix in well-aged compost to improve structure and fertility. Avoid using fresh manure or high-nitrogen fertilizers, which can lead to forked or hairy roots. Adding a layer of mulch on top helps retain moisture and suppress weeds.', 'Carrots are a cool-season crop, best sown directly into the soil in early spring or late summer. Sow seeds about ¼ inch deep and 1–2 inches apart in rows spaced 12 inches apart. Once seedlings grow a few inches tall, thin them to 2–3 inches apart to allow enough space for root development. Carrots require full sun (6–8 hours daily) for optimal growth.', 'Carrots require consistent moisture to avoid cracking and for even growth. Water them 2–3 times a week, providing about 1 inch of water per week. Ensure the soil stays moist but not soggy. Water in the early morning, and apply mulch to retain moisture and reduce evaporation.', 'Before planting, enrich the soil with compost or well-rotted organic matter. Carrots benefit from phosphorus and potassium, which support root development. Avoid fertilizers high in nitrogen, as they promote leaf growth over root formation. Bone meal can be used to boost phosphorus levels naturally.', 'Common diseases affecting carrots include Alternaria leaf blight, carrot rust fly, and powdery mildew. To prevent these issues, use disease-free seeds, practice crop rotation, and ensure good airflow. Avoid overhead watering to minimize fungal growth, and remove any infected foliage immediately.', '60–80 days', 'Benefits:- Carrots are rich in beta-carotene, which converts to vitamin A, supporting eye health and immunity. They are also high in fiber, antioxidants, potassium, and vitamin K.'),
(17, 17, 'tomato', 'uploads/1744395339_similarpot.png', 'uploads/1744395339_sandyloamsoils.png', 'uploads/1744395339_planting image.png', 'Tomatoes thrive in containers that hold at least 15–20 liters of soil, with a depth of 12–18 inches. The large root system of tomato plants requires ample space for healthy development.', 'Tomatoes prefer well-draining, loamy soil that is rich in organic matter.Adding compost or aged manure improves soil structure and nutrient availability. Avoid compacted or waterlogged soil.', 'Before planting, loosen the soil to at least 12 inches deep to facilitate root expansion. Mix in generous amounts of compost or well-rotted manure for improved fertility. Adding bone meal can enhance phosphorus levels for better fruit development. Ensure the soil is crumbly and aerated to support healthy root growth. Mulching after planting helps conserve moisture and suppress weeds.', 'Tomatoes are a warm-season crop, best planted after the last frost when temperatures remain consistently above 60°F (15°C). Plant seedlings deep into the soil, burying two-thirds of the stem to encourage strong root growth. Space plants about 18–24 inches apart. Provide a stake or cage to support the plant as it grows. Tomatoes require 6–8 hours of full sun daily for maximum yield.', 'Tomatoes need consistent watering, about 1–1.5 inches per week. Water deeply at the base of the plant 2–3 times weekly rather than shallow watering daily. Morning watering is preferred to avoid fungal diseases. Avoid splashing water on leaves to prevent blight. Mulching around the plant helps retain moisture and stabilize soil temperature.', 'Incorporate organic compost, bone meal, and wood ash to enrich the soil with phosphorus and potassium. Avoid excess nitrogen, which promotes leafy growth at the expense of fruit production. Epsom salt may be used occasionally to supply magnesium, aiding in chlorophyll formation. Regularly monitor soil pH and amend as necessary to keep it within the optimal range.', 'Tomatoes are susceptible to blight, blossom end rot, fusarium wilt, and leaf spot. To reduce disease risk, use resistant varieties, avoid overhead watering, and rotate crops annually. Ensure good air circulation around the plants. Remove and discard infected leaves immediately and sterilize tools between uses.', ' 60–85 days', 'Benefits:- Tomatoes are an excellent source of vitamin C.hey support skin health, immune function, and eye health.'),
(18, 18, 'cabbage', 'uploads/1744395570_widepot.png', 'uploads/1744395570_sandyloamsoils.png', 'uploads/1744395570_cabbagegrowth.png', 'Cabbage needs a large container of at least 15–20 liters with a depth of 12–16 inches to accommodate its wide, shallow root system.', 'Cabbage grows best in rich, well-draining, loamy soil.The soil should be high in organic matter to support continuous nutrient uptake during its relatively long growing season.', 'Prepare the soil by loosening it to a depth of 12 inches. Mix in compost, aged manure, or well-rotted organic matter to enhance fertility. Add lime if your soil is too acidic, maintaining pH in the ideal range. Avoid soils with poor drainage, as cabbage is prone to root rot. Mulch with organic materials like straw or shredded leaves to retain moisture and suppress weeds.', 'Cabbage is a cool-season crop, ideal for planting in early spring or fall. Sow seeds indoors and transplant when seedlings have 3–4 true leaves, or directly sow outdoors depending on climate. Space plants 12–18 inches apart in rows 24 inches apart. Cabbage requires full sun exposure—at least 6 hours daily—for proper head formation. Keep soil moist and firm around the base.', 'Cabbage needs consistent moisture, typically 1.5 inches of water per week. Water deeply 2–3 times per week, ensuring the root zone stays moist but not soggy. Avoid water stress, which can lead to cracked or poorly formed heads. Water early in the morning to reduce the risk of fungal diseases, and use mulch to retain soil moisture.', 'Cabbage is a heavy feeder. Enrich the soil with compost or aged manure, and supplement with balanced fertilizers containing nitrogen, phosphorus, and potassium. High nitrogen supports leafy growth, while phosphorus and potassium promote strong root and head development. Add bone meal and wood ash as organic options, and apply Epsom salt to provide magnesium for healthy foliage.', 'Common issues include black rot, clubroot, downy mildew, and cabbage worms. Rotate crops annually, maintain soil pH above 6.5 to prevent clubroot, and ensure proper spacing for air circulation. Use neem oil or insecticidal soap to control pests. Remove infected plants immediately to prevent the spread of disease.', ' 70–100 days', 'Benefits:- Cabbage is rich in vitamin K, vitamin C, fiber, and antioxidants like sulforaphane, known for cancer-fighting properties.'),
(19, 19, 'cucumber', 'uploads/1744395779_widepot.png', 'uploads/1744395779_sandyloamsoils.png', 'uploads/1744395779_cucumbergrowth.png', 'To successfully grow cucumbers at home, choose a container with a capacity of 15–20 liters or more.The container should be at least 12 inches deep and wide, with multiple drainage holes to prevent water stagnation.', 'Cucumbers thrive in well-draining, loose, and fertile soil.A mixture of garden soil, compost, and coco peat or sand is ideal for promoting aeration and nutrient availability.', 'Before planting, loosen the soil to a depth of 12 inches and mix in plenty of organic compost or aged manure. This enhances fertility and improves texture. For extra nutrients, add a balanced fertilizer or slow-release organic pellets. Maintain the soil pH in the ideal range by incorporating lime (to raise pH) or sulfur (to lower pH) if needed. Apply mulch to preserve moisture and regulate soil temperature.', 'Cucumber is a warm-season crop and prefers temperatures between 20–30°C. Sow seeds ½ inch deep in moist soil. If using a container, sow 2–3 seeds per pot and thin out the weaker seedlings later. Provide trellising or support for vining varieties to save space and improve airflow. Place containers in a sunny spot that receives at least 6–8 hours of direct sunlight daily.', 'Cucumbers require consistent and deep watering, about 1.5 inches per week, especially during flowering and fruiting stages. Water deeply 2–3 times a week, allowing the moisture to reach the roots. Avoid overhead watering to prevent fungal infections. Water in the early morning, and always keep the soil slightly moist but not soggy. Mulching helps maintain moisture and prevents soil crusting.', 'To support vigorous growth and fruit production, enrich the soil with organic compost and well-balanced fertilizers. Add phosphorus (via bone meal) to support root and flower development, and potassium (via wood ash or banana peel compost) to enhance fruiting. Supplement with magnesium (Epsom salt) for chlorophyll production. Avoid overuse of nitrogen, which can lead to leafy growth with poor fruiting.', 'Cucumbers are vulnerable to powdery mildew, downy mildew, bacterial wilt, and pests like aphids, cucumber beetles, and spider mites. To manage diseases, provide proper spacing, avoid waterlogged conditions, and use organic fungicides or neem oil sprays. Remove infected leaves or plants promptly. Keep leaves dry to prevent fungal spread and ensure good air circulation.', ' 50–70 days', 'Benefits:- Cucumber is over 95% water, making it excellent for hydration and detoxification. It is rich in vitamin K, potassium, and antioxidants, promoting healthy skin, weight loss, and digestion.'),
(20, 20, 'potato', 'uploads/1744396033_widepot.png', 'uploads/1744396033_sandyloamsoils.png', 'uploads/1744396033_potatogrowth.png', 'For growing potatoes at home, select a container with at least 20–30 liters capacity, and a depth of 12–16 inches.Ensure the container has drainage holes to prevent waterlogging.', 'Potatoes thrive in loose, well-draining sandy loam soil.Use a mix of garden soil, compost, and sand or coco peat for best results.', 'Loosen the soil up to 12 inches deep and incorporate generous amounts of well-rotted compost or aged manure. This boosts nutrient content and improves soil aeration. Avoid fresh manure, as it can cause scab on potatoes. Add wood ash or bone meal to enhance potassium and phosphorus levels, essential for tuber development. Avoid nitrogen-heavy fertilizers that encourage leaf growth over tuber production.', 'Plant seed potatoes (small whole potatoes or large ones cut into chunks with at least one “eye”) after they have sprouted. Place them 4–5 inches deep in the soil, with the eyes facing up, and 12 inches apart. Cover lightly with soil. As the plant grows, continue to hill up soil or compost around the stem every few inches to encourage more tubers. Plant in early spring once frost has passed.', 'Potatoes require consistent and deep watering, especially during tuber formation. Provide 1–1.5 inches of water per week, depending on the weather. Keep the soil evenly moist but not waterlogged. Water at the base of the plant, avoiding the leaves to reduce the risk of fungal infections. Mulching around the base helps retain moisture and keep the soil cool.', 'Potatoes benefit from soil rich in phosphorus and potassium. Before planting, mix in compost and wood ash. During the growing season, side-dress with organic fertilizer or a balanced NPK (preferably low in nitrogen) once or twice. Epsom salt can be used occasionally for magnesium. Avoid excessive nitrogen, which leads to lush foliage but fewer tubers.', 'Potatoes are prone to blight, scab, and fungal rot. To prevent diseases, use certified disease-free seed potatoes, ensure good drainage, and avoid overhead watering. Rotate crops yearly to reduce disease buildup in the soil. If signs of blight or rot appear (such as black spots or mushy stems), remove and discard infected plants immediately.', '90–120 days', 'Benefits:- Potatoes are a nutrient-dense carbohydrate source, rich in vitamin C, vitamin B6, potassium, and fiber. They provide energy, support heart health, and aid in digestion.'),
(21, 21, 'peas', 'uploads/1744396215_widepot.png', 'uploads/1744396215_sandyloamsoils.png', 'uploads/1744396215_peasgrowth.png', 'For growing peas at home, use a container that holds at least 10–15 liters of soil and has a depth of 10–12 inches.Choose a container with good drainage and install a trellis or support sticks to allow vertical growth.', 'Peas thrive in well-draining, loamy soil.Incorporate organic matter like compost to improve soil texture and fertility.', 'Before planting, prepare the soil by loosening it to a depth of 8–10 inches. Mix in well-rotted compost or aged manure to boost nitrogen and improve structure. Since peas fix their own nitrogen, avoid adding chemical fertilizers high in nitrogen. Instead, add wood ash or bone meal for phosphorus and potassium to support flowering and pod development.', 'Peas are a cool-season crop and should be planted in early spring or late fall, depending on your climate. Sow the seeds 1–1.5 inches deep and about 2 inches apart in rows. Provide support structures like sticks, trellises, or netting for the vines to climb. Place the container in a spot that receives at least 6 hours of sunlight daily. Water immediately after planting to encourage germination.', 'Peas require consistent moisture, especially during flowering and pod formation. Water them with 1–1.2 inches per week, keeping the soil evenly moist but not soggy. Water deeply 2–3 times a week and avoid overhead watering to reduce the risk of fungal diseases. Apply mulch around the base to help conserve moisture and regulate soil temperature.', 'Although peas can fix atmospheric nitrogen through root nodules, they still benefit from soil rich in phosphorus and potassium. Add rock phosphate or bone meal to support root and flower development. Wood ash provides potassium and helps with disease resistance. Avoid nitrogen-rich fertilizers, which encourage leafy growth rather than pod production.', 'Common diseases affecting peas include powdery mildew, downy mildew, root rot, and fusarium wilt. To minimize risk, plant in well-drained soil, provide good airflow, and avoid wetting the foliage. Use disease-free seeds and rotate crops each season. At the first sign of disease (such as yellowing or curling leaves), remove affected plants and consider organic fungicide treatments if needed.', ' 50–70 days', 'Benefits:- Peas are rich in plant-based protein, fiber, vitamins A, C, and K, and minerals like iron and magnesium. They support digestive health, help regulate blood sugar, and contribute to heart health.');
INSERT INTO `vegetabledetails` (`id`, `vegetable_id`, `name`, `container_image`, `soil_image`, `planting_image`, `container_liters`, `typeofsoil`, `soil_preparation`, `planting`, `watering_schedule`, `nutrients_for_soil`, `disease`, `harvest_time`, `benefits`) VALUES
(22, 22, 'bitter gourd', 'uploads/1744396455_widepot.png', 'uploads/1744396455_sandyloamsoils.png', 'uploads/1744396455_bittergourd.png', 'To grow bitter gourd at home, use a container with a minimum capacity of 15–20 liters and a depth of at least 12–15 inches. Bitter gourd is a vigorous climber and requires ample space for root development.', 'Bitter gourd grows best in well-draining, sandy loam or loamy soil.Avoid heavy clay soils, as they retain too much moisture and can cause root rot.', 'Prepare the soil by loosening it to a depth of 12 inches and removing debris and weeds. Mix in generous amounts of organic compost, aged manure, or cocopeat to improve texture and nutrient content. Avoid excess nitrogen, which encourages leaf growth over fruiting. Apply wood ash or bone meal to increase potassium and phosphorus, promoting flowering and fruit set.', 'Bitter gourd is a warm-season crop, best planted in late spring or early summer when temperatures are consistently above 20°C. Soak seeds in water overnight before planting to enhance germination. Sow the seeds about 1 inch deep and 12–18 inches apart in well-prepared soil. Place the container in a sunny location with 6–8 hours of direct sunlight daily. Once seedlings sprout, provide vertical support for the climbing vines.', 'Bitter gourd requires consistent but moderate watering. Water deeply 2–3 times per week, allowing the top inch of soil to dry out between waterings. Avoid water stagnation, as it can lead to root diseases. Morning watering is ideal, especially during flowering and fruit development. Mulching with straw or dried leaves helps retain moisture and suppress weeds.', 'Before planting, incorporate compost, vermicompost, or well-rotted manure into the soil. Use phosphorus- and potassium-rich organic amendments like bone meal and wood ash to support flowering and fruiting. Avoid high nitrogen fertilizers, as they cause excessive leaf growth. Supplement with liquid organic fertilizers (e.g., seaweed or fish emulsion) every 2–3 weeks during the growing season.', 'Bitter gourd may face issues like powdery mildew, downy mildew, fruit rot, and aphid infestations. Prevent diseases by planting in well-ventilated areas and avoiding overhead watering. Remove any infected leaves promptly. Organic pest control methods like neem oil spray or soap water can be used against aphids and mites. Crop rotation and clean soil practices are effective for long-term disease prevention.', '55–65 days', 'Benefits:- Bitter gourd is renowned for its medicinal and nutritional properties. It is rich in vitamins A, C, and several B-complex vitamins, as well as iron, magnesium, potassium, and antioxidants.'),
(23, 23, 'beans', 'uploads/1744396744_widepot.png', 'uploads/1744396744_sandyloamsoils.png', 'uploads/1744396744_beansgrowth.png', 'Beans can be successfully grown in containers that are at least 12–15 inches deep and have a capacity of 10–15 liters.The container should have good drainage holes to prevent root rot and promote healthy root development.', 'Beans thrive in well-draining, loamy soil that is rich in organic matter.Mixing in compost or aged manure boosts soil fertility and structure.', 'Before planting, loosen the soil to a depth of 10–12 inches and remove rocks and debris. Enrich the soil with organic compost, vermicompost, or well-decomposed manure. Beans fix their own nitrogen, so avoid high-nitrogen fertilizers. Instead, use balanced organic fertilizers and ensure proper aeration and drainage for healthy root development.', 'Beans are a warm-season crop, best sown directly into the container or ground after the last frost when temperatures are above 18°C. Soak seeds overnight before planting to improve germination. Sow seeds 1 inch deep and 2–4 inches apart. For pole beans, provide a support system like stakes, netting, or a trellis early on. Ensure they receive 6–8 hours of sunlight daily.', 'Beans require consistent moisture, especially during flowering and pod development. Water the plants 2–3 times per week, ensuring the soil stays evenly moist but not soggy. Avoid wetting the foliage to prevent fungal diseases. Morning watering is ideal. Use mulch around the base to maintain soil moisture and reduce weed growth.', 'Since beans are legumes, they can fix atmospheric nitrogen through their root nodules. Avoid adding nitrogen-rich fertilizers. Instead, focus on phosphorus and potassium, which promote flowering and fruit development. Use bone meal, wood ash, or banana peel compost for organic nourishment. Maintain moderate fertility, and top up with compost tea or seaweed extract every few weeks.', 'Beans may suffer from powdery mildew, rust, bacterial blight, and aphid infestations. Ensure good air circulation and avoid overhead watering. Use organic neem oil sprays or soap solutions for pest control. Remove and destroy infected leaves. Practicing crop rotation and keeping the area weed-free reduces disease risk.', '50–60 days', 'Benefits:- Beans are a nutrient-dense vegetable, rich in fiber, protein, folate, iron, potassium, and vitamin C. They support heart health, improve digestion, and help regulate blood sugar levels.'),
(25, 0, 'tumehjkl', 'uploads/1752466731_IMG-20250713-WA0004.jpg', 'uploads/1752466731_IMG-20250711-WA0009.jpg', 'uploads/1752466731_IMG-20250711-WA0007.jpg', 'hjfkfk', 'hhkk', 'hhfjjfkf', 'hjk', 'uukk', 'jjjjk', 'hjkfk', 'bhkkk', 'hhkk'),
(26, 0, 'gp go', 'uploads/1753160949_Screenshot_2025-07-20-23-21-24-92_b783bf344239542886fee7b48fa4b892.jpg', 'uploads/1753160949_Snapchat-1204975641.jpg', 'uploads/1753160949_Screenshot_2025-07-18-21-44-15-67_4336b74596784d9a2aa81f87c2016f50.jpg', 'to', 'full', 'full', 'ro', 'full', 'full', 'cl charms', 'cl cl', 'full dj'),
(27, 0, 'Trisha ', 'uploads/1753179577_IMG_20250721_072116.jpg', 'uploads/1753179577_IMG_20250721_072004.jpg', 'uploads/1753179577_IMG_20250721_072004.jpg', '180 to 100', 'soli', 'sollu ', '☘️', 'morning ', 'nutritional ', 'ghkkl kg', 'cl huve', 'bemghhs');

-- --------------------------------------------------------

--
-- Table structure for table `youtube_videos`
--

CREATE TABLE `youtube_videos` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `youtube_videos`
--

INSERT INTO `youtube_videos` (`id`, `title`, `url`, `created_at`) VALUES
(1, 'Container Gardening', 'https://youtu.be/y1eXnlzXdBE?si=xGLcAzHeviqhVMzC', '2025-04-11 10:18:46'),
(5, 'Gardening for Beginners', 'https://youtu.be/BO8yuSTc3fo?si=SVwBK4Y5uBmigXlp', '2025-04-12 03:07:41'),
(6, 'Vegetable Gardening for Beginners', 'https://youtu.be/LAU6qu_dKBk?si=um4YM_qL5CT-yTHO', '2025-04-12 03:10:34'),
(7, 'Vegetable Harvesting', 'https://youtu.be/xnlsf7UlmJE?si=vXczplJpmzc3ISLO', '2025-04-12 03:12:03'),
(8, 'How to start a garden', 'https://youtu.be/B0DrWAUsNSc?si=gH1gQVypNs82M344', '2025-04-12 03:12:49'),
(9, 'How to start your first garden', 'https://youtu.be/X3SP1Fub3bw?si=lAS3pnOl8z6T-BmU', '2025-04-12 03:14:38'),
(10, 'Raised bed gardens for beginners', 'https://youtu.be/j5vdLac1fW8?si=hZZ-pI7GvxfULUeQ', '2025-04-12 03:15:48'),
(11, 'How to start your first seeds', 'https://youtu.be/2SwLs5SlXPc?si=08iyMyB6p_yBZZnt', '2025-04-12 03:16:40'),
(12, 'How to start vegetable seeds', 'https://youtu.be/bRWac1OpxPY?si=dwh6eUuE2nAhzRkM', '2025-04-12 03:17:18'),
(13, 'Planning a vegetable garden for beginners', 'https://youtu.be/9R-utqpmwmE?si=ZatnGVJrpqnvQPsv', '2025-04-12 03:18:25'),
(14, 'How to care for seedlings', 'https://youtu.be/3xh1qZGiejg?si=fawy7Sf35ZlYh6bd', '2025-04-12 03:20:17'),
(15, 'April vegetable gardening guide', 'https://youtu.be/fbF-E8h7tyE?si=ngesfYKCazmmIBDg', '2025-04-12 03:21:33'),
(16, 'Top 9 fast growing vegetables', 'https://youtu.be/obkMijeI8SU?si=2HxASlYbZxF5KSnB', '2025-04-12 03:23:19'),
(17, '12 Vegetables to grow in spring', 'https://youtu.be/F3ePVs_-eDQ?si=cYA9IegiIrGpuLZ_', '2025-04-12 03:26:26'),
(18, '25 Veggies to plant in march', 'https://youtu.be/mC_33uBg2sQ?si=v4BJ1yxtudHSGr2V', '2025-04-12 03:28:06'),
(19, 'Day 1 to Day 150 growing a vegetable garden', 'https://youtu.be/Ujif7Z7udgw?si=r_fHU2iRWljgj8oT', '2025-04-12 03:34:38'),
(20, 'Day 1 to Day 150 growing a vegetable garden', 'https://youtu.be/Ujif7Z7udgw?si=r_fHU2iRWljgj8oT', '2025-04-12 06:30:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `doubtschat`
--
ALTER TABLE `doubtschat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `register_id` (`register_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vegetable`
--
ALTER TABLE `vegetable`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `vegetabledetails`
--
ALTER TABLE `vegetabledetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `youtube_videos`
--
ALTER TABLE `youtube_videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminlogin`
--
ALTER TABLE `adminlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doubtschat`
--
ALTER TABLE `doubtschat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `vegetable`
--
ALTER TABLE `vegetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `vegetabledetails`
--
ALTER TABLE `vegetabledetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `youtube_videos`
--
ALTER TABLE `youtube_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doubtschat`
--
ALTER TABLE `doubtschat`
  ADD CONSTRAINT `doubtschat_ibfk_1` FOREIGN KEY (`register_id`) REFERENCES `register` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

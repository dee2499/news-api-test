-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2024 at 08:55 PM
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
-- Database: `news_aggregator`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `author`, `source`, `category`, `published_at`, `created_at`, `updated_at`) VALUES
(2, 'TSMC third-quarter profit beats expectations as AI boom drives 54% hike - CNBC', 'No content available', 'CNBC', 'NewsAPI', 'General', '2024-10-17 00:38:57', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(3, 'When is the next full moon? October brings the hunter supermoon - Des Moines Register', 'No content available', 'Des Moines Register', 'NewsAPI', 'General', '2024-10-17 00:19:25', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(4, 'Israeli strike on Lebanese municipal building kills 16, including mayor - Reuters', 'No content available', 'Reuters', 'NewsAPI', 'General', '2024-10-17 00:06:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(5, 'US long-range B-2 stealth bombers target underground bunkers of Yemen’s Houthi rebels - The Associated Press', 'No content available', 'The Associated Press', 'NewsAPI', 'General', '2024-10-16 23:32:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(6, 'Dodgers vs. Mets: L.A. takes 2-1 lead in NLCS with Shohei Ohtani HR, Walker Buehler scoreless start - Yahoo Sports', 'No content available', 'Yahoo Sports', 'NewsAPI', 'General', '2024-10-16 22:22:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(7, 'Saints vs. Broncos odds, prediction, time, spread: Thursday Night Football picks from NFL model on 11-3 run - CBS Sports', 'No content available', 'CBS Sports', 'NewsAPI', 'General', '2024-10-16 22:14:58', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(8, '3 dead and 4 injured in collapse of Mississippi bridge being prepped for demolition - The Associated Press', 'No content available', 'The Associated Press', 'NewsAPI', 'General', '2024-10-16 22:14:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(9, 'Archdiocese of Los Angeles Agrees to Pay $880 Million to Settle Sex Abuse Claims - The New York Times', 'No content available', 'The New York Times', 'NewsAPI', 'General', '2024-10-16 22:11:33', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(10, 'Ryan Murphy & FX Chief John Landgraf On That ‘Grotesquerie’ Twist & Taking Risks In Their 21 Years Of Collaboration - Deadline', 'No content available', 'Deadline', 'NewsAPI', 'General', '2024-10-16 21:46:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(11, 'Zelensky reveals ‘victory plan,’ calls for urgent NATO membership - The Washington Post', 'No content available', 'The Washington Post', 'NewsAPI', 'General', '2024-10-16 21:36:01', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(12, 'How a ‘putrid’ find in a museum cupboard could be the key to bringing the Tasmanian tiger back to life - The Guardian', 'No content available', 'The Guardian', 'NewsAPI', 'General', '2024-10-16 21:20:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(13, 'Georgia judge blocks elections rules backed by Pro-Trump Republicans - Reuters', 'No content available', 'Reuters', 'NewsAPI', 'General', '2024-10-16 21:11:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(14, 'Ionescu\'s winner from 28 feet puts Liberty up 2-1 - ESPN', 'No content available', 'ESPN', 'NewsAPI', 'General', '2024-10-16 20:59:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(15, 'Menendez brothers case: Family members plea for their release - BBC.com', 'No content available', 'BBC.com', 'NewsAPI', 'General', '2024-10-16 20:56:15', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(16, 'Fox News did not disclose its all-women town hall with Trump was packed with his supporters - CNN', 'No content available', 'CNN', 'NewsAPI', 'General', '2024-10-16 20:53:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(17, 'China to Boost Support for Unfinished Properties to $562 Billion - Bloomberg', 'No content available', 'Bloomberg', 'NewsAPI', 'General', '2024-10-16 20:52:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(18, 'US Man Dies From Rare Mosquito Virus Caught In Backyard, Cases Rising - NDTV', 'No content available', 'NDTV', 'NewsAPI', 'General', '2024-10-16 20:38:55', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(19, 'Texas committee approves subpoena for death row inmate ahead of his execution - CNN', 'No content available', 'CNN', 'NewsAPI', 'General', '2024-10-16 20:21:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(20, 'Fox News’ Bret Baier Shares His Impressions of Kamala Harris After Contentious Sit-Down - The Daily Beast', 'No content available', 'The Daily Beast', 'NewsAPI', 'General', '2024-10-16 19:48:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(21, 'Amazon reveals its first color Kindle e-reader after years of development - Reuters', 'No content available', 'Reuters', 'NewsAPI', 'General', '2024-10-16 19:15:00', '2024-10-18 00:31:12', '2024-10-18 00:31:12'),
(22, '‘Just devastating’: Wolverhampton mourns its local hero Liam Payne', 'No content available', NULL, 'The Guardian', 'uk-news', '2024-10-18 00:30:16', '2024-10-18 00:31:14', '2024-10-18 00:31:14'),
(23, 'Post Office continued to use racist term for black workers until 2016, inquiry told', 'No content available', NULL, 'The Guardian', 'uk-news', '2024-10-18 00:30:15', '2024-10-18 00:31:14', '2024-10-18 00:31:14'),
(24, 'Pakistan v England: second men’s cricket Test, day four – live', 'No content available', NULL, 'The Guardian', 'sport', '2024-10-18 00:30:04', '2024-10-18 00:31:14', '2024-10-18 00:31:14'),
(25, 'Middle East crisis live: Iran says Sinwar killing will strengthen ‘spirit of resistance’; US signals push for Gaza ceasefire', 'No content available', NULL, 'The Guardian', 'world', '2024-10-18 00:26:13', '2024-10-18 00:31:14', '2024-10-18 00:31:14'),
(26, 'Australia news live: Seven wins legal fight to suppress details of lawsuit brought by former journalist', 'No content available', NULL, 'The Guardian', 'australia-news', '2024-10-18 00:24:39', '2024-10-18 00:31:14', '2024-10-18 00:31:14'),
(27, 'Victoria at risk of tornadoes as thunderstorms and giant hail lash Australia’s south-east', 'No content available', NULL, 'The Guardian', 'australia-news', '2024-10-18 00:07:56', '2024-10-18 00:31:14', '2024-10-18 00:31:14'),
(28, 'TV tonight: the truth about one of Hollywood’s most puzzling scandals ', 'No content available', NULL, 'The Guardian', 'tv-and-radio', '2024-10-17 23:50:14', '2024-10-18 00:31:14', '2024-10-18 00:31:14'),
(29, 'Three police officers engaged in serious misconduct while Indigenous man was in custody, report finds', 'No content available', NULL, 'The Guardian', 'australia-news', '2024-10-17 23:40:56', '2024-10-18 00:31:14', '2024-10-18 00:31:14'),
(30, 'Nine staff hire lawyers as report finds some leaders attempted to cover up inappropriate workplace behaviour', 'No content available', NULL, 'The Guardian', 'media', '2024-10-17 23:40:53', '2024-10-18 00:31:14', '2024-10-18 00:31:14'),
(31, 'Tar balls: mystery substance on beaches could be linked to sewage plant, scientists say', 'No content available', NULL, 'The Guardian', 'australia-news', '2024-10-17 23:36:27', '2024-10-18 00:31:14', '2024-10-18 00:31:14'),
(32, 'Surprise Battlefield Encounter Led to Hamas Leader’s Death', 'Although Yahya Sinwar was a major target of Israel’s military campaign in Gaza, the soldiers who killed the militant chief had not expected to run across him, Israeli officials said.', 'By Ronen Bergman, Aaron Boxerman, Raja Abdulrahim, Patrick Kingsley and Michael Levenson', 'The New York Times', 'world', '2024-10-17 14:03:43', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(33, 'Yahya Sinwar, Leader of Hamas, Is Dead', 'Mr. Sinwar climbed the ranks of the Palestinian militant group to plot the deadliest attack on Israel in its history.', 'By Ben Hubbard', 'The New York Times', 'world', '2024-10-17 07:41:52', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(34, 'Israeli Military Drone Footage Claims to Show Sinwar Shortly Before He Was Killed', 'The video shows a room that matches photographs obtained by The Times that show the corpse of a man closely resembling the Hamas leader.', 'By Aric Toler and Christiaan Triebert', 'The New York Times', 'world', '2024-10-17 13:49:45', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(35, 'Sinwar Is Dead. Will the Fighting Stop?', 'The killing of Hamas’s leader may allow Israel to claim victory and agree to a cease-fire, and new Hamas leadership could be more open to compromise. But neither side is likely to immediately change course.', 'By Patrick Kingsley', 'The New York Times', 'world', '2024-10-17 08:49:44', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(36, 'Trump’s Meandering Speeches Motivate His Critics and Worry His Allies', 'Some advisers and allies of former President Donald J. Trump are concerned about his scattershot style on the campaign trail as he continues to veer off script.', 'By Michael C. Bender', 'The New York Times', 'us', '2024-10-17 09:22:57', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(37, 'Best, Worst and Most Awkward Lines at the Al Smith Dinner', 'Donald J. Trump and Kamala Harris both delivered remarks, Ms. Harris via taped video and Mr. Trump in person in a ballroom in Manhattan.', 'By Michael Gold', 'The New York Times', 'us', '2024-10-17 19:37:07', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(38, 'Nevada’s Senate Rivals Spar in a Debate Heavy on Policy and Light on Fireworks', 'Senator Jacky Rosen and her Republican challenger, Sam Brown, met for their only debate, focusing on the cost of living, abortion and other issues.', 'By Kellen Browning and Benjamin Oreskes', 'The New York Times', 'us', '2024-10-17 18:38:40', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(39, 'Meet the Candidate: Elon Musk', 'The billionaire is spending a fortune to support former President Donald J. Trump. But at a town hall event in Pennsylvania, he looked an awful lot like a politician himself.', 'By Theodore Schleifer', 'The New York Times', 'us', '2024-10-17 16:39:58', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(40, 'Microsoft and OpenAI’s Close Partnership Shows Signs of Fraying', 'The “best bromance in tech” has had a reality check as OpenAI has tried to change its deal with Microsoft and the software maker has tried to hedge its bet on the start-up.', 'By Cade Metz, Mike Isaac and Erin Griffith', 'The New York Times', 'technology', '2024-10-17 15:26:11', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(41, 'Texas Supreme Court Halts Execution in Shaken Baby Case', 'Robert Roberson had been set to be executed on Thursday night for the death of his 2-year-old child. But after a bipartisan intervention by Texas lawmakers, the Supreme Court issued a stay.', 'By J. David Goodman', 'The New York Times', 'us', '2024-10-17 08:10:53', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(42, 'They Came for the Music. They Left With Draft Officers for Ukraine’s Army.', 'Men who attended the Kyiv concert of a popular rock band had their papers checked on the way out. Some were detained. Tickets to subsequent shows suddenly became available.', 'By Maria Varenikova', 'The New York Times', 'world', '2024-10-17 18:31:12', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(43, 'U.S. Charges Indian Official in New York Assassination Plot', 'The United States and Canada have worked together to investigate what they say is the Indian government’s campaign against Sikh separatists.', 'By Devlin Barrett', 'The New York Times', 'us', '2024-10-17 14:46:25', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(44, 'China’s Lackluster Growth Continues, Signaling Why Beijing Acted on Economy', 'Falling prices, weak consumer spending and a housing market crash help to explain why the Chinese government is taking steps to stimulate the economy.', 'By Keith Bradsher', 'The New York Times', 'business', '2024-10-17 16:32:26', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(45, 'What We Know About Liam Payne’s Death', 'A hotel desk manager called 911 with concerns about Payne, the former One Direction singer, shortly before he fell from a third-floor balcony. The results of toxicology reports are pending.', 'By Emmanuel Morgan and Lucía Cholakian Herrera', 'The New York Times', 'arts', '2024-10-17 08:25:08', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(46, 'One Direction Members Honor Liam Payne With Emotional Tributes', 'After hearing the news of Payne’s fatal fall from a hotel balcony, his groupmates, fans and collaborators shared their shock and grief.', 'By Lucía Cholakian Herrera and Maya Salam', 'The New York Times', 'arts', '2024-10-17 00:12:56', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(47, 'Mitzi Gaynor, Leading Lady of Movie Musicals, Is Dead at 93', 'She was best known for starring in the 1958 screen version of “South Pacific.” But her Hollywood career was brief, and she soon shifted her focus to Las Vegas and TV.', 'By Anita Gates', 'The New York Times', 'movies', '2024-10-17 07:53:54', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(48, 'How the Biden Team Plans to Build Peace From Sinwar’s Death', 'Will Israel take steps toward a Palestinian state?', 'By Thomas L. Friedman', 'The New York Times', 'opinion', '2024-10-17 09:42:21', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(49, 'This Is What It Takes to Get an Abortion in America', 'In text messages, videos, voice memos and pictures, we hear from the people at the frontlines of abortion access about how their worlds have changed.', 'By New York Times Opinion', 'The New York Times', 'opinion', '2024-10-16 18:34:11', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(50, 'Why the Heck Isn’t She Running Away With This?', 'After huge shifts in the electorate, it’s baffling that the two parties are still almost exactly evenly matched.', 'By David Brooks', 'The New York Times', 'opinion', '2024-10-17 13:30:09', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(51, 'How Trump’s Radical Tariff Plan Could Wreck Our Economy', 'There’s no upside to the former president’s pet economic plan.', 'By Paul Krugman', 'The New York Times', 'opinion', '2024-10-17 14:00:07', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(52, 'Texas Attorney General Sues Doctor Over Treatment for Transgender Minors', 'Ken Paxton, the attorney general, said it was the first enforcement action under a state ban on treatment.', 'By Amy Harmon', 'The New York Times', 'us', '2024-10-17 12:52:05', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(53, 'Groups That Run N.Y.C. Shelters Are Riddled With Problems, Report Finds', 'An extensive review by New York City’s Department of Investigation identified hundreds of issues, including financial mismanagement, nepotism and conflicts of interest.', 'By Amy Julia Harris', 'The New York Times', 'nyregion', '2024-10-17 13:13:31', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(54, 'Father and Son Indicted on Murder Charges for Georgia School Shooting', 'A grand jury handed up charges against a 14-year-old who is accused of killing four people at his high school. His father is accused of giving him access to the murder weapon.', 'By Rick Rojas', 'The New York Times', 'us', '2024-10-17 11:35:20', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(55, 'Making Room for ‘Cosmopolitan Plants’ Among Native Species', 'The landscape designer Donald Pell believes using a wider palette with nonnatives from around the world can add joy to gardens.', 'By Margaret Roach', 'The New York Times', 'realestate', '2024-10-15 23:30:46', '2024-10-18 00:31:18', '2024-10-18 00:31:18'),
(56, 'Packers vs Texans in winter warning game, score, live updates, Tucker Kraft, Donatayvion Wicks with touchdowns - Milwaukee Journal Sentinel', 'It\'s a white out at Lambeau Field today for the Green Bay Packers\' game against the Houston Texans.\r\nJordan Love and the Packers (4-2), who will be all decked out in white uniforms and helmets for th… [+15826 chars]', 'Christopher Kuhagen', 'NewsAPI', 'General', '2024-10-20 12:41:15', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(57, 'Georgia authorities investigating the ‘catastrophic’ failure of a 3-year-old boat dock gangway that killed 7 - CNN', 'Authorities are i\r\nnvestigating the cause of a partial ferry dock collapse on Georgias Sapelo Island that turned a day of celebration into tragedy, leaving at least seven dead and six critically inju… [+7516 chars]', 'Dalia Faheid, Ashley R. Williams, Michelle Watson, Melissa Alonso', 'NewsAPI', 'General', '2024-10-20 12:40:00', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(58, 'Trump visiting McDonald\'s while offering no evidence for saying Harris didn\'t work there in college - The Associated Press', 'FEASTERVILLE-TREVOSE, Pa. (AP) Republican presidential nominee Donald Trump manned the fry station at a McDonalds in Pennsylvania on Sunday before staging an impromptu news conference, answering ques… [+6078 chars]', 'MICHELLE L. PRICE, MARC LEVY', 'NewsAPI', 'General', '2024-10-20 12:14:00', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(59, 'Israel intensifies offensive in Gaza, Lebanon after Hamas leader\'s death - Reuters', 'No content available', 'Amina Ismail, Nidal Al-Mughrabi', 'NewsAPI', 'General', '2024-10-20 11:57:13', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(60, 'Trump’s closing pitch to voters begins with profane attacks and a lewd story about a Hall of Fame golfer - CNN', 'Donald Trump has pivoted to making his closing argument to voters heading into the final stretch of his race for the White House.\r\nOr so his campaign said Saturday as the former president took the st… [+4960 chars]', 'Steve Contorno, Kate Sullivan', 'NewsAPI', 'General', '2024-10-20 11:53:00', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(61, 'What to know about the electrical grid failure that plunged Cuba into darkness - The Associated Press', 'HAVANA (AP) Millions of people in Cuba were left without electricity for two days after the nations energy grid went down when one of the islands major power plants failed. The widespread blackout th… [+4347 chars]', 'ANDREA RODRIGUEZ', 'NewsAPI', 'General', '2024-10-20 11:51:00', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(62, 'New England Patriots vs. Jacksonville Jaguars | 2024 Week 7 Game Highlights - NFL', 'No content available', 'NFL', 'NewsAPI', 'General', '2024-10-20 11:20:41', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(63, 'Lions vs. Vikings: Live score updates, highlights, injury news - Pride Of Detroit', 'The NFL game of the week is being played in Minneapolis this Sunday. The 4-1 Detroit Lions take on the 5-0 Minnesota Vikings in a battle for the NFC North lead. The Lions success is hardly a surprise… [+5338 chars]', 'Jeremy Reisman', 'NewsAPI', 'General', '2024-10-20 11:15:00', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(64, 'Paul Whelan describes ‘torture’ of Russian prison - The Hill', 'Skip to content\r\nFormer Marine Paul Whelan described the “torture” he endured while being held captive in a Russian prison for years.\r\n“The Russian government wanted to put pressure on the United Sta… [+1265 chars]', 'Lauren Irwin', 'NewsAPI', 'General', '2024-10-20 11:11:00', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(65, 'At least 87 killed in Israeli strike on northern Gaza, health ministry says - CNN', 'At least 87 people were killed in an Israeli airstrike that hit several multi-story buildings overnight Saturday on Beit Lahia in northern Gaza, the enclaves health ministry said.\r\nThe number killed … [+3595 chars]', 'Abeer Salman, Ibrahim Dahman, Tim Lister', 'NewsAPI', 'General', '2024-10-20 10:52:00', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(66, 'Boeing sells small defense surveillance unit to Thales - Yahoo Finance', '(Reuters) -Boeing closed a deal this month to sell a small defense subsidiary that makes surveillance equipment for the U.S. military, the company said on Sunday, as the planemaker looks to shore up … [+1003 chars]', 'Reuters', 'NewsAPI', 'General', '2024-10-20 10:22:36', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(67, 'Elon Musk offers $1 million a day to entice swing state voters to sign petition - CNBC', 'Tesla CEO and X owner Elon Musk, who supports Republican presidential nominee former U.S. President Donald Trump, gestures as he speaks about voting during an America PAC Town Hall in Folsom, Pennsyl… [+5817 chars]', 'Lora Kolodny', 'NewsAPI', 'General', '2024-10-20 10:07:13', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(68, '‘Smile 2’ Leads Box Office With $23 Million Debut, A24’s ‘We Live in Time’ Cracks Top Five - Variety', '“Smile 2” has carved out a decent $23 million in its opening weekend, easily topping the otherwise sleepy North American box office charts.\r\nThe R-rated sequel to Paramount creepy psychological thril… [+4642 chars]', 'Rebecca Rubin', 'NewsAPI', 'General', '2024-10-20 09:40:00', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(69, 'The Highs, Lows, and Whoas of the 2024 Rock Hall Ceremony - Vulture', 'Remember when Jann Wenner was removed from the Rock &amp; Roll Hall of Fames board of directors? It seems like eons ago. The 2024 induction ceremony, held October 19 in Cleveland, was a five-and-a-ha… [+8439 chars]', 'Devon Ivie', 'NewsAPI', 'General', '2024-10-20 09:28:48', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(70, 'Coach Eric Nicksick: Francis Ngannou \'was questioning himself\' before PFL title win, entered with rib injury - MMA Junkie', 'RIYADH, Saudi Arabia In addition to the tremendous emotional and mental burden Francis Ngannou carried into PFL: Battle of the Giants following the tragic death of his son, he also overcame physical … [+4123 chars]', 'Mike Bohn', 'NewsAPI', 'General', '2024-10-20 09:00:00', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(71, '[Removed]', '[Removed]', NULL, 'NewsAPI', 'General', '2024-10-20 08:56:55', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(72, 'Here\'s What Absolutely Everyone Wore To The 2024 Academy Museum Gala - BuzzFeed', 'No content available', 'Mychal Thompson', 'NewsAPI', 'General', '2024-10-20 07:47:27', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(73, 'Hurricane Oscar makes landfall in the Bahamas, heads toward Cuba - CBS News', 'Hurricane Oscar made landfall early Sunday in the southeastern Bahamas and was heading toward Cuba.\r\nOscar, which the hurricane center characterized as \"very small,\" is the 15th named storm of the hu… [+2137 chars]', NULL, 'NewsAPI', 'General', '2024-10-20 07:24:33', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(74, 'Libyan arrested in Germany on suspicion of planning Israeli embassy attack - Al Jazeera English', 'A Libyan national with suspected ties to the ISIL (ISIS) group who was planning an attack on the Israeli embassy in Berlin has been arrested in Germany, the authorities said.\r\nPolice and other securi… [+1945 chars]', 'Al Jazeera', 'NewsAPI', 'General', '2024-10-20 07:22:59', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(75, 'O\'Leary calls out Kamala Harris\' \'huge miss\' for her campaign: This could have been a \'magic moment\' - Fox Business', 'During her first Fox News interview, Kamala Harris was pressed about the Biden administration\'s immigration strategy, where she missed a potentially \"incredible moment\" for her campaign, according to… [+2438 chars]', 'Kayla Bailey', 'NewsAPI', 'General', '2024-10-20 05:30:00', '2024-10-21 13:15:36', '2024-10-21 13:15:36'),
(76, 'Nottingham Forest v Crystal Palace: Premier League – live', 'No content available', NULL, 'The Guardian', 'football', '2024-10-21 13:14:00', '2024-10-21 13:15:38', '2024-10-21 13:15:38'),
(77, 'Met police officer who shot Chris Kaba acquitted of murder', 'No content available', NULL, 'The Guardian', 'uk-news', '2024-10-21 13:13:34', '2024-10-21 13:15:38', '2024-10-21 13:15:38'),
(78, 'Harris tells voters not to fall for Trump’s jokes; Central Park Five sue Trump for defamation – US elections live', 'No content available', NULL, 'The Guardian', 'us-news', '2024-10-21 13:10:13', '2024-10-21 13:15:38', '2024-10-21 13:15:38'),
(79, 'Middle East crisis live: US ‘deeply concerned’ about intelligence leak revealing Israel’s plans for strike on Iran', 'No content available', NULL, 'The Guardian', 'world', '2024-10-21 13:07:12', '2024-10-21 13:15:38', '2024-10-21 13:15:38'),
(80, 'US ‘deeply concerned’ by intelligence leak over Israel plan to attack Iran', 'No content available', NULL, 'The Guardian', 'us-news', '2024-10-21 12:56:51', '2024-10-21 13:15:38', '2024-10-21 13:15:38'),
(81, 'Hurricane Oscar dumps heavy rain across Cuba amid power outageT', 'No content available', NULL, 'The Guardian', 'world', '2024-10-21 12:52:05', '2024-10-21 13:15:38', '2024-10-21 13:15:38'),
(82, 'Honest Bob Jenrick won’t sleep until everyone sees he’s the maddest person in the room | John Crace', 'No content available', NULL, 'The Guardian', 'politics', '2024-10-21 12:42:51', '2024-10-21 13:15:38', '2024-10-21 13:15:38'),
(83, 'Nursing boss tells Letby inquiry she ‘pleaded’ with hospital to contact police', 'No content available', NULL, 'The Guardian', 'uk-news', '2024-10-21 12:37:42', '2024-10-21 13:15:38', '2024-10-21 13:15:38'),
(84, 'Employment rights reforms ‘could cost UK businesses £5bn a year’', 'No content available', NULL, 'The Guardian', 'law', '2024-10-21 12:33:26', '2024-10-21 13:15:38', '2024-10-21 13:15:38'),
(85, 'Can Democrats still win in rural states? Montana’s Senate race offers litmus test', 'No content available', NULL, 'The Guardian', 'us-news', '2024-10-21 12:30:42', '2024-10-21 13:15:38', '2024-10-21 13:15:38'),
(86, 'As Harris Courts Sun Belt, Housing Costs Stand in Her Way', 'Shuttered factories and trade deals helped turn working-class Midwesterners against Democrats. Will the high cost of housing do the same in the Sun Belt?', 'By Jennifer Medina', 'The New York Times', 'us', '2024-10-21 07:36:11', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(87, 'Cheney, With Harris, Tells Anti-Abortion Women It’s OK to Back Her', 'The Republican former congresswoman, long opposed to abortion rights, suggested as she campaigned with Vice President Kamala Harris that G.O.P. restrictions had gone overboard.', 'By Erica L. Green and Reid J. Epstein', 'The New York Times', 'us', '2024-10-21 08:18:34', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(88, 'Sinwar Is Dead, but a Palestinian State Seems More Distant Than Ever', 'A two-state solution remains the goal of the United States and the West, but many in the region say the devastation in Gaza and the lack of effective Palestinian leadership make it a remote prospect.', 'By Steven Erlanger', 'The New York Times', 'world', '2024-10-21 03:01:21', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(89, '‘Monotonous and Filthy’: Paul Whelan’s Life in a Russian Prison', 'The former U.S. Marine describes the moment of his arrest and the long years waiting for his release.', 'By Neil MacFarquhar', 'The New York Times', 'world', '2024-10-21 06:30:18', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(90, 'How Aleksei Navalny’s Prison Diaries Got Published', 'In his posthumous memoir, compiled with help from his widow, Yulia Navalnaya, Navalny faced the fact that Vladimir Putin might succeed in silencing him. The book will keep “his legacy alive,” Navalnaya said.', 'By Alexandra Alter', 'The New York Times', 'books', '2024-10-20 14:31:48', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(91, 'How a TV Hit Sparked Debate About Having Too Many Babies', 'The Sani family in northern Nigeria has six children, more than the parents can afford but fewer than their own parents had. Birthrates, and the decisions couples make about family size, are changing across Africa.', 'By Ruth Maclean and Yagazie Emezi', 'The New York Times', 'world', '2024-10-20 18:31:29', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(92, 'When Critic vs. Choreographer Ignited a Cultural Firestorm', 'Thirty years ago, Bill T. Jones presented “Still/Here,” and the critic Arlene Croce responded with an explosive essay. Now the work is returning to the Brooklyn Academy.', 'By Gia Kourlas', 'The New York Times', 'arts', '2024-10-21 06:00:15', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(93, 'Life Without Sickle Cell Beckons Boy Who Completed Gene Therapy', 'After 44 days, Kendric Cromer, 12, left the hospital. While his family feels fortunate that he was the first to receive a treatment, their difficult experiences hint at what others will be up against.', 'By Gina Kolata and Kenny Holston', 'The New York Times', 'health', '2024-10-21 04:19:30', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(94, 'Why Does This Building by the Subway Need 193 Parking Spots? (Yes, Exactly 193.)', 'New York and cities across the country reconsider decades-old parking rules.', 'By Emily Badger, Mihir Zaveri and Larry Buchanan', 'The New York Times', 'upshot', '2024-10-20 23:33:33', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(95, 'Liberty Finally Give New York City a Basketball Championship', 'New York got its first basketball championship in 48 years, as the New York Liberty beat the Minnesota Lynx in front of exuberant fans in Brooklyn.', 'By David Waldstein', 'The New York Times', 'nyregion', '2024-10-20 21:30:23', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(96, 'After 43 Years, Yankees and Dodgers Resume Their World Series Rivalry', 'Even as the sport and the country have changed, the rivalry has produced some of baseball’s most memorable moments.', 'By Victor Mather', 'The New York Times', 'sports', '2024-10-21 00:10:21', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(97, 'A Writer Sees Leniency in the Supreme Court’s Approach to Public Corruption', 'A Georgetown law professor argues that five rulings by the justices in recent years have allowed behavior that is “sketchy as hell” and meant to make the judiciary look good by contrast.', 'By Adam Liptak', 'The New York Times', 'us', '2024-10-20 23:33:53', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(98, 'Trial Begins in Fatal Choking of Homeless Man on Subway', 'Daniel Penny, who put the man, Jordan Neely, in a chokehold last year, told investigators that Mr. Neely posed a deadly threat. The killing polarized New York.', 'By Maria Cramer', 'The New York Times', 'nyregion', '2024-10-20 21:30:14', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(99, 'Kamala Harris Has an Unexpected Ally', 'If Trump wins, we’re going to be saddled with an isolationist and nativist conservative movement for generations to come.', 'By Gail Collins and Bret Stephens', 'The New York Times', 'opinion', '2024-10-20 23:32:10', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(100, 'How Kamala Harris Should Put America First — for Real', 'As president, she can create a foreign policy fit for the 21st century.', 'By Stephen Wertheim', 'The New York Times', 'opinion', '2024-10-20 23:31:44', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(101, 'Bad News: We’ve Lost Control of Our Social Media Feeds. Good News: Courts Are Noticing.', 'A case involving TikTok may have opened the door to holding platforms liable for the damage they cause.', 'By Julia Angwin', 'The New York Times', 'opinion', '2024-10-20 23:33:09', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(102, 'Why Trump’s Chances Are Better Than They Look', 'For many undecided voters, the inflation issue isn’t going away.', 'By Patrick Healy', 'The New York Times', 'opinion', '2024-10-20 23:34:06', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(103, 'Is Donald Trump an Isolationist?', 'We explore the stakes of another Trump presidency in terms of foreign policy.', 'By David Leonhardt', 'The New York Times', 'briefing', '2024-10-21 01:09:45', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(104, 'What We Know About the Gangway Collapse That Killed 7 in Georgia', 'Disaster struck at the end of an annual cultural celebration on Sapelo Island. Twenty people went into the water, including seven people over the age of 70 who died.', 'By Hank Sanders', 'The New York Times', 'us', '2024-10-21 07:27:07', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(105, 'Meet the Florida Billionaire Who Wants to Be a Newspaper Baron', 'David Hoffmann has already bought 5 percent of one of America’s largest newspaper companies. Now, he wants to control the whole thing.', 'By Benjamin Mullin', 'The New York Times', 'business', '2024-10-20 23:34:37', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(106, 'Arkansas May Have Vast Lithium Reserves, Researchers Say', 'Federal and state researchers said there might be five million to 19 million tons of lithium, more than enough to meet the world’s demand for the battery ingredient.', 'By Ivan Penn and Rebecca F. Elliott', 'The New York Times', 'business', '2024-10-21 08:37:38', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(107, 'The 9/11 Defendants Were Captured Two Decades Ago. Why Hasn’t a Trial Started?', 'A new court, a death penalty case and even the weather have contributed to the go-slow process at Guantánamo Bay.', 'By Carol Rosenberg', 'The New York Times', 'us', '2024-10-20 23:30:09', '2024-10-21 13:15:41', '2024-10-21 13:15:41'),
(108, 'Daniel Nigro Fronted an Emo Band. Now He Makes Pop Smashes.', 'The songwriter and producer has helped craft huge albums with Chappell Roan and Olivia Rodrigo. What’s the key to his success? “Dan always believed in me,” Roan said.', 'By Craig Marks', 'The New York Times', 'arts', '2024-10-20 23:31:46', '2024-10-21 13:15:41', '2024-10-21 13:15:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

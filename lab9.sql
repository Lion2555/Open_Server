-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.0
-- Время создания: Ноя 20 2024 г., 09:32
-- Версия сервера: 8.0.35
-- Версия PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `project_lab9`
--

-- --------------------------------------------------------

--
-- Структура таблицы `files`
--

CREATE TABLE `files` (
  `id` bigint UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_url` text NOT NULL,
  `project_id` bigint UNSIGNED DEFAULT NULL,
  `task_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `files`
--

INSERT INTO `files` (`id`, `file_name`, `file_url`, `project_id`, `task_id`) VALUES
(1, 'Server.js', 'http://disk.com/files/server.js', 1, NULL),
(2, 'AI.png', 'http://disk.com/files/ai.png', NULL, 1),
(3, 'AppSpecifications.pdf', 'http://disk.com/files/app_specifications.pdf', 2, NULL),
(4, 'APIDocumentation.docx', 'http://disk.com/files/api_documentation.docx', NULL, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `id` bigint UNSIGNED NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`id`, `project_name`, `project_description`) VALUES
(1, 'Website', 'Any website description'),
(2, 'Mobile app', 'Developing a mobile application for iOS and Android platforms.');

-- --------------------------------------------------------

--
-- Структура таблицы `project_users`
--

CREATE TABLE `project_users` (
  `id` bigint UNSIGNED NOT NULL,
  `project_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `project_users`
--

INSERT INTO `project_users` (`id`, `project_id`, `user_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 2),
(5, 2, 3),
(6, 2, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `project_id` bigint UNSIGNED NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `task_description` text,
  `author_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `project_id`, `task_name`, `task_description`, `author_id`) VALUES
(1, 1, 'Create AI', 'Design the initial wireframes for the homepage and key sections.', 1),
(2, 2, 'Set Up Backend API', 'Develop the backend API endpoints for data retrieval.', 2),
(3, 1, 'Implement UI Components', 'Build and integrate UI components into the frontend.', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `task_assignees`
--

CREATE TABLE `task_assignees` (
  `id` bigint UNSIGNED NOT NULL,
  `task_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `task_assignees`
--

INSERT INTO `task_assignees` (`id`, `task_id`, `user_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 3),
(4, 2, 4),
(5, 3, 1),
(6, 1, 2),
(7, 1, 3),
(8, 2, 3),
(9, 2, 4),
(10, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `user_name`, `email`) VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Smith', 'jane.smith@example.com'),
(3, 'Michael Brown', 'michael.brown@example.com'),
(4, 'Emily Davis', 'emily.davis@example.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_id` (`id`);

--
-- Индексы таблицы `project_users`
--
ALTER TABLE `project_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Индексы таблицы `task_assignees`
--
ALTER TABLE `task_assignees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `project_users`
--
ALTER TABLE `project_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `task_assignees`
--
ALTER TABLE `task_assignees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `files_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `project_users`
--
ALTER TABLE `project_users`
  ADD CONSTRAINT `project_users_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `task_assignees`
--
ALTER TABLE `task_assignees`
  ADD CONSTRAINT `task_assignees_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_assignees_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

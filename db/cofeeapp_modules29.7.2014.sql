

CREATE TABLE IF NOT EXISTS `cofeeapp_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `parent_module` varchar(255) NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cofeeapp_modules`
--

INSERT INTO `cofeeapp_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`, `parent_module`) VALUES
('location_add', 'location_add_desc', 0, 'add', 'locations'),
('items_add_category', 'items_add_category_desc', 0, 'add_category', 'items'),
('employees_add_employee', 'employees_add_employee_desc', 0, 'add_employee', 'employees'),
('items_add_item', 'items_add_item_desc', 0, 'add_item', 'items'),
('plans_add_plan', 'plans_add_plan_desc', 0, 'add_plan', 'plans'),
('module_config', 'module_config_desc', 100, 'config', '0'),
('module_customers', 'module_customers_desc', 10, 'customers', '0'),
('module_employees', 'module_employees_desc', 80, 'employees', '0'),
('module_items', 'module_items_desc', 20, 'items', '0'),
('module_locations', 'module_locations_desc', 90, 'locations', '0'),
('location_manage', 'location_manage_desc', 0, 'manage', 'locations'),
('employees_manage_employee', 'employees_manage_employee_desc', 0, 'manage_employee', 'employees'),
('module_plans', 'module_plans_desc', 0, 'plans', '0'),
('plans_add', 'plans_add_desc', 0, 'plans_add', 'plans'),
('plans_manage', 'plans_manage_desc', 0, 'plans_manage', 'plans'),
('module_reports', 'module_reports_desc', 50, 'reports', '0'),
('items_show_category', 'items_show_category_desc', 0, 'show_category', 'items');

CREATE TABLE IF NOT EXISTS `cofeeapp_permissions` (
  `module_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`module_id`,`person_id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cofeeapp_permissions`
--

INSERT INTO `cofeeapp_permissions` (`module_id`, `person_id`) VALUES
('add', 1),
('add_category', 1),
('add_employee', 1),
('add_item', 1),
('config', 1),
('customers', 1),
('employees', 1),
('items', 1),
('locations', 1),
('manage', 1),
('manage_employee', 1),
('module_plans', 1),
('plans', 1),
('plans_add', 1),
('plans_manage', 1),
('show_category', 1),
('subscriptions', 1),
('add_category', 24),
('add_employee', 24),
('add_item', 24),
('config', 24),
('customers', 24),
('employees', 24),
('items', 24),
('module_plans', 24),
('plans', 24),
('plans_add', 24),
('plans_manage', 24),
('show_category', 24),
('subscriptions', 24),
('items', 25),
('subscriptions', 25);

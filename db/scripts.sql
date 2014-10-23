--2014/07/22
RENAME TABLE  `cofee_app`.`s00_04_category` TO  `cofee_app`.`cofeeapp_category` 
RENAME TABLE  `cofee_app`.`m00_02_item` TO  `cofee_app`.`cofeeapp_items` ;
RENAME TABLE  `cofee_app`.`m00_03_images` TO  `cofee_app`.`cofeeapp_images` ;
ALTER TABLE  `cofeeapp_category` CHANGE  `parent_category`  `parent_category` INT( 11 ) NULL DEFAULT  '0'
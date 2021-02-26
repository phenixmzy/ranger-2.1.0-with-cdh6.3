-- Licensed to the Apache Software Foundation (ASF) under one or more
-- contributor license agreements.  See the NOTICE file distributed with
-- this work for additional information regarding copyright ownership.
-- The ASF licenses this file to You under the Apache License, Version 2.0
-- (the "License"); you may not use this file except in compliance with
-- the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

/* Add new column `tags` in table */
DROP PROCEDURE IF EXISTS add_column_xa_access_audit_tags;

DELIMITER ;;
CREATE PROCEDURE add_column_xa_access_audit_tags() BEGIN
  IF EXISTS (SELECT * FROM information_schema.tables WHERE table_schema=database() AND table_name = 'xa_access_audit') THEN
    IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=database() AND table_name = 'x_access_audit' AND column_name = 'tags') THEN
      ALTER TABLE xa_access_audit ADD COLUMN `tags` VARCHAR(4000) DEFAULT NULL NULL;
    END IF;
  END IF;
END;;

DELIMITER ;
CALL add_column_xa_access_audit_tags();

DROP PROCEDURE IF EXISTS add_column_xa_access_audit_tags;

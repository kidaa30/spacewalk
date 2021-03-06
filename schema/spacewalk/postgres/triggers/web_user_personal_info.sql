-- oracle equivalent source sha1 f08959a50851ee2c77b3c94cee08dc225ea4a7be

--
-- Copyright (c) 2008--2012 Red Hat, Inc.
--
-- This software is licensed to you under the GNU General Public License,
-- version 2 (GPLv2). There is NO WARRANTY for this software, express or
-- implied, including the implied warranties of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
-- along with this software; if not, see
-- http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
-- 
-- Red Hat trademarks are not licensed under GPLv2. No permission is
-- granted to use or replicate Red Hat trademarks that are incorporated
-- in this software or its documentation. 
--
--
--
--
-- triggers for web_user_personal_info

create or replace function web_user_pi_timestamp_fun() returns trigger as
$$
begin
  new.modified := current_timestamp;

  return new;
end;
$$ language plpgsql;


create trigger
web_user_pi_timestamp
BEFORE INSERT OR UPDATE ON web_user_personal_info
FOR EACH ROW
execute procedure web_user_pi_timestamp_fun();

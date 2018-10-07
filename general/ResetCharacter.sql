-- replace @steamid by steam of the one you want to delete
SET @steamid = 'steam:110000xxxxxx';

DELETE FROM addon_account_data WHERE owner = @steamid;
DELETE FROM addon_inventory_items WHERE owner = @steamid;
DELETE FROM billing WHERE identifier = @steamid;
DELETE FROM billing WHERE sender = @steamid;
DELETE FROM datastore_data WHERE owner = @steamid;
DELETE FROM owned_properties WHERE owner = @steamid;
DELETE FROM owned_vehicles WHERE owner = @steamid;
DELETE FROM playersTattoos WHERE identifier = @steamid;
DELETE FROM rented_vehicles WHERE owner = @steamid;
DELETE FROM user_accounts WHERE identifier = @steamid;
DELETE FROM user_contacts WHERE identifier = @steamid;
DELETE FROM user_inventory WHERE identifier = @steamid;
DELETE FROM user_licenses WHERE owner = @steamid;
DELETE FROM user_parkings WHERE identifier = @steamid;
DELETE FROM user_contacts WHERE number IN (SELECT phone_number FROM users WHERE @steamid);
DELETE FROM characters WHERE identifier = @steamid;
DELETE FROM users WHERE identifier = @steamid;
